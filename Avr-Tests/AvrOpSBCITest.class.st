"
An AvrOpSBCITest is a test class for testing the behavior of AvrOpSBCI
"
Class {
	#name : 'AvrOpSBCITest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp1Test',
	#classTraits : 'TAvrRegisterAndImmediateOp1Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSBCITest >> newOp [

	^ AvrOpSBCI new
]

{ #category : 'tests' }
AvrOpSBCITest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SBCI
]

{ #category : 'tests' }
AvrOpSBCITest >> testOpcode [

	self assert: self newOp opcode equals: 16r4000
]
