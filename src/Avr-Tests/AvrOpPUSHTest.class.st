"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpPUSHTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterOp1Test',
	#classTraits : 'TAvrRegisterOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpPUSHTest >> newOp [

	^ AvrOpPUSH new
]

{ #category : 'tests' }
AvrOpPUSHTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #PUSH
]

{ #category : 'tests' }
AvrOpPUSHTest >> testOpcode [

	self assert: self newOp opcode equals: 16r920F
]
