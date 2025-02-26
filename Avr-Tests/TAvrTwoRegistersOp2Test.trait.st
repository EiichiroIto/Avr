Trait {
	#name : 'TAvrTwoRegistersOp2Test',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
TAvrTwoRegistersOp2Test >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrTwoRegistersOp2Test >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'as yet unclassified' }
TAvrTwoRegistersOp2Test >> testDestRange [

	self assert: self newOp destRange first equals: 0.
	self assert: self newOp destRange last equals: 30
]

{ #category : 'as yet unclassified' }
TAvrTwoRegistersOp2Test >> testOperand [

	| obj |
	obj := self newOp.
	obj dest: 10.
	obj source: 20.
	self assert: obj operand equals: ((10 // 2) << 4 bitOr: (20 // 2)).
	obj dest: 26.
	obj source: 6.
	self assert: obj operand equals: ((26 // 2) << 4 bitOr: (6 // 2))
]

{ #category : 'tests' }
TAvrTwoRegistersOp2Test >> testSelector [

	self assert: self newOp selector isSymbol
]

{ #category : 'as yet unclassified' }
TAvrTwoRegistersOp2Test >> testSourceRange [

	self assert: self newOp sourceRange first equals: 0.
	self assert: self newOp sourceRange last equals: 30
]
