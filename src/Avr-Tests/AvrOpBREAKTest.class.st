"
An AvrOpBREAKTest is a test class for testing the behavior of AvrOpBREAK
"
Class {
	#name : 'AvrOpBREAKTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpBREAKTest >> newOp [

	^ AvrOpBREAK new
]

{ #category : 'tests' }
AvrOpBREAKTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BREAK
]

{ #category : 'tests' }
AvrOpBREAKTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9598
]
