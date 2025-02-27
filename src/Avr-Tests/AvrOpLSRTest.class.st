"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpLSRTest',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpLSRTest >> newOp [

	^ AvrOpLSR new
]

{ #category : 'tests' }
AvrOpLSRTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #LSR
]

{ #category : 'tests' }
AvrOpLSRTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9406
]
