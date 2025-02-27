"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRLTTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpBRLTTest >> newOp [

	^ AvrOpBRLT new
]

{ #category : 'tests' }
AvrOpBRLTTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRLT
]

{ #category : 'tests' }
AvrOpBRLTTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF004
]
