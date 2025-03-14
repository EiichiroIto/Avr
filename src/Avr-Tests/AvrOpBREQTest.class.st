"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBREQTest',
	#superclass : 'TestCase',
	#traits : 'TAvrBranchOpTest',
	#classTraits : 'TAvrBranchOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpBREQTest >> newOp [

	^ AvrOpBREQ new
]

{ #category : 'tests' }
AvrOpBREQTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BREQ
]

{ #category : 'tests' }
AvrOpBREQTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF001
]
