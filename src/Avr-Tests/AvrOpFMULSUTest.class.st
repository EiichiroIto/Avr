"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpFMULSUTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp4Test',
	#classTraits : 'TAvrTwoRegistersOp4Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpFMULSUTest >> newOp [

	^ AvrOpFMULSU new
]

{ #category : 'tests' }
AvrOpFMULSUTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #FMULSU
]

{ #category : 'tests' }
AvrOpFMULSUTest >> testOpcode [

	self assert: self newOp opcode equals: 16r0388
]
