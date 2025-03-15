Trait {
	#name : 'TAvrRegisterAndImmediateOp3Test',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testCodeSize [

	self assert: self newOp codeSize equals: 4
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testExtendedCode [

	| obj |
	obj := self newOp.
	obj immediate: 16r123456.
	self assert: obj extendedCode equals: 16r3456
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testFromWord [

	self should: [ self newOp fromWord: 0 ] raise: Error
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testFromWordWithExtended [

	| op word1 word2 |
	op := self newOp.
	op register: 0.
	op immediate: 16r1234.
	word1 := op operand.
	word2 := op extendedCode.
	op := self newOp.
	op fromWord: word1 withExtended: word2.
	self assert: op register equals: 0.
	self assert: op immediate equals: 16r1234.
	op := self newOp.
	op register: 31.
	op immediate: 16rFEDC.
	word1 := op operand.
	word2 := op extendedCode.
	op := self newOp.
	op fromWord: word1 withExtended: word2.
	self assert: op register equals: 31.
	self assert: op immediate equals: 16rFEDC
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testImmediateRange [

	| obj |
	obj := self newOp.
	self assert: obj immediateRange first equals: 0.
	self assert: obj immediateRange last equals: 65535.
	self assert: obj immediateRange size equals: 65536
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testOperand [

	| obj |
	obj := self newOp.
	obj register: 26.
	self assert: obj operand equals: 26 << 4
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testRegisterRange [

	| obj |
	obj := self newOp.
	self assert: obj registerRange first equals: 0.
	self assert: obj registerRange last equals: 31.
	self assert: obj registerRange size equals: 32
]

{ #category : 'tests' }
TAvrRegisterAndImmediateOp3Test >> testSelector [

	self assert: self newOp selector isSymbol
]
