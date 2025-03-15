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

{ #category : 'tests' }
TAvrOneRegisterOpTest >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrOneRegisterOpTest >> testOperand [

	| obj |
	obj := self newOp.
	obj registerRange do: [ :each |
		obj register: each.
		self assert: obj operand equals: each << 4 ]
]

{ #category : 'tests' }
TAvrOneRegisterOpTest >> testRegisterRange [

	self assert: self newOp registerRange isCollection
]

{ #category : 'tests' }
TAvrOneRegisterOpTest >> testSelector [

	self assert: self newOp selector isSymbol
]
