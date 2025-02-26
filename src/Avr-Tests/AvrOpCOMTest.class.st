"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpCOMTest',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpCOMTest >> newOp [

	^ AvrOpCOM new
]

{ #category : 'tests' }
AvrOpCOMTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #COM
]

{ #category : 'tests' }
AvrOpCOMTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9400
]
