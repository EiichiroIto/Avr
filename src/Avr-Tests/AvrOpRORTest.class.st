"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpRORTest',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpRORTest >> newOp [

	^ AvrOpROR new
]

{ #category : 'tests' }
AvrOpRORTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #ROR
]

{ #category : 'tests' }
AvrOpRORTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9407
]
