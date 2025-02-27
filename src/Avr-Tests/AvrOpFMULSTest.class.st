"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpFMULSTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp4Test',
	#classTraits : 'TAvrTwoRegistersOp4Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpFMULSTest >> newOp [

	^ AvrOpFMULS new
]

{ #category : 'tests' }
AvrOpFMULSTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #FMULS
]

{ #category : 'tests' }
AvrOpFMULSTest >> testOpcode [

	self assert: self newOp opcode equals: 16r0380
]
