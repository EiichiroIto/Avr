"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpPOPTest',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpPOPTest >> newOp [

	^ AvrOpPOP new
]

{ #category : 'tests' }
AvrOpPOPTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #POP
]

{ #category : 'tests' }
AvrOpPOPTest >> testOpcode [

	self assert: self newOp opcode equals: 16r900F
]
