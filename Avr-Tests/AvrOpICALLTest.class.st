"
An AvrOpEICALLTest is a test class for testing the behavior of AvrOpEICALL
"
Class {
	#name : 'AvrOpICALLTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpICALLTest >> newOp [

	^ AvrOpICALL new
]

{ #category : 'tests' }
AvrOpICALLTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #ICALL
]

{ #category : 'tests' }
AvrOpICALLTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9509
]
