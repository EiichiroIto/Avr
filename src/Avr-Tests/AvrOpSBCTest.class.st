"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpSBCTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp1Test',
	#classTraits : 'TAvrTwoRegistersOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpSBCTest >> newOp [

	^ AvrOpSBC new
]

{ #category : 'tests' }
AvrOpSBCTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SBC
]

{ #category : 'tests' }
AvrOpSBCTest >> testOpcode [

	self assert: self newOp opcode equals: 16r0800
]
