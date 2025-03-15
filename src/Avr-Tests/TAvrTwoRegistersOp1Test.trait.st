Trait {
	#name : 'TAvrTwoRegistersOp1Test',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrTwoRegistersOp1Test >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrTwoRegistersOp1Test >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrTwoRegistersOp1Test >> testDestRange [

	self assert: self newOp destRange first equals: 0.
	self assert: self newOp destRange last equals: 31
]

{ #category : 'tests' }
TAvrTwoRegistersOp1Test >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrTwoRegistersOp1Test >> testOperand [

	| obj |
	obj := self newOp.
	obj dest: 2r00101.
	obj source: 2r10011.
	self
		assert: obj operand
		equals: (2r00101 << 4 bitOr: (2r0011 bitOr: 2r10000 << 5)).
	obj dest: 2r10011.
	obj source: 2r00101.
	self
		assert: obj operand
		equals: (2r10011 << 4 bitOr: (2r0101 bitOr: 2r00000 << 5))
]

{ #category : 'tests' }
TAvrTwoRegistersOp1Test >> testSelector [

	self assert: self newOp selector isSymbol
]

{ #category : 'tests' }
TAvrTwoRegistersOp1Test >> testSourceRange [

	self assert: self newOp sourceRange first equals: 0.
	self assert: self newOp sourceRange last equals: 31
]
