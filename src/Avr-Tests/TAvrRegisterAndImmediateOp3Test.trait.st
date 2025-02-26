Trait {
	#name : 'TAvrRegisterAndImmediateOp3Test',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'as yet unclassified' }
TAvrRegisterAndImmediateOp3Test >> testExtendedCode [

	| obj |
	obj := self newOp.
	obj immediate: 16r123456.
	self assert: obj extendedCode equals: 16r3456
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testImmediateRange [

	| obj |
	obj := self newOp.
	self assert: obj immediateRange first equals: 0.
	self assert: obj immediateRange last equals: 65535.
	self assert: obj immediateRange size equals: 65536
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testOperand [

	| obj |
	obj := self newOp.
	obj register: 26.
	self assert: obj operand equals: 26 << 4
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testRegisterRange [

	| obj |
	obj := self newOp.
	self assert: obj registerRange first equals: 0.
	self assert: obj registerRange last equals: 31.
	self assert: obj registerRange size equals: 32
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testSelector [

	self assert: self newOp selector isSymbol
]
