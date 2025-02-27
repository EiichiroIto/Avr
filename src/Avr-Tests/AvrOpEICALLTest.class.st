"
An AvrOpEICALLTest is a test class for testing the behavior of AvrOpEICALL
"
Class {
	#name : 'AvrOpEICALLTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpEICALLTest >> newOp [

	^ AvrOpEICALL new
]

{ #category : 'tests' }
AvrOpEICALLTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #EICALL
]

{ #category : 'tests' }
AvrOpEICALLTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9519
]
