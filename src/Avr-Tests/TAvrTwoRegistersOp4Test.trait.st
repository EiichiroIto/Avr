Trait {
	#name : 'TAvrTwoRegistersOp4Test',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
TAvrTwoRegistersOp4Test >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrTwoRegistersOp4Test >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'as yet unclassified' }
TAvrTwoRegistersOp4Test >> testDestRange [

	self assert: self newOp destRange first equals: 16.
	self assert: self newOp destRange last equals: 23
]

{ #category : 'as yet unclassified' }
TAvrTwoRegistersOp4Test >> testOperand [

	| obj |
	obj := self newOp.
	obj dest: 2r10101.
	obj source: 2r10011.
	self assert: obj operand equals: (2r101 << 4 bitOr: 2r011).
	obj dest: 2r10011.
	obj source: 2r10101.
	self assert: obj operand equals: (2r011 << 4 bitOr: 2r101)
]

{ #category : 'tests' }
TAvrTwoRegistersOp4Test >> testSelector [

	self assert: self newOp selector isSymbol
]

{ #category : 'as yet unclassified' }
TAvrTwoRegistersOp4Test >> testSourceRange [

	self assert: self newOp sourceRange first equals: 16.
	self assert: self newOp sourceRange last equals: 23
]
