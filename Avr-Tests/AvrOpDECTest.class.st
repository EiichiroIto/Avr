"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpDECTest',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpDECTest >> newOp [

	^ AvrOpDEC new
]

{ #category : 'tests' }
AvrOpDECTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #DEC
]

{ #category : 'tests' }
AvrOpDECTest >> testOpcode [

	self assert: self newOp opcode equals: 16r940A
]
