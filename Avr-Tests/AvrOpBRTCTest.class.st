"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRTCTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpBRTCTest >> newOp [

	^ AvrOpBRTC new
]

{ #category : 'tests' }
AvrOpBRTCTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRTC
]

{ #category : 'tests' }
AvrOpBRTCTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF406
]
