"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpSWAPTest',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpSWAPTest >> newOp [

	^ AvrOpSWAP new
]

{ #category : 'tests' }
AvrOpSWAPTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SWAP
]

{ #category : 'tests' }
AvrOpSWAPTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9402
]
