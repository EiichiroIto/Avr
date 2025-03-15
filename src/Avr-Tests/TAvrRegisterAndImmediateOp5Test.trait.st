Trait {
	#name : 'TAvrRegisterAndImmediateOp5Test',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrRegisterAndImmediateOp5Test >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp5Test >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp5Test >> testImmediateRange [

	| obj |
	obj := self newOp.
	self assert: obj immediateRange first equals: -64.
	self assert: obj immediateRange last equals: 63.
	self assert: obj immediateRange size equals: 128
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp5Test >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp5Test >> testOperand [

	| obj |
	obj := self newOp.
	obj register: 2r101.
	obj immediate: -50.
	self assert: obj operand equals: 2r1001110101
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp5Test >> testRegisterRange [

	| obj |
	obj := self newOp.
	self assert: obj registerRange first equals: 0.
	self assert: obj registerRange last equals: 7.
	self assert: obj registerRange size equals: 8
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp5Test >> testSelector [

	self assert: self newOp selector isSymbol
]
