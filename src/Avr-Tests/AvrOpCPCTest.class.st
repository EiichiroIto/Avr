"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpCPCTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp1Test',
	#classTraits : 'TAvrTwoRegistersOp1Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpCPCTest >> newOp [

	^ AvrOpCPC new
]

{ #category : 'tests' }
AvrOpCPCTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CPC
]

{ #category : 'tests' }
AvrOpCPCTest >> testOpcode [

	self assert: self newOp opcode equals: 16r0400
]
