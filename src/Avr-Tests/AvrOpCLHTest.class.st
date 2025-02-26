"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpCLHTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpCLHTest >> newOp [

	^ AvrOpCLH new
]

{ #category : 'tests' }
AvrOpCLHTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CLH
]

{ #category : 'tests' }
AvrOpCLHTest >> testOpcode [

	self assert: self newOp opcode equals: 16r94D8
]
