Trait {
	#name : 'TAvrNoOperandOpTest',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
TAvrNoOperandOpTest >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrNoOperandOpTest >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrNoOperandOpTest >> testSelector [

	self assert: self newOp selector isSymbol
]
