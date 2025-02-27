"
An AvrOpEICALLTest is a test class for testing the behavior of AvrOpEICALL
"
Class {
	#name : 'AvrOpRETTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpRETTest >> newOp [

	^ AvrOpRET new
]

{ #category : 'tests' }
AvrOpRETTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #RET
]

{ #category : 'tests' }
AvrOpRETTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9508
]
