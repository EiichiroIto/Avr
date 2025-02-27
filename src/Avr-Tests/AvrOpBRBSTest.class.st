"
An AvrOpBRBSTest is a test class for testing the behavior of AvrOpBRBS
"
Class {
	#name : 'AvrOpBRBSTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp5Test',
	#classTraits : 'TAvrRegisterAndImmediateOp5Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpBRBSTest >> newOp [

	^ AvrOpBRBS new
]

{ #category : 'tests' }
AvrOpBRBSTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRBS
]

{ #category : 'tests' }
AvrOpBRBSTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF000
]
