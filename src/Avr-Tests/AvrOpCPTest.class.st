"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpCPTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp1Test',
	#classTraits : 'TAvrTwoRegistersOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpCPTest >> newOp [

	^ AvrOpCP new
]

{ #category : 'tests' }
AvrOpCPTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CP
]

{ #category : 'tests' }
AvrOpCPTest >> testOpcode [

	self assert: self newOp opcode equals: 16r1400
]
