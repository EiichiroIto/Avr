"
An AvrOpSBRSTest is a test class for testing the behavior of AvrOpSBRS
"
Class {
	#name : 'AvrOpSBRSTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndBitOpTest',
	#classTraits : 'TAvrRegisterAndBitOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpSBRSTest >> newOp [

	^ AvrOpSBRS new
]

{ #category : 'tests' }
AvrOpSBRSTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SBRS
]

{ #category : 'tests' }
AvrOpSBRSTest >> testOpcode [

	self assert: self newOp opcode equals: 16rFE00
]
