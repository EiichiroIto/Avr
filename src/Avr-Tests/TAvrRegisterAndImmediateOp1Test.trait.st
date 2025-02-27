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
TAvrRegisterAndImmediateOp1Test >> testImmediateRange [

	| obj |
	obj := self newOp.
	self assert: obj immediateRange first equals: 0.
	self assert: obj immediateRange last equals: 255.
	self assert: obj immediateRange size equals: 256
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
