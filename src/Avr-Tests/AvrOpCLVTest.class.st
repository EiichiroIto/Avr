"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpCLVTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpCLVTest >> newOp [

	^ AvrOpCLV new
]

{ #category : 'tests' }
AvrOpCLVTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CLV
]

{ #category : 'tests' }
AvrOpCLVTest >> testOpcode [

	self assert: self newOp opcode equals: 16r94B8
]
