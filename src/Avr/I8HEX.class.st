Class {
	#name : 'I8HEX',
	#superclass : 'Object',
	#instVars : [
		'binary',
		'binarySize'
	],
	#category : 'Avr-Utils',
	#package : 'Avr',
	#tag : 'Utils'
}

{ #category : 'instance creation' }
I8HEX class >> fromByteArray: aByteArray [

	^ self new
		  binary: aByteArray;
		  binarySize: aByteArray size;
		  yourself
]

{ #category : 'instance creation' }
I8HEX class >> fromFileNamed: aString [

	^ self new readFrom: aString asFileReference readStream
]

{ #category : 'accessing' }
I8HEX >> binary [

	^ binary
]

{ #category : 'accessing' }
I8HEX >> binary: anObject [

	binary := anObject
]

{ #category : 'accessing' }
I8HEX >> binarySize [

	^ binarySize
]

{ #category : 'accessing' }
I8HEX >> binarySize: anObject [

	binarySize := anObject
]

{ #category : 'constants' }
I8HEX >> defaultSize [

	^ 1024
]

{ #category : 'initialization' }
I8HEX >> initialize [

	binary := ByteArray new: self defaultSize.
	binarySize := 0
]

{ #category : 'private' }
I8HEX >> newSizeFor: anInteger [

	^ anInteger + self defaultSize + self defaultSize - 1
	  // self defaultSize * self defaultSize
]

{ #category : 'printing' }
I8HEX >> printOn: aStream [

	aStream
		nextPutAll: self class name;
		nextPutAll: '(';
		nextPutAll: binarySize asString;
		nextPutAll: ' bytes)'
]

{ #category : 'private' }
I8HEX >> put: anArray address: anInteger [

	anInteger + anArray size >= binary size ifTrue: [
		binary := binary grownBy:
			          (self newSizeFor: anInteger + anArray size) - binary size ].
	anArray doWithIndex: [ :each :index |
		binary at: anInteger + index put: each ].
	binarySize := binarySize max: anInteger + anArray size
]

{ #category : 'reading' }
I8HEX >> readFrom: aStream [

	| line arr |
	[ aStream atEnd ] whileFalse: [
		line := aStream nextLine.
		arr := self readString: line.
		arr first = 1 ifTrue: [ ^ self truncateToBinarySize ].
		arr first = 0 ifFalse: [ self error: 'Invalid record type' ].
		self put: arr third address: arr second ].
	self error: 'Invalid file end'
]

{ #category : 'private' }
I8HEX >> readString: aString [

	| byteCount address recordType data checkSum calcedCheckSum |
	data := nil.
	byteCount := address := recordType := checkSum := nil.
	aString readStreamDo: [ :stream |
		stream next = $: ifFalse: [ self error: 'Invalid start code' ].
		byteCount := Integer readFrom: (stream next: 2) base: 16.
		address := Integer readFrom: (stream next: 4) base: 16.
		recordType := Integer readFrom: (stream next: 2) base: 16.
		data := ByteArray new: byteCount.
		1 to: byteCount do: [ :each |
			data at: each put: (Integer readFrom: (stream next: 2) base: 16) ].
		checkSum := Integer readFrom: (stream next: 2) base: 16.
		stream atEnd ifFalse: [ self error: 'Invalid eol' ] ].
	calcedCheckSum := 0 - (data isEmpty
		                   ifTrue: [ 0 ]
		                   ifFalse: [ data sum ]) - byteCount - recordType
	                  - (address >> 8) - (address bitAnd: 16rFF) bitAnd:
		                  16rFF.
	calcedCheckSum = checkSum ifFalse: [ self error: 'Invalid checksum' ].
	^ Array with: recordType with: address with: data
]

{ #category : 'private' }
I8HEX >> truncateToBinarySize [

	binary := binary truncatedToSize: binarySize
]

{ #category : 'private' }
I8HEX >> writeAddress: anInteger count: anInteger2 to: aStream [

	| checkSum |
	aStream
		nextPut: $:;
		nextPutAll: (anInteger2 printStringBase: 16 length: 2 padded: true);
		nextPutAll: (anInteger printStringBase: 16 length: 4 padded: true);
		nextPutAll: '00'.
	checkSum := anInteger2 + (anInteger >> 8) + (anInteger bitAnd: 16rFF).
	1 to: anInteger2 do: [ :each |
		aStream nextPutAll: ((binary at: anInteger + each)
				 printStringBase: 16
				 length: 2
				 padded: true).
		checkSum := checkSum + (binary at: anInteger + each) ].
	checkSum := 0 - checkSum bitAnd: 16rFF.
	aStream
		nextPutAll: (checkSum printStringBase: 16 length: 2 padded: true);
		nextPutAll: String crlf
]

{ #category : 'private' }
I8HEX >> writeEndOfFileTo: aStream [

	aStream
		nextPutAll: ':00000001FF';
		nextPutAll: String crlf
]

{ #category : 'constants' }
I8HEX >> writeSize [

	^ 16
]

{ #category : 'writing' }
I8HEX >> writeTo: aStream [

	| address rest size |
	address := 0.
	rest := binarySize.
	[ rest > 0 ] whileTrue: [
		size := rest min: 16.
		self writeAddress: address count: size to: aStream.
		address := address + size.
		rest := rest - size ].
	self writeEndOfFileTo: aStream.
	aStream close
]
