"
An AvrSemiWordTest is a test class for testing the behavior of AvrSemiWord
"
Class {
	#name : 'AvrSemiWordTest',
	#superclass : 'TestCase',
	#traits : 'TAvrImmediateOpTest',
	#classTraits : 'TAvrImmediateOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrSemiWordTest >> newOp [

	^ AvrSemiWord new
]

{ #category : 'tests' }
AvrSemiWordTest >> testFromWord [

	| op |
	op := self newOp.
	op immediate: 0.
	op fromWord: op operand.
	self assert: op immediate equals: 0.
	op immediate: 65535.
	op fromWord: op operand.
	self assert: op immediate equals: 65535
]

{ #category : 'tests' }
AvrSemiWordTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #'.WORD'
]

{ #category : 'tests' }
AvrSemiWordTest >> testOpcode [

	self assert: self newOp opcode equals: 0
]

{ #category : 'tests' }
AvrSemiWordTest >> testOperand [

	| op |
	op := self newOp.
	op immediate: 16r1234.
	self assert: op operand equals: 16r1234.
	op immediate: 16rFEDC.
	self assert: op operand equals: 16rFEDC
]

{ #category : 'tests' }
AvrSemiWordTest >> testOperandText [

	| op |
	op := self newOp.
	op immediate: 16r1234.
	self assert: op operandText equals: '0x1234'.
	op immediate: 16rFEDC.
	self assert: op operandText equals: '0xFEDC'
]
