"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpANDTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp1Test',
	#classTraits : 'TAvrTwoRegistersOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpANDTest >> newOp [

	^ AvrOpAND new
]

{ #category : 'tests' }
AvrOpANDTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #AND
]

{ #category : 'tests' }
AvrOpANDTest >> testOpcode [

	self assert: self newOp opcode equals: 16r2000
]
