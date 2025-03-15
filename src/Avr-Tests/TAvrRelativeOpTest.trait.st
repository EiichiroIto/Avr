Trait {
	#name : 'TAvrRelativeOpTest',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
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

{ #category : 'tests' }
TAvrRelativeOpTest >> testIsRelative [

	self assert: self newOp isRelative
]

{ #category : 'tests' }
TAvrRelativeOpTest >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrRelativeOpTest >> testOperand [

	| op |
	op := self newOp.
	op immediate: 50.
	self assert: op operand equals: 50 << 3.
	op immediate: -50.
	self assert: op operand equals: (2r1111111 bitAnd: -50) << 3
]

{ #category : 'tests' }
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
