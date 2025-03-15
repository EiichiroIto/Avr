Trait {
	#name : 'TAvrRegisterOp2Test',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrRegisterOp2Test >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrRegisterOp2Test >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrRegisterOp2Test >> testFromWord [

	| op word |
	op := self newOp.
	op register: 0.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op register equals: 0.
	op := self newOp.
	op register: 7.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op register equals: 7
]

{ #category : 'tests' }
TAvrRegisterOp2Test >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrRegisterOp2Test >> testOperand [

	| obj |
	obj := self newOp.
	obj registerRange do: [ :each |
		obj register: each.
		self assert: obj operand equals: each << 4 ]
]

{ #category : 'tests' }
TAvrRegisterOp2Test >> testRegisterRange [

	self assert: self newOp registerRange isCollection
]

{ #category : 'tests' }
TAvrRegisterOp2Test >> testSelector [

	self assert: self newOp selector isSymbol
]
