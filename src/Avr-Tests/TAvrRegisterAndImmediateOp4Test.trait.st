Trait {
	#name : 'TAvrRegisterAndImmediateOp4Test',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
TAvrRegisterAndImmediateOp4Test >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp4Test >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp4Test >> testImmediateRange [

	| obj |
	obj := self newOp.
	self assert: obj immediateRange first equals: 0.
	self assert: obj immediateRange last equals: 63.
	self assert: obj immediateRange size equals: 64
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp4Test >> testOperand [

	| obj |
	obj := self newOp.
	obj register: 2r00111.
	obj immediate: 2r111010.
	self assert: obj operand equals: 2r10110001110010
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp4Test >> testRegisterRange [

	| obj |
	obj := self newOp.
	self assert: obj registerRange first equals: 0.
	self assert: obj registerRange last equals: 31.
	self assert: obj registerRange size equals: 32
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp4Test >> testSelector [

	self assert: self newOp selector isSymbol
]
