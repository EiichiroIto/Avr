"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpLPM2Test',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpLPM2Test >> newOp [

	^ AvrOpLPM2 new
]

{ #category : 'tests' }
AvrOpLPM2Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #LPM
]

{ #category : 'tests' }
AvrOpLPM2Test >> testOpcode [

	self assert: self newOp opcode equals: 16r9004
]

{ #category : 'as yet unclassified' }
AvrOpLPM2Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: 'r5, Z'
]
