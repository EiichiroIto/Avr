"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpMULTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp1Test',
	#classTraits : 'TAvrTwoRegistersOp1Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpMULTest >> newOp [

	^ AvrOpMUL new
]

{ #category : 'tests' }
AvrOpMULTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #MUL
]

{ #category : 'tests' }
AvrOpMULTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9C00
]
