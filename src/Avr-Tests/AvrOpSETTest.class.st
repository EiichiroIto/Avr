"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpSETTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpSETTest >> newOp [

	^ AvrOpSET new
]

{ #category : 'tests' }
AvrOpSETTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SET
]

{ #category : 'tests' }
AvrOpSETTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9468
]
