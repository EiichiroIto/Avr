"
An AvrOpCALLTest is a test class for testing the behavior of AvrOpCALL
"
Class {
	#name : 'AvrOpCALLTest',
	#superclass : 'TestCase',
	#traits : 'TAvrImmediateOpTest',
	#classTraits : 'TAvrImmediateOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpCALLTest >> newOp [

	^ AvrOpCALL new
]

{ #category : 'tests' }
AvrOpCALLTest >> testExtendedCode [

	| op |
	op := self newOp.
	op immediate: 16r1234.
	self assert: op extendedCode equals: 16r1234.
	op immediate: 16r123456.
	self assert: op extendedCode equals: 16r3456
]

{ #category : 'tests' }
AvrOpCALLTest >> testIsAbsolute [

	self assert: self newOp isAbsolute
]

{ #category : 'tests' }
AvrOpCALLTest >> testIsValid [

	| op |
	op := self newOp.
	self deny: op isValid.
	op immediate: 12345.
	self assert: op isValid.
	op immediate: 16r12345678.
	self deny: op isValid
]

{ #category : 'tests' }
AvrOpCALLTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CALL
]

{ #category : 'tests' }
AvrOpCALLTest >> testOpcode [

	self assert: self newOp opcode equals: 16r940E
]

{ #category : 'tests' }
AvrOpCALLTest >> testOperand [

	| op |
	op := self newOp.
	op immediate: 16r1234.
	self assert: op operand equals: 0.
	op immediate: 16r234567.
	self assert: op operand equals: 2r00100010001
]

{ #category : 'tests' }
AvrOpCALLTest >> testOperandText [

	| op |
	op := self newOp.
	self assert: op operandText equals: 'nil'.
	op immediate: 16r123.
	self assert: op operandText equals: '0x246'
]
