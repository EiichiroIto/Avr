"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRGETest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpBRGETest >> newOp [

	^ AvrOpBRGE new
]

{ #category : 'tests' }
AvrOpBRGETest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRGE
]

{ #category : 'tests' }
AvrOpBRGETest >> testOpcode [

	self assert: self newOp opcode equals: 16rF404
]
