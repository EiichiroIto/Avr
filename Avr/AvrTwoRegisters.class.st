Class {
	#name : 'AvrTwoRegisters',
	#superclass : 'AvrInstruction',
	#instVars : [
		'dest',
		'source'
	],
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrTwoRegisters >> arguments [

	^ Array with: dest with: source
]

{ #category : 'accessing' }
AvrTwoRegisters >> dest [

	^ dest
]

{ #category : 'accessing' }
AvrTwoRegisters >> dest: anObject [

	dest := anObject
]

{ #category : 'accessing' }
AvrTwoRegisters >> destRange [

	self subclassResponsibility
]

{ #category : 'testing' }
AvrTwoRegisters >> isValid [

	self source isInteger ifFalse: [ ^ false ].
	self dest isInteger ifFalse: [ ^ false ].
	^ (self sourceRange includes: self source) and: [
		  self destRange includes: self dest ]
]

{ #category : 'accessing' }
AvrTwoRegisters >> operandText [

	^ 'r' , dest asString , ', r' , source asString
]

{ #category : 'accessing' }
AvrTwoRegisters >> selector [

	^ (self mnemonic asLowercase , 'Dest:source:') asSymbol
]

{ #category : 'accessing' }
AvrTwoRegisters >> source [

	^ source
]

{ #category : 'accessing' }
AvrTwoRegisters >> source: anObject [

	source := anObject
]

{ #category : 'accessing' }
AvrTwoRegisters >> sourceRange [

	self subclassResponsibility
]
