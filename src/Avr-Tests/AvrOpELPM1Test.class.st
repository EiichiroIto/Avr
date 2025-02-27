"
An AvrOpEICALLTest is a test class for testing the behavior of AvrOpEICALL
"
Class {
	#name : 'AvrOpELPM1Test',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpELPM1Test >> newOp [

	^ AvrOpELPM1 new
]

{ #category : 'tests' }
AvrOpELPM1Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #ELPM
]

{ #category : 'tests' }
AvrOpELPM1Test >> testOpcode [

	self assert: self newOp opcode equals: 16r95D8
]
