"
An AvrOpBCLRTest is a test class for testing the behavior of AvrOpBCLR
"
Class {
	#name : 'AvrOpBCLRTest',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpBCLRTest >> newOp [

	^ AvrOpBCLR new
]

{ #category : 'tests' }
AvrOpBCLRTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BCLR
]

{ #category : 'tests' }
AvrOpBCLRTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9488
]
