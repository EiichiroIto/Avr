"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpMULSTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp3Test',
	#classTraits : 'TAvrTwoRegistersOp3Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpMULSTest >> newOp [

	^ AvrOpMULS new
]

{ #category : 'tests' }
AvrOpMULSTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #MULS
]

{ #category : 'tests' }
AvrOpMULSTest >> testOpcode [

	self assert: self newOp opcode equals: 16r0200
]
