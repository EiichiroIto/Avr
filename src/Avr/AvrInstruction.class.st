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
	self extendedCode ifNotNil: [ :ext |
		binaries := binaries , (ext asByteArrayOfSize: 2) reversed ].
	^ binaries
]

{ #category : 'accessing' }
AvrInstruction >> category [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrInstruction >> codeSize [

	^ self extendedCode ifNil: [ 2 ] ifNotNil: [ 4 ]
]

{ #category : 'accessing' }
AvrInstruction >> description [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrInstruction >> extendedCode [

	^ nil
]

{ #category : 'testing' }
AvrInstruction >> isAbsolute [

	^ false
]

{ #category : 'testing' }
AvrInstruction >> isRelative [

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
		^ '0x' , value printStringHex asLowercase ]
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
