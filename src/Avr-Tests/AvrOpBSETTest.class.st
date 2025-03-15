"
An AvrOpBCLRTest is a test class for testing the behavior of AvrOpBCLR
"
Class {
	#name : 'AvrOpBSETTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterOp2Test',
	#classTraits : 'TAvrRegisterOp2Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpBSETTest >> newOp [

	^ AvrOpBSET new
]

{ #category : 'tests' }
AvrOpBSETTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BSET
]

{ #category : 'tests' }
AvrOpBSETTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9408
]
