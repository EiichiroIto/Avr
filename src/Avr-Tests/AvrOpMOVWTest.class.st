"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpMOVWTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp2Test',
	#classTraits : 'TAvrTwoRegistersOp2Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpMOVWTest >> newOp [

	^ AvrOpMOVW new
]

{ #category : 'tests' }
AvrOpMOVWTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #MOVW
]

{ #category : 'tests' }
AvrOpMOVWTest >> testOpcode [

	self assert: self newOp opcode equals: 16r0100
]
