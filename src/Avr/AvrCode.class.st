Class {
	#name : 'AvrCode',
	#superclass : 'Object',
	#instVars : [
		'address',
		'op'
	],
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'accessing' }
AvrCode >> address [

	^ address
]

{ #category : 'accessing' }
AvrCode >> address: anObject [

	address := anObject
]

{ #category : 'accessing' }
AvrCode >> op [

	^ op
]

{ #category : 'accessing' }
AvrCode >> op: anObject [

	op := anObject
]

{ #category : 'printing' }
AvrCode >> printOn: aStream [

	aStream
		nextPutAll: (address
				 ifNil: [ '    ' ]
				 ifNotNil: [
					 (address printStringBase: 16 length: 4 padded: false)
						 asLowercase ]);
		nextPut: $:;
		nextPut: Character tab.
	op ifNil: [ ^ self ].
	op binaryCodes do: [ :each |
		aStream
			nextPutAll:
				(each printStringBase: 16 length: 2 padded: true) asLowercase;
			nextPut: Character space ].
	aStream nextPut: Character tab.
	self printOpOn: aStream
]

{ #category : 'printing' }
AvrCode >> printOpOn: aStream [

	op ifNil: [ ^ self ].
	aStream
		nextPutAll: op mnemonic asLowercase;
		nextPut: Character tab;
		nextPutAll: op operandText asLowercase
]

{ #category : 'printing' }
AvrCode >> printOpOn: aStream using: aDictionary [

	op ifNil: [ ^ self ].
	aStream nextPutAll: op mnemonic asLowercase.
	op operandText isEmpty ifTrue: [ ^ self ].
	aStream nextPut: Character tab.
	self printOperandOn: aStream using: aDictionary
]

{ #category : 'printing' }
AvrCode >> printOperandOn: aStream using: aDictionary [

	| labelAddress |
	labelAddress := nil.
	op isAbsolute ifTrue: [
		op immediate isString ifTrue: [
			^ aStream
				  nextPut: $@;
				  nextPutAll: op immediate ].
		labelAddress := op immediate * 2 ].
	op isRelative ifTrue: [
		op immediate isString ifTrue: [
			^ aStream
				  nextPut: $@;
				  nextPutAll: op immediate ].
		labelAddress := address + op codeSize + (op immediate * 2) ].
	aDictionary at: labelAddress ifPresent: [ :label |
		^ aStream
			  nextPut: $@;
			  nextPutAll: label ].
	aStream nextPutAll: op operandText
]
