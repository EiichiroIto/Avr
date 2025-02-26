"
An AvrOpSUBITest is a test class for testing the behavior of AvrOpSUBI
"
Class {
	#name : 'AvrOpSUBITest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp1Test',
	#classTraits : 'TAvrRegisterAndImmediateOp1Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSUBITest >> newOp [

	^ AvrOpSUBI new
]

{ #category : 'tests' }
AvrOpSUBITest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SUBI
]

{ #category : 'tests' }
AvrOpSUBITest >> testOpcode [

	self assert: self newOp opcode equals: 16r5000
]
