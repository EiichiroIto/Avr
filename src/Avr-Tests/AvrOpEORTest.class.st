"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpEORTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp1Test',
	#classTraits : 'TAvrTwoRegistersOp1Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpEORTest >> newOp [

	^ AvrOpEOR new
]

{ #category : 'tests' }
AvrOpEORTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #EOR
]

{ #category : 'tests' }
AvrOpEORTest >> testOpcode [

	self assert: self newOp opcode equals: 16r2400
]
