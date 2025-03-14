"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpINCTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterOp1Test',
	#classTraits : 'TAvrRegisterOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpINCTest >> newOp [

	^ AvrOpINC new
]

{ #category : 'tests' }
AvrOpINCTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #INC
]

{ #category : 'tests' }
AvrOpINCTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9403
]
