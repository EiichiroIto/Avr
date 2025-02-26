"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRHCTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpBRHCTest >> newOp [

	^ AvrOpBRHC new
]

{ #category : 'tests' }
AvrOpBRHCTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRHC
]

{ #category : 'tests' }
AvrOpBRHCTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF405
]
