Trait {
	#name : 'TAvrRegisterOp1Test',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrRegisterOp1Test >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrRegisterOp1Test >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrRegisterOp1Test >> testFromWord [

	| op word |
	op := self newOp.
	op register: 0.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op register equals: 0.
	op := self newOp.
	op register: 31.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op register equals: 31
]

{ #category : 'tests' }
TAvrRegisterOp1Test >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrRegisterOp1Test >> testOperand [

	| obj |
	obj := self newOp.
	obj registerRange do: [ :each |
		obj register: each.
		self assert: obj operand equals: each << 4 ]
]

{ #category : 'tests' }
TAvrRegisterOp1Test >> testRegisterRange [

	self assert: self newOp registerRange isCollection
]

{ #category : 'tests' }
TAvrRegisterOp1Test >> testSelector [

	self assert: self newOp selector isSymbol
]
