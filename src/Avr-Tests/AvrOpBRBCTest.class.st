"
An AvrOpBRBCTest is a test class for testing the behavior of AvrOpBRBC
"
Class {
	#name : 'AvrOpBRBCTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp5Test',
	#classTraits : 'TAvrRegisterAndImmediateOp5Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpBRBCTest >> newOp [

	^ AvrOpBRBC new
]

{ #category : 'tests' }
AvrOpBRBCTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRBC
]

{ #category : 'tests' }
AvrOpBRBCTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF400
]
