"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpCOMTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterOp1Test',
	#classTraits : 'TAvrRegisterOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
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
