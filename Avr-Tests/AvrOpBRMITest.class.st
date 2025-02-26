"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRMITest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
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
