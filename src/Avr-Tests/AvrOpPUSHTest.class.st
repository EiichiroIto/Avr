"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpPUSHTest',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
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
