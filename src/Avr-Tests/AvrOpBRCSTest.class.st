"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRCSTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpBRCSTest >> newOp [

	^ AvrOpBRCS new
]

{ #category : 'tests' }
AvrOpBRCSTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRCS
]

{ #category : 'tests' }
AvrOpBRCSTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF000
]
