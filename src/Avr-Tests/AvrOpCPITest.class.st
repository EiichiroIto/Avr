"
An AvrOpCPITest is a test class for testing the behavior of AvrOpCPI
"
Class {
	#name : 'AvrOpCPITest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp1Test',
	#classTraits : 'TAvrRegisterAndImmediateOp1Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpCPITest >> newOp [

	^ AvrOpCPI new
]

{ #category : 'tests' }
AvrOpCPITest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CPI
]

{ #category : 'tests' }
AvrOpCPITest >> testOpcode [

	self assert: self newOp opcode equals: 16r3000
]
