"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRIDTest',
	#superclass : 'TestCase',
	#traits : 'TAvrBranchOpTest',
	#classTraits : 'TAvrBranchOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
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
