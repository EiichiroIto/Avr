"
An AvrOpBSTTest is a test class for testing the behavior of AvrOpBST
"
Class {
	#name : 'AvrOpBSTTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndBitOpTest',
	#classTraits : 'TAvrRegisterAndBitOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpBSTTest >> newOp [

	^ AvrOpBST new
]

{ #category : 'tests' }
AvrOpBSTTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BST
]

{ #category : 'tests' }
AvrOpBSTTest >> testOpcode [

	self assert: self newOp opcode equals: 16rFA00
]
