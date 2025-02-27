"
An AvrOpEICALLTest is a test class for testing the behavior of AvrOpEICALL
"
Class {
	#name : 'AvrOpEIJMPTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpEIJMPTest >> newOp [

	^ AvrOpEIJMP new
]

{ #category : 'tests' }
AvrOpEIJMPTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #EIJMP
]

{ #category : 'tests' }
AvrOpEIJMPTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9419
]
