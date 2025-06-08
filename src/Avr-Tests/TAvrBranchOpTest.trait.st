Trait {
	#name : 'TAvrBranchOpTest',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrBranchOpTest >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrBranchOpTest >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrBranchOpTest >> testFromWord [

	| op word |
	op := self newOp.
	op immediate: 0.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op immediate equals: 0.
	op := self newOp.
	op immediate: -60.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op immediate equals: -60.
	op := self newOp.
	op immediate: 60.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op immediate equals: 60
]

{ #category : 'tests' }
TAvrBranchOpTest >> testHasAddress [

	self assert: self newOp hasAddress
]

{ #category : 'tests' }
TAvrBranchOpTest >> testImmediateRange [

	self assert: self newOp immediateRange isCollection
]

{ #category : 'tests' }
TAvrBranchOpTest >> testIsRelative [

	self assert: self newOp isRelative
]

{ #category : 'tests' }
TAvrBranchOpTest >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrBranchOpTest >> testOperand [

	| op |
	op := self newOp.
	op immediate: 50.
	self assert: op operand equals: 50 << 3.
	op immediate: -50.
	self assert: op operand equals: (2r1111111 bitAnd: -50) << 3
]

{ #category : 'tests' }
TAvrBranchOpTest >> testOperandText [

	| op |
	op := self newOp.
	self assert: op operandText equals: 'nil'.
	op immediate: 50.
	self assert: op operandText equals: '.+100'.
	op immediate: -50.
	self assert: op operandText equals: '.-100'
]

{ #category : 'tests' }
TAvrBranchOpTest >> testRealAddressFor [

	| op |
	op := self newOp.
	op immediate: 10.
	self assert: (op realAddressFor: 123) equals: 123 + op codeSize + 20
]

{ #category : 'tests' }
TAvrBranchOpTest >> testSelector [

	self assert: self newOp selector isSymbol
]
