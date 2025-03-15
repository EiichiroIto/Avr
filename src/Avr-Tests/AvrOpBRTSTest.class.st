"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRTSTest',
	#superclass : 'TestCase',
	#traits : 'TAvrBranchOpTest',
	#classTraits : 'TAvrBranchOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
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
