"
An AvrOpSBISTest is a test class for testing the behavior of AvrOpSBIS
"
Class {
	#name : 'AvrOpSBISTest',
	#superclass : 'TestCase',
	#traits : 'TAvrIORegAndBitOpTest',
	#classTraits : 'TAvrIORegAndBitOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSBISTest >> newOp [

	^ AvrOpSBIS new
]

{ #category : 'tests' }
AvrOpSBISTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SBIS
]

{ #category : 'tests' }
AvrOpSBISTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9B00
]
