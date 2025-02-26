Trait {
	#name : 'TAvrRelativeOpTest',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
TAvrRelativeOpTest >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrRelativeOpTest >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrRelativeOpTest >> testImmediateRange [

	self assert: self newOp immediateRange isCollection
]

{ #category : 'as yet unclassified' }
TAvrRelativeOpTest >> testIsRelative [

	self assert: self newOp isRelative
]

{ #category : 'as yet unclassified' }
TAvrRelativeOpTest >> testOperand [

	| op |
	op := self newOp.
	op immediate: 50.
	self assert: op operand equals: 50 << 3.
	op immediate: -50.
	self assert: op operand equals: (2r1111111 bitAnd: -50) << 3
]

{ #category : 'as yet unclassified' }
TAvrRelativeOpTest >> testOperandText [

	| op |
	op := self newOp.
	self assert: op operandText equals: 'nil'.
	op immediate: 50.
	self assert: op operandText equals: '.+100'.
	op immediate: -50.
	self assert: op operandText equals: '.-100'
]

{ #category : 'tests' }
TAvrRelativeOpTest >> testSelector [

	self assert: self newOp selector isSymbol
]
