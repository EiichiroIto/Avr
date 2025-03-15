"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRNETest',
	#superclass : 'TestCase',
	#traits : 'TAvrBranchOpTest',
	#classTraits : 'TAvrBranchOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpBRNETest >> newOp [

	^ AvrOpBRNE new
]

{ #category : 'tests' }
AvrOpBRNETest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRNE
]

{ #category : 'tests' }
AvrOpBRNETest >> testOpcode [

	self assert: self newOp opcode equals: 16rF401
]
