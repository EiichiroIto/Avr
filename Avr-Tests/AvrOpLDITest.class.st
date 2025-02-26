"
An AvrOpLDITest is a test class for testing the behavior of AvrOpLDI
"
Class {
	#name : 'AvrOpLDITest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp1Test',
	#classTraits : 'TAvrRegisterAndImmediateOp1Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpLDITest >> newOp [

	^ AvrOpLDI new
]

{ #category : 'tests' }
AvrOpLDITest >> testMnemonic [

	self assert: self newOp mnemonic equals: #LDI
]

{ #category : 'tests' }
AvrOpLDITest >> testOpcode [

	self assert: self newOp opcode equals: 16rE000
]
