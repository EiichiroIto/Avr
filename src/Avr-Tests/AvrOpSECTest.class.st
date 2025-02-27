"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpSECTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpSECTest >> newOp [

	^ AvrOpSEC new
]

{ #category : 'tests' }
AvrOpSECTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SEC
]

{ #category : 'tests' }
AvrOpSECTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9408
]
