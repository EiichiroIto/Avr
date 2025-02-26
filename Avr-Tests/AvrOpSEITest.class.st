"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpSEITest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSEITest >> newOp [

	^ AvrOpSEI new
]

{ #category : 'tests' }
AvrOpSEITest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SEI
]

{ #category : 'tests' }
AvrOpSEITest >> testOpcode [

	self assert: self newOp opcode equals: 16r9478
]
