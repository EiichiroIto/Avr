"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRMITest',
	#superclass : 'TestCase',
	#traits : 'TAvrBranchOpTest',
	#classTraits : 'TAvrBranchOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpBRMITest >> newOp [

	^ AvrOpBRMI new
]

{ #category : 'tests' }
AvrOpBRMITest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRMI
]

{ #category : 'tests' }
AvrOpBRMITest >> testOpcode [

	self assert: self newOp opcode equals: 16rF002
]
