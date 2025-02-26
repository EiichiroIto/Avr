"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpSEVTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSEVTest >> newOp [

	^ AvrOpSEV new
]

{ #category : 'tests' }
AvrOpSEVTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SEV
]

{ #category : 'tests' }
AvrOpSEVTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9438
]
