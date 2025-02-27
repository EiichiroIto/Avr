"
An AvrOpADCTest is a test class for testing the behavior of AvrOpADC
"
Class {
	#name : 'AvrOpADCTest',
	#superclass : 'TestCase',
	#traits : 'TAvrTwoRegistersOp1Test',
	#classTraits : 'TAvrTwoRegistersOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpADCTest >> newOp [

	^ AvrOpADC new
]

{ #category : 'tests' }
AvrOpADCTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #ADC
]

{ #category : 'tests' }
AvrOpADCTest >> testOpcode [

	self assert: self newOp opcode equals: 16r1C00
]
