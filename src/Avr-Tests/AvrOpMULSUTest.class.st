"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpMULSUTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp4Test',
	#classTraits : 'TAvrTwoRegistersOp4Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpMULSUTest >> newOp [

	^ AvrOpMULSU new
]

{ #category : 'tests' }
AvrOpMULSUTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #MULSU
]

{ #category : 'tests' }
AvrOpMULSUTest >> testOpcode [

	self assert: self newOp opcode equals: 16r0300
]
