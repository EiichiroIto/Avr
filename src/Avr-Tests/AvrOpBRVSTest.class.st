"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRVSTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpBRVSTest >> newOp [

	^ AvrOpBRVS new
]

{ #category : 'tests' }
AvrOpBRVSTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRVS
]

{ #category : 'tests' }
AvrOpBRVSTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF003
]
