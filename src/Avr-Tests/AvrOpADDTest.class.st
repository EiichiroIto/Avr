"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpADDTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp1Test',
	#classTraits : 'TAvrTwoRegistersOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpADDTest >> newOp [

	^ AvrOpADD new
]

{ #category : 'tests' }
AvrOpADDTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #ADD
]

{ #category : 'tests' }
AvrOpADDTest >> testOpcode [

	self assert: self newOp opcode equals: 16r0C00
]
