Trait {
	#name : 'TAvrTwoRegistersOp2Test',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrTwoRegistersOp2Test >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrTwoRegistersOp2Test >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrTwoRegistersOp2Test >> testDestRange [

	self assert: self newOp destRange first equals: 0.
	self assert: self newOp destRange last equals: 30
]

{ #category : 'tests' }
TAvrTwoRegistersOp2Test >> testFromWord [

	| op word |
	op := self newOp.
	op dest: 0.
	op source: 0.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op dest equals: 0.
	self assert: op source equals: 0.
	op := self newOp.
	op dest: 30.
	op source: 14.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op dest equals: 30.
	self assert: op source equals: 14.
	op := self newOp.
	op dest: 16.
	op source: 30.
	word := op operand.
	op := self newOp.
	op fromWord: word.
	self assert: op dest equals: 16.
	self assert: op source equals: 30
]

{ #category : 'tests' }
TAvrTwoRegistersOp2Test >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrTwoRegistersOp2Test >> testOperand [

	| obj |
	obj := self newOp.
	obj dest: 10.
	obj source: 20.
	self assert: obj operand equals: ((10 // 2) << 4 bitOr: (20 // 2)).
	obj dest: 26.
	obj source: 6.
	self assert: obj operand equals: ((26 // 2) << 4 bitOr: (6 // 2))
]

{ #category : 'tests' }
TAvrTwoRegistersOp2Test >> testSelector [

	self assert: self newOp selector isSymbol
]

{ #category : 'tests' }
TAvrTwoRegistersOp2Test >> testSourceRange [

	self assert: self newOp sourceRange first equals: 0.
	self assert: self newOp sourceRange last equals: 30
]
