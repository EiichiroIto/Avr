"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpNEGTest',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpNEGTest >> newOp [

	^ AvrOpNEG new
]

{ #category : 'tests' }
AvrOpNEGTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #NEG
]

{ #category : 'tests' }
AvrOpNEGTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9401
]
