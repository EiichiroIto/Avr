"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpCLTTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpCLTTest >> newOp [

	^ AvrOpCLT new
]

{ #category : 'tests' }
AvrOpCLTTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CLT
]

{ #category : 'tests' }
AvrOpCLTTest >> testOpcode [

	self assert: self newOp opcode equals: 16r94E8
]
