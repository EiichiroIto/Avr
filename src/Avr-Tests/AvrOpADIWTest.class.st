"
An AvrOpADIWTest is a test class for testing the behavior of AvrOpADIW
"
Class {
	#name : 'AvrOpADIWTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp2Test',
	#classTraits : 'TAvrRegisterAndImmediateOp2Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpADIWTest >> newOp [

	^ AvrOpADIW new
]

{ #category : 'tests' }
AvrOpADIWTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #ADIW
]

{ #category : 'tests' }
AvrOpADIWTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9600
]
