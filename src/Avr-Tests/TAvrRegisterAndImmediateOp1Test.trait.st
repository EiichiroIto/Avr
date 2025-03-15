Trait {
	#name : 'TAvrRegisterAndImmediateOp1Test',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrRegisterAndImmediateOp1Test >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp1Test >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp1Test >> testFromWord [

	| op word |
	op := self newOp.
	op register: 16.
	op immediate: 0.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op register equals: 16.
	self assert: op immediate equals: 0.
	op := self newOp.
	op register: 31.
	op immediate: 255.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op register equals: 31.
	self assert: op immediate equals: 255
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp1Test >> testImmediateRange [

	| obj |
	obj := self newOp.
	self assert: obj immediateRange first equals: 0.
	self assert: obj immediateRange last equals: 255.
	self assert: obj immediateRange size equals: 256
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp1Test >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp1Test >> testOperand [

	| obj |
	obj := self newOp.
	obj register: 26.
	obj immediate: 2r101000.
	self assert: obj operand equals: 2r1010101000
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp1Test >> testRegisterRange [

	| obj |
	obj := self newOp.
	self assert: obj registerRange first equals: 16.
	self assert: obj registerRange last equals: 31.
	self assert: obj registerRange size equals: 16
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp1Test >> testSelector [

	self assert: self newOp selector isSymbol
]
