"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRVCTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpBRVCTest >> newOp [

	^ AvrOpBRVC new
]

{ #category : 'tests' }
AvrOpBRVCTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRVC
]

{ #category : 'tests' }
AvrOpBRVCTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF403
]
