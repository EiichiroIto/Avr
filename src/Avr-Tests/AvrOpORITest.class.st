"
An AvrOpORITest is a test class for testing the behavior of AvrOpORI
"
Class {
	#name : 'AvrOpORITest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp1Test',
	#classTraits : 'TAvrRegisterAndImmediateOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpORITest >> newOp [

	^ AvrOpORI new
]

{ #category : 'tests' }
AvrOpORITest >> testMnemonic [

	self assert: self newOp mnemonic equals: #ORI
]

{ #category : 'tests' }
AvrOpORITest >> testOpcode [

	self assert: self newOp opcode equals: 16r6000
]
