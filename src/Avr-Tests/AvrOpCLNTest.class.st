"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpCLNTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpCLNTest >> newOp [

	^ AvrOpCLN new
]

{ #category : 'tests' }
AvrOpCLNTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CLN
]

{ #category : 'tests' }
AvrOpCLNTest >> testOpcode [

	self assert: self newOp opcode equals: 16r94A8
]
