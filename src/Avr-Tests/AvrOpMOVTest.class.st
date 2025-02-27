"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpMOVTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp1Test',
	#classTraits : 'TAvrTwoRegistersOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpMOVTest >> newOp [

	^ AvrOpMOV new
]

{ #category : 'tests' }
AvrOpMOVTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #MOV
]

{ #category : 'tests' }
AvrOpMOVTest >> testOpcode [

	self assert: self newOp opcode equals: 16r2C00
]
