"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpSEZTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSEZTest >> newOp [

	^ AvrOpSEZ new
]

{ #category : 'tests' }
AvrOpSEZTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SEZ
]

{ #category : 'tests' }
AvrOpSEZTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9418
]
