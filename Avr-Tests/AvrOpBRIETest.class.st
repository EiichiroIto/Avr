"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRIETest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpBRIETest >> newOp [

	^ AvrOpBRIE new
]

{ #category : 'tests' }
AvrOpBRIETest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRIE
]

{ #category : 'tests' }
AvrOpBRIETest >> testOpcode [

	self assert: self newOp opcode equals: 16rF007
]
