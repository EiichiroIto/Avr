Class {
	#name : 'AvrInstruction',
	#superclass : 'Object',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrInstruction >> arguments [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrInstruction >> binaryCodes [

	| code binaries |
	code := self opcode bitOr: self operand.
	binaries := (code asByteArrayOfSize: 2) reversed.
	^ self codeSize = 2
		  ifTrue: [ binaries ]
		  ifFalse: [
		  binaries , (self extendedCode asByteArrayOfSize: 2) reversed ]
]

{ #category : 'accessing' }
AvrInstruction >> category [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrInstruction >> codeSize [

	^ 2
]

{ #category : 'accessing' }
AvrInstruction >> description [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrInstruction >> extendedCode [

	^ nil
]

{ #category : 'accessing' }
AvrInstruction >> fromWord: anInteger [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrInstruction >> fromWord: anInteger withExtended: anInteger2 [

	self error
]

{ #category : 'testing' }
AvrInstruction >> hasAddress [

	^ false
]

{ #category : 'testing' }
AvrInstruction >> hasIO [

	^ false
]

{ #category : 'testing' }
AvrInstruction >> hasImmediate [

	^ false
]

{ #category : 'testing' }
AvrInstruction >> hasLabel [

	^ false
]

{ #category : 'testing' }
AvrInstruction >> isValid [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrInstruction >> machineWord [

	^ self opcode bitOr: self operand
]

{ #category : 'testing' }
AvrInstruction >> matches: anInteger [

	^ (anInteger bitAnd: self opcodeMask) = self opcode
]

{ #category : 'accessing' }
AvrInstruction >> messageText [

	^ ((self selector separateKeywords splitOn: '  ')
		   with: self arguments
		   collect: [ :sel :arg | sel , ' ' , arg asString ]) joinUsing:
		  Character space
]

{ #category : 'accessing' }
AvrInstruction >> mnemonic [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrInstruction >> opcode [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrInstruction >> opcodeMask [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrInstruction >> operand [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrInstruction >> operandText [

	self subclassResponsibility
]

{ #category : 'printing' }
AvrInstruction >> printAbsoluteAddress: anObject [

	anObject in: [ :value |
		value ifNil: [ ^ 'nil' ].
		value isString ifTrue: [ ^ '@' , value ].
		^ '0x' , (value * 2) printStringHex asLowercase ]
]

{ #category : 'printing' }
AvrInstruction >> printDecImmediate: anObject [

	anObject in: [ :value |
		value ifNil: [ ^ 'nil' ].
		value isString ifTrue: [ ^ '@' , value ].
		^ value printString ]
]

{ #category : 'printing' }
AvrInstruction >> printHexImmediate: anObject [

	anObject in: [ :value |
		value ifNil: [ ^ 'nil' ].
		value isString ifTrue: [ ^ '@' , value ].
		value isNumber ifTrue: [
			^ '0x'
			  , (value printStringBase: 16 length: 2 padded: true) asLowercase ].
		^ value asString ]
]

{ #category : 'printing' }
AvrInstruction >> printOn: aStream [

	aStream
		nextPutAll: self mnemonic asString asLowercase;
		nextPut: Character space;
		nextPutAll: self operandText
]

{ #category : 'printing' }
AvrInstruction >> printRelativeAddress: anObject [

	anObject in: [ :value |
		value ifNil: [ ^ 'nil' ].
		value isString ifTrue: [ ^ '@' , value ].
		^ value < 0
			  ifTrue: [ '.' , (value * 2) asString ]
			  ifFalse: [ '.+' , (value * 2) asString ] ]
]

{ #category : 'accessing' }
AvrInstruction >> selector [

	self subclassResponsibility
]
