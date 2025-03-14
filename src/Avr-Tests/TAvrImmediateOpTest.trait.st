Trait {
	#name : 'TAvrImmediateOpTest',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrImmediateOpTest >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrImmediateOpTest >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrImmediateOpTest >> testFromWord [

	| op word |
	op := self newOp.
	op immediate: 0.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op immediate equals: 0.
	op := self newOp.
	op immediate: -2000.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op immediate equals: -2000.
	op := self newOp.
	op immediate: 2000.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op immediate equals: 2000
]

{ #category : 'tests' }
TAvrImmediateOpTest >> testImmediateRange [

	self assert: self newOp immediateRange isCollection
]

{ #category : 'tests' }
TAvrImmediateOpTest >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrImmediateOpTest >> testSelector [

	self assert: self newOp selector isSymbol
]
