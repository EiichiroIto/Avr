"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpLPM3Test',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterOp1Test',
	#classTraits : 'TAvrRegisterOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpLPM3Test >> newOp [

	^ AvrOpLPM3 new
]

{ #category : 'tests' }
AvrOpLPM3Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #LPM
]

{ #category : 'tests' }
AvrOpLPM3Test >> testOpcode [

	self assert: self newOp opcode equals: 16r9005
]

{ #category : 'as yet unclassified' }
AvrOpLPM3Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: 'r5, Z+'
]
