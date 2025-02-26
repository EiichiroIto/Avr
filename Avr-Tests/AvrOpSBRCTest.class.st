"
An AvrOpSBRCTest is a test class for testing the behavior of AvrOpSBRC
"
Class {
	#name : 'AvrOpSBRCTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndBitOpTest',
	#classTraits : 'TAvrRegisterAndBitOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSBRCTest >> newOp [

	^ AvrOpSBRC new
]

{ #category : 'tests' }
AvrOpSBRCTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SBRC
]

{ #category : 'tests' }
AvrOpSBRCTest >> testOpcode [

	self assert: self newOp opcode equals: 16rFC00
]
