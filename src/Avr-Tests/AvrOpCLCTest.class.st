"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpCLCTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpCLCTest >> newOp [

	^ AvrOpCLC new
]

{ #category : 'tests' }
AvrOpCLCTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CLC
]

{ #category : 'tests' }
AvrOpCLCTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9488
]
