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
TAvrIORegAndBitOpTest >> testImmediateRange [

	| obj |
	obj := self newOp.
	self assert: obj immediateRange first equals: 0.
	self assert: obj immediateRange last equals: 7.
	self assert: obj immediateRange size equals: 8
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
	self assert: obj operandText equals: '0x14, 5'
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
