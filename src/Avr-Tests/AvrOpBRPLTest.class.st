"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRPLTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpBRPLTest >> newOp [

	^ AvrOpBRPL new
]

{ #category : 'tests' }
AvrOpBRPLTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRPL
]

{ #category : 'tests' }
AvrOpBRPLTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF402
]
