"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpCPSETest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp1Test',
	#classTraits : 'TAvrTwoRegistersOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpCPSETest >> newOp [

	^ AvrOpCPSE new
]

{ #category : 'tests' }
AvrOpCPSETest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CPSE
]

{ #category : 'tests' }
AvrOpCPSETest >> testOpcode [

	self assert: self newOp opcode equals: 16r1000
]
