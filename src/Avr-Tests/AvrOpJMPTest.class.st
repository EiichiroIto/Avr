"
An AvrOpJMPTest is a test class for testing the behavior of AvrOpJMP
"
Class {
	#name : 'AvrOpJMPTest',
	#superclass : 'TestCase',
	#traits : 'TAvrImmediateOpTest',
	#classTraits : 'TAvrImmediateOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpJMPTest >> newOp [

	^ AvrOpJMP new
]

{ #category : 'tests' }
AvrOpJMPTest >> testExtendedCode [

	| op |
	op := self newOp.
	op immediate: 16r1234.
	self assert: op extendedCode equals: 16r1234.
	op immediate: 16r123456.
	self assert: op extendedCode equals: 16r3456
]

{ #category : 'tests' }
AvrOpJMPTest >> testIsAbsolute [

	self assert: self newOp isAbsolute
]

{ #category : 'tests' }
AvrOpJMPTest >> testIsValid [

	| op |
	op := self newOp.
	self deny: op isValid.
	op immediate: 12345.
	self assert: op isValid.
	op immediate: 16r12345678.
	self deny: op isValid
]

{ #category : 'tests' }
AvrOpJMPTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #JMP
]

{ #category : 'tests' }
AvrOpJMPTest >> testOpcode [

	self assert: self newOp opcode equals: 16r940C
]

{ #category : 'tests' }
AvrOpJMPTest >> testOperand [

	| op |
	op := self newOp.
	op immediate: 16r1234.
	self assert: op operand equals: 0.
	op immediate: 16r234567.
	self assert: op operand equals: 2r00100010001
]

{ #category : 'tests' }
AvrOpJMPTest >> testOperandText [

	| op |
	op := self newOp.
	self assert: op operandText equals: 'nil'.
	op immediate: 16r123.
	self assert: op operandText equals: '0x246'
]
