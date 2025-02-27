"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpLDX1Test',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpLDX1Test >> newOp [

	^ AvrOpLDX1 new
]

{ #category : 'tests' }
AvrOpLDX1Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #LD
]

{ #category : 'tests' }
AvrOpLDX1Test >> testOpcode [

	self assert: self newOp opcode equals: 16r900C
]

{ #category : 'as yet unclassified' }
AvrOpLDX1Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: 'r5, X'
]
