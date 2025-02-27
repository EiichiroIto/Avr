"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpSUBTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp1Test',
	#classTraits : 'TAvrTwoRegistersOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpSUBTest >> newOp [

	^ AvrOpSUB new
]

{ #category : 'tests' }
AvrOpSUBTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SUB
]

{ #category : 'tests' }
AvrOpSUBTest >> testOpcode [

	self assert: self newOp opcode equals: 16r1800
]
