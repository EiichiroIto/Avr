Trait {
	#name : 'TAvrRegisterAndImmediateOp2Test',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrRegisterAndImmediateOp2Test >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp2Test >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp2Test >> testImmediateRange [

	| obj |
	obj := self newOp.
	self assert: obj immediateRange first equals: 0.
	self assert: obj immediateRange last equals: 63.
	self assert: obj immediateRange size equals: 64
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp2Test >> testOperand [

	| obj |
	obj := self newOp.
	obj register: 26.
	obj immediate: 2r101000.
	self assert: obj operand equals: 2r10011000
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp2Test >> testRegisterRange [

	| obj |
	obj := self newOp.
	self assert: obj registerRange first equals: 24.
	self assert: obj registerRange last equals: 30.
	self assert: obj registerRange size equals: 4
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp2Test >> testSelector [

	self assert: self newOp selector isSymbol
]
