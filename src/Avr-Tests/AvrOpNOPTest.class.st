"
An AvrOpEICALLTest is a test class for testing the behavior of AvrOpEICALL
"
Class {
	#name : 'AvrOpNOPTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpNOPTest >> newOp [

	^ AvrOpNOP new
]

{ #category : 'tests' }
AvrOpNOPTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #NOP
]

{ #category : 'tests' }
AvrOpNOPTest >> testOpcode [

	self assert: self newOp opcode equals: 0
]
