Class {
	#name : 'AvrProgram',
	#superclass : 'Object',
	#instVars : [
		'codes',
		'address',
		'labeler',
		'startAddress'
	],
	#category : 'Avr-Assembly',
	#package : 'Avr',
	#tag : 'Assembly'
}

{ #category : 'adding' }
AvrProgram >> add: anOpcode [

	codes add: anOpcode.
	address := address + anOpcode codeSize.
	self updateLabelUsing: anOpcode
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

	startAddress := 0.
	address := 0.
	codes := OrderedCollection new.
	labeler := self newLabeler
]

{ #category : 'accessing' }
AvrProgram >> label: aString [

	labeler labels at: address put: aString
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
			nextPutAll: 'self ';
			nextPutAll: each messageText;
			nextPut: $.;
			nextPut: Character cr ].
	^ stream contents
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
	labelAddress := nil.
	anOpcode isAbsolute ifTrue: [
		anOpcode immediate isString ifTrue: [
			^ aStream
				  nextPut: $@;
				  nextPutAll: anOpcode immediate ].
		labelAddress := anOpcode immediate * 2 ].
	anOpcode isRelative ifTrue: [
		anOpcode immediate isString ifTrue: [
			^ aStream
				  nextPut: $@;
				  nextPutAll: anOpcode immediate ].
		labelAddress := anInteger + anOpcode codeSize
		                + (anOpcode immediate * 2) ].
	(labeler labelAddressAt: labelAddress) ifNotNil: [ :label |
		^ aStream
			  nextPut: $@;
			  nextPutAll: label ].
	aStream nextPutAll: anOpcode operandText
]

{ #category : 'printing' }
AvrProgram >> printWithLabel [

	| stream addr |
	addr := startAddress.
	stream := String new writeStream.
	codes do: [ :each |
		(labeler labelAddressAt: addr) ifNotNil: [ :label |
			stream
				nextPutAll: label;
				nextPut: $:;
				nextPut: Character cr ].
		self printLabeledOp: each at: addr on: stream.
		addr := addr + each codeSize.
		stream nextPut: Character cr ].
	^ stream contents
]

{ #category : 'printing' }
AvrProgram >> printWithoutLabel [

	| stream addr |
	addr := startAddress.
	stream := String new writeStream.
	codes do: [ :each |
		self printOp: each at: addr on: stream.
		addr := addr + each codeSize.
		stream nextPut: Character cr ].
	^ stream contents
]

{ #category : 'accessing' }
AvrProgram >> startAddress [

	^ startAddress
]

{ #category : 'accessing' }
AvrProgram >> startAddress: anObject [

	startAddress := anObject
]

{ #category : 'private' }
AvrProgram >> updateLabelUsing: anOpcode [

	anOpcode isAbsolute ifTrue: [
		^ labeler labelAddressPut: anOpcode immediate * 2 ].
	anOpcode isRelative ifTrue: [
		^ labeler labelAddressPut: address + (anOpcode immediate * 2) ]
]
