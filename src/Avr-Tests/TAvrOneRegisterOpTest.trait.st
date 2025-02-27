Trait {
	#name : 'TAvrOneRegisterOpTest',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrOneRegisterOpTest >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrOneRegisterOpTest >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'as yet unclassified' }
TAvrOneRegisterOpTest >> testOperand [

	| obj |
	obj := self newOp.
	obj registerRange do: [ :each |
		obj register: each.
		self assert: obj operand equals: each << 4 ]
]

{ #category : 'as yet unclassified' }
TAvrOneRegisterOpTest >> testRegisterRange [

	self assert: self newOp registerRange isCollection
]

{ #category : 'tests' }
TAvrOneRegisterOpTest >> testSelector [

	self assert: self newOp selector isSymbol
]
