"
An AvrOpEICALLTest is a test class for testing the behavior of AvrOpEICALL
"
Class {
	#name : 'AvrOpLPM1Test',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpLPM1Test >> newOp [

	^ AvrOpLPM1 new
]

{ #category : 'tests' }
AvrOpLPM1Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #LPM
]

{ #category : 'tests' }
AvrOpLPM1Test >> testOpcode [

	self assert: self newOp opcode equals: 16r95C8
]
