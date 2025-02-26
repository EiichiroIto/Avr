"
An AvrOpBLDTest is a test class for testing the behavior of AvrOpBLD
"
Class {
	#name : 'AvrOpBLDTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndBitOpTest',
	#classTraits : 'TAvrRegisterAndBitOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpBLDTest >> newOp [

	^ AvrOpBLD new
]

{ #category : 'tests' }
AvrOpBLDTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BLD
]

{ #category : 'tests' }
AvrOpBLDTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF800
]
