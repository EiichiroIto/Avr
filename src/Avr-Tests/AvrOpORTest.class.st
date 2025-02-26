"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpORTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp1Test',
	#classTraits : 'TAvrTwoRegistersOp1Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpORTest >> newOp [

	^ AvrOpOR new
]

{ #category : 'tests' }
AvrOpORTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #OR
]

{ #category : 'tests' }
AvrOpORTest >> testOpcode [

	self assert: self newOp opcode equals: 16r2800
]
