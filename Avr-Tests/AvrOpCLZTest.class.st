"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpCLZTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpCLZTest >> newOp [

	^ AvrOpCLZ new
]

{ #category : 'tests' }
AvrOpCLZTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CLZ
]

{ #category : 'tests' }
AvrOpCLZTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9498
]
