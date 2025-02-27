"
An AvrOpEICALLTest is a test class for testing the behavior of AvrOpEICALL
"
Class {
	#name : 'AvrOpRETITest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpRETITest >> newOp [

	^ AvrOpRETI new
]

{ #category : 'tests' }
AvrOpRETITest >> testMnemonic [

	self assert: self newOp mnemonic equals: #RETI
]

{ #category : 'tests' }
AvrOpRETITest >> testOpcode [

	self assert: self newOp opcode equals: 16r9518
]
