Trait {
	#name : 'TAvrNoOperandOpTest',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
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
