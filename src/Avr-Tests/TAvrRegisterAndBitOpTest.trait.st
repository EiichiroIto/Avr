Trait {
	#name : 'TAvrRegisterAndBitOpTest',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrRegisterAndBitOpTest >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrRegisterAndBitOpTest >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrRegisterAndBitOpTest >> testFromWord [

	| op word |
	op := self newOp.
	op register: 0.
	op immediate: 0.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op register equals: 0.
	self assert: op immediate equals: 0.
	op := self newOp.
	op register: 31.
	op immediate: 7.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op register equals: 31.
	self assert: op immediate equals: 7
]

{ #category : 'tests' }
TAvrRegisterAndBitOpTest >> testImmediateRange [

	| obj |
	obj := self newOp.
	self assert: obj immediateRange first equals: 0.
	self assert: obj immediateRange last equals: 7.
	self assert: obj immediateRange size equals: 8
]

{ #category : 'tests' }
TAvrRegisterAndBitOpTest >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrRegisterAndBitOpTest >> testOperand [

	| obj |
	obj := self newOp.
	obj register: 2r10101.
	obj immediate: 2r101.
	self assert: obj operand equals: 2r101010101
]

{ #category : 'tests' }
TAvrRegisterAndBitOpTest >> testRegisterRange [

	| obj |
	obj := self newOp.
	self assert: obj registerRange first equals: 0.
	self assert: obj registerRange last equals: 31.
	self assert: obj registerRange size equals: 32
]

{ #category : 'tests' }
TAvrRegisterAndBitOpTest >> testSelector [

	self assert: self newOp selector isSymbol
]
