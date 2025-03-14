Trait {
	#name : 'TAvrTwoRegistersOp4Test',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrTwoRegistersOp4Test >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrTwoRegistersOp4Test >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrTwoRegistersOp4Test >> testDestRange [

	self assert: self newOp destRange first equals: 16.
	self assert: self newOp destRange last equals: 23
]

{ #category : 'tests' }
TAvrTwoRegistersOp4Test >> testFromWord [

	| op word |
	op := self newOp.
	op dest: 23.
	op source: 16.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op dest equals: 23.
	self assert: op source equals: 16.
	op := self newOp.
	op dest: 23.
	op source: 16.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op dest equals: 23.
	self assert: op source equals: 16
]

{ #category : 'tests' }
TAvrTwoRegistersOp4Test >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrTwoRegistersOp4Test >> testOperand [

	| obj |
	obj := self newOp.
	obj dest: 2r10101.
	obj source: 2r10011.
	self assert: obj operand equals: (2r101 << 4 bitOr: 2r011).
	obj dest: 2r10011.
	obj source: 2r10101.
	self assert: obj operand equals: (2r011 << 4 bitOr: 2r101)
]

{ #category : 'tests' }
TAvrTwoRegistersOp4Test >> testSelector [

	self assert: self newOp selector isSymbol
]

{ #category : 'tests' }
TAvrTwoRegistersOp4Test >> testSourceRange [

	self assert: self newOp sourceRange first equals: 16.
	self assert: self newOp sourceRange last equals: 23
]
