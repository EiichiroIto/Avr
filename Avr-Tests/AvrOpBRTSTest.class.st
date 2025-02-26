"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRTSTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpBRTSTest >> newOp [

	^ AvrOpBRTS new
]

{ #category : 'tests' }
AvrOpBRTSTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRTS
]

{ #category : 'tests' }
AvrOpBRTSTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF006
]
