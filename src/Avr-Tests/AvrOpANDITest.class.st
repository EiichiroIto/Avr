"
An AvrOpANDITest is a test class for testing the behavior of AvrOpANDI
"
Class {
	#name : 'AvrOpANDITest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp1Test',
	#classTraits : 'TAvrRegisterAndImmediateOp1Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpANDITest >> newOp [

	^ AvrOpANDI new
]

{ #category : 'tests' }
AvrOpANDITest >> testMnemonic [

	self assert: self newOp mnemonic equals: #ANDI
]

{ #category : 'tests' }
AvrOpANDITest >> testOpcode [

	self assert: self newOp opcode equals: 16r7000
]
