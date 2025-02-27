"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpCLSTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpCLSTest >> newOp [

	^ AvrOpCLS new
]

{ #category : 'tests' }
AvrOpCLSTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CLS
]

{ #category : 'tests' }
AvrOpCLSTest >> testOpcode [

	self assert: self newOp opcode equals: 16r94C8
]
