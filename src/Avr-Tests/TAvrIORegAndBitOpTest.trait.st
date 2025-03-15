Trait {
	#name : 'TAvrIORegAndBitOpTest',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrIORegAndBitOpTest >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrIORegAndBitOpTest >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrIORegAndBitOpTest >> testFromWord [

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
	op register: 15.
	op immediate: 4.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op register equals: 15.
	self assert: op immediate equals: 4.
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
TAvrIORegAndBitOpTest >> testImmediateRange [

	| obj |
	obj := self newOp.
	self assert: obj immediateRange first equals: 0.
	self assert: obj immediateRange last equals: 7.
	self assert: obj immediateRange size equals: 8
]

{ #category : 'tests' }
TAvrIORegAndBitOpTest >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrIORegAndBitOpTest >> testOperand [

	| obj |
	obj := self newOp.
	obj register: 2r10010.
	obj immediate: 2r011.
	self assert: obj operand equals: 2r10010011
]

{ #category : 'tests' }
TAvrIORegAndBitOpTest >> testOperandText [

	| obj |
	obj := self newOp.
	self assert: obj operandText equals: 'nil, nil'.
	obj register: 5.
	obj immediate: 20.
	self assert: obj operandText equals: '0x5, 20'
]

{ #category : 'tests' }
TAvrIORegAndBitOpTest >> testRegisterRange [

	| obj |
	obj := self newOp.
	self assert: obj registerRange first equals: 0.
	self assert: obj registerRange last equals: 31.
	self assert: obj registerRange size equals: 32
]

{ #category : 'tests' }
TAvrIORegAndBitOpTest >> testSelector [

	self assert: self newOp selector isSymbol
]
