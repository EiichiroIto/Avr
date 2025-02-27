"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpSENTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpSENTest >> newOp [

	^ AvrOpSEN new
]

{ #category : 'tests' }
AvrOpSENTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SEN
]

{ #category : 'tests' }
AvrOpSENTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9428
]
