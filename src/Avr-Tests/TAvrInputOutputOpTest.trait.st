Trait {
	#name : 'TAvrInputOutputOpTest',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrInputOutputOpTest >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrInputOutputOpTest >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrInputOutputOpTest >> testImmediateRange [

	| obj |
	obj := self newOp.
	self assert: obj immediateRange first equals: 0.
	self assert: obj immediateRange last equals: 63.
	self assert: obj immediateRange size equals: 64
]

{ #category : 'tests' }
TAvrInputOutputOpTest >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrInputOutputOpTest >> testOperand [

	| obj |
	obj := self newOp.
	obj register: 2r10100.
	obj immediate: 2r110011.
	self assert: obj operand equals: 2r11101000011
]

{ #category : 'tests' }
TAvrInputOutputOpTest >> testRegisterRange [

	| obj |
	obj := self newOp.
	self assert: obj registerRange first equals: 0.
	self assert: obj registerRange last equals: 31.
	self assert: obj registerRange size equals: 32
]

{ #category : 'tests' }
TAvrInputOutputOpTest >> testSelector [

	self assert: self newOp selector isSymbol
]
