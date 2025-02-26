Trait {
	#name : 'TAvrTwoRegistersOp3Test',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
TAvrTwoRegistersOp3Test >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrTwoRegistersOp3Test >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'as yet unclassified' }
TAvrTwoRegistersOp3Test >> testDestRange [

	self assert: self newOp destRange first equals: 16.
	self assert: self newOp destRange last equals: 31
]

{ #category : 'as yet unclassified' }
TAvrTwoRegistersOp3Test >> testOperand [

	| obj |
	obj := self newOp.
	obj dest: 20.
	obj source: 30.
	self assert: obj operand equals: (20 - 16 << 4 bitOr: 30 - 16).
	obj dest: 26.
	obj source: 16.
	self assert: obj operand equals: (26 - 16 << 4 bitOr: 16 - 16)
]

{ #category : 'tests' }
TAvrTwoRegistersOp3Test >> testSelector [

	self assert: self newOp selector isSymbol
]

{ #category : 'as yet unclassified' }
TAvrTwoRegistersOp3Test >> testSourceRange [

	self assert: self newOp sourceRange first equals: 16.
	self assert: self newOp sourceRange last equals: 31
]
