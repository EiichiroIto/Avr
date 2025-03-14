"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRTCTest',
	#superclass : 'TestCase',
	#traits : 'TAvrBranchOpTest',
	#classTraits : 'TAvrBranchOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
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
