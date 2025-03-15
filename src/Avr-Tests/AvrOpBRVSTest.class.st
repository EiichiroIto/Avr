"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRVSTest',
	#superclass : 'TestCase',
	#traits : 'TAvrBranchOpTest',
	#classTraits : 'TAvrBranchOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
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
