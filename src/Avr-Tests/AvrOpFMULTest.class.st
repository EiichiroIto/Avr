"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpFMULTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp4Test',
	#classTraits : 'TAvrTwoRegistersOp4Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpFMULTest >> newOp [

	^ AvrOpFMUL new
]

{ #category : 'tests' }
AvrOpFMULTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #FMUL
]

{ #category : 'tests' }
AvrOpFMULTest >> testOpcode [

	self assert: self newOp opcode equals: 16r0308
]
