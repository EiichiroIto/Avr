"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRIDTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpBRIDTest >> newOp [

	^ AvrOpBRID new
]

{ #category : 'tests' }
AvrOpBRIDTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRID
]

{ #category : 'tests' }
AvrOpBRIDTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF407
]
