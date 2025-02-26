"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpCLITest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpCLITest >> newOp [

	^ AvrOpCLI new
]

{ #category : 'tests' }
AvrOpCLITest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CLI
]

{ #category : 'tests' }
AvrOpCLITest >> testOpcode [

	self assert: self newOp opcode equals: 16r94F8
]
