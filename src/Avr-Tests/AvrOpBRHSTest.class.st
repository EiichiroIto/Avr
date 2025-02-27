"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRHSTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpBRHSTest >> newOp [

	^ AvrOpBRHS new
]

{ #category : 'tests' }
AvrOpBRHSTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRHS
]

{ #category : 'tests' }
AvrOpBRHSTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF005
]
