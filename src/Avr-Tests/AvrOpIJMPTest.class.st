"
An AvrOpEICALLTest is a test class for testing the behavior of AvrOpEICALL
"
Class {
	#name : 'AvrOpIJMPTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpIJMPTest >> newOp [

	^ AvrOpIJMP new
]

{ #category : 'tests' }
AvrOpIJMPTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #IJMP
]

{ #category : 'tests' }
AvrOpIJMPTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9409
]
