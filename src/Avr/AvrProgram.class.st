Class {
	#name : 'AvrProgram',
	#superclass : 'Object',
	#instVars : [
		'codes',
		'address',
		'labeler'
	],
	#category : 'Avr-Assembly',
	#package : 'Avr',
	#tag : 'Assembly'
}

{ #category : 'adding' }
AvrProgram >> add: anOpcode [

	codes add: (Array with: address with: anOpcode).
	address := address + anOpcode codeSize
]

{ #category : 'accessing' }
AvrProgram >> address [

	^ address
]

{ #category : 'accessing' }
AvrProgram >> address: anObject [

	address := anObject
]

{ #category : 'accessing' }
AvrProgram >> codeCount [

	^ codes size
]

{ #category : 'accessing' }
AvrProgram >> codes [

	^ codes
]

{ #category : 'accessing' }
AvrProgram >> codes: anObject [

	codes := anObject
]

{ #category : 'initialization' }
AvrProgram >> initialize [

	address := 0.
	codes := OrderedCollection new.
	labeler := self newLabeler
]

{ #category : 'accessing' }
AvrProgram >> label: aString [

	labeler labelNameAt: aString put: address
]

{ #category : 'accessing' }
AvrProgram >> labelAddressPut: anInteger [

	labeler labelAddressPut: anInteger
]

{ #category : 'accessing' }
AvrProgram >> labelNameAt: aSymbol [

	^ labeler labelNameAt: aSymbol
]

{ #category : 'accessing' }
AvrProgram >> labeler [

	^ labeler
]

{ #category : 'accessing' }
AvrProgram >> labeler: anObject [

	labeler := anObject
]

{ #category : 'instance creation' }
AvrProgram >> newLabeler [

	^ AvrLabeler new
]

{ #category : 'instance creation' }
AvrProgram >> newResolver [

	^ AvrLabelResolver new
		  labeler: labeler;
		  yourself
]

{ #category : 'printing' }
AvrProgram >> printLabeledOp: anOpcode at: anInteger on: aStream [

	anOpcode ifNil: [ ^ self ].
	aStream nextPutAll: anOpcode mnemonic asLowercase.
	anOpcode operandText isEmpty ifTrue: [ ^ self ].
	aStream nextPut: Character tab.
	self printOperandOf: anOpcode at: anInteger on: aStream
]

{ #category : 'printing' }
AvrProgram >> printMethodString [

	| stream |
	stream := String new writeStream.
	codes do: [ :each |
		stream
			nextPutAll: 'asm ';
			nextPutAll: each second messageText;
			nextPut: $.;
			nextPut: Character cr ].
	^ stream contents
]

{ #category : 'printing' }
AvrProgram >> printOn: aStream [

	| bytes |
	bytes := 0.
	codes isEmpty ifFalse: [
		bytes := codes last first + codes last second codeSize ].
	aStream
		nextPutAll: self class name;
		nextPutAll: '(';
		nextPutAll: bytes asString;
		nextPutAll: ' bytes, ';
		nextPutAll: codes size asString;
		nextPutAll: ' ops)'
]

{ #category : 'printing' }
AvrProgram >> printOp: anOpcode at: anInteger on: aStream [

	aStream
		nextPutAll: (anInteger
				 ifNil: [ '    ' ]
				 ifNotNil: [
					 (anInteger printStringBase: 16 length: 4 padded: false)
						 asLowercase ]);
		nextPut: $:;
		nextPut: Character tab.
	anOpcode ifNil: [ ^ self ].
	anOpcode binaryCodes do: [ :each |
		aStream
			nextPutAll:
				(each printStringBase: 16 length: 2 padded: true) asLowercase;
			nextPut: Character space ].
	aStream nextPut: Character tab.
	self printOp: anOpcode on: aStream
]

{ #category : 'printing' }
AvrProgram >> printOp: anOpcode on: aStream [

	anOpcode ifNil: [ ^ self ].
	aStream
		nextPutAll: anOpcode mnemonic asLowercase;
		nextPut: Character tab;
		nextPutAll: anOpcode operandText
]

{ #category : 'printing' }
AvrProgram >> printOperandOf: anOpcode at: anInteger on: aStream [

	| labelAddress |
	anOpcode hasImmediate ifTrue: [
		anOpcode immediate isString ifTrue: [
			^ aStream
				  nextPut: $@;
				  nextPutAll: anOpcode immediate ] ].
	anOpcode hasAddress ifTrue: [
		labelAddress := anOpcode realAddressFor: anInteger.
		(labeler labelAddressAt: labelAddress) ifNotNil: [ :label |
			^ aStream
				  nextPut: $@;
				  nextPutAll: label ] ].
	aStream nextPutAll: anOpcode operandText
]

{ #category : 'printing' }
AvrProgram >> printWithLabel [

	| stream addr |
	stream := String new writeStream.
	codes do: [ :each |
		addr := each first.
		(labeler labelAddressAt: addr) ifNotNil: [ :label |
			stream
				nextPutAll: label;
				nextPut: $:;
				nextPut: Character cr ].
		self printLabeledOp: each second at: addr on: stream.
		stream nextPut: Character cr ].
	^ stream contents
]

{ #category : 'printing' }
AvrProgram >> printWithoutLabel [

	| stream addr |
	stream := String new writeStream.
	codes do: [ :each |
		addr := each first.
		self printOp: each second at: addr on: stream.
		stream nextPut: Character cr ].
	^ stream contents
]

{ #category : 'private' }
AvrProgram >> resolvedCodes [

	^ self newResolver resolveCollection: codes
]

{ #category : 'accessing' }
AvrProgram >> validatedCodes [

	| list |
	list := self resolvedCodes.
	list do: [ :each |
		each second isValid ifFalse: [
			self error: each first asString , ':' , each second asString ] ].
	^ list
]
