"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpSESTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSESTest >> newOp [

	^ AvrOpSES new
]

{ #category : 'tests' }
AvrOpSESTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SES
]

{ #category : 'tests' }
AvrOpSESTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9448
]
