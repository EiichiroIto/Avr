Trait {
	#name : 'TAvrAbsoluteOpTest',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrAbsoluteOpTest >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrAbsoluteOpTest >> testCodeSize [

	self assert: self newOp codeSize equals: 4
]

{ #category : 'tests' }
TAvrAbsoluteOpTest >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrAbsoluteOpTest >> testExtendedCode [

	| op |
	op := self newOp.
	op immediate: 16r1234.
	self assert: op extendedCode equals: 16r1234.
	op immediate: 16r123456.
	self assert: op extendedCode equals: 16r3456
]

{ #category : 'tests' }
TAvrAbsoluteOpTest >> testFromWord [

	self should: [ self newOp fromWord: 0 ] raise: Error
]

{ #category : 'tests' }
TAvrAbsoluteOpTest >> testFromWordWithExtended [

	| op word1 word2 |
	op := self newOp.
	op immediate: 16r1234.
	word1 := op operand.
	word2 := op extendedCode.
	op := self newOp.
	op fromWord: word1 withExtended: word2.
	self assert: op immediate equals: 16r1234.
	op := self newOp.
	op immediate: 16r234567.
	word1 := op operand.
	word2 := op extendedCode.
	op := self newOp.
	op fromWord: word1 withExtended: word2.
	self assert: op immediate equals: 16r234567
]

{ #category : 'tests' }
TAvrAbsoluteOpTest >> testImmediateRange [

	self assert: self newOp immediateRange isCollection
]

{ #category : 'tests' }
TAvrAbsoluteOpTest >> testIsAbsolute [

	self assert: self newOp isAbsolute
]

{ #category : 'tests' }
TAvrAbsoluteOpTest >> testIsRelative [

	self deny: self newOp isRelative
]

{ #category : 'tests' }
TAvrAbsoluteOpTest >> testIsValid [

	| op |
	op := self newOp.
	self deny: op isValid.
	op immediate: 12345.
	self assert: op isValid.
	op immediate: 16r12345678.
	self deny: op isValid
]

{ #category : 'tests' }
TAvrAbsoluteOpTest >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrAbsoluteOpTest >> testOperand [

	| op |
	op := self newOp.
	op immediate: 16r1234.
	self assert: op operand equals: 0.
	op immediate: 16r234567.
	self assert: op operand equals: 2r00100010001
]

{ #category : 'tests' }
TAvrAbsoluteOpTest >> testOperandText [

	| op |
	op := self newOp.
	self assert: op operandText equals: 'nil'.
	op immediate: 16r123.
	self assert: op operandText equals: '0x246'
]

{ #category : 'tests' }
TAvrAbsoluteOpTest >> testSelector [

	self assert: self newOp selector isSymbol
]
