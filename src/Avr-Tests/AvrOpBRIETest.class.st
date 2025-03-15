"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRIETest',
	#superclass : 'TestCase',
	#traits : 'TAvrBranchOpTest',
	#classTraits : 'TAvrBranchOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
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
