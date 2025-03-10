Trait {
	#name : 'TAvrImmediateOpTest',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrImmediateOpTest >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrImmediateOpTest >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrImmediateOpTest >> testImmediateRange [

	self assert: self newOp immediateRange isCollection
]

{ #category : 'tests' }
TAvrImmediateOpTest >> testSelector [

	self assert: self newOp selector isSymbol
]
