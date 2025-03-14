"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpLDZ2Test',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterOp1Test',
	#classTraits : 'TAvrRegisterOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpLDZ2Test >> newOp [

	^ AvrOpLDZ2 new
]

{ #category : 'tests' }
AvrOpLDZ2Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #LD
]

{ #category : 'tests' }
AvrOpLDZ2Test >> testOpcode [

	self assert: self newOp opcode equals: 16r9001
]

{ #category : 'as yet unclassified' }
AvrOpLDZ2Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: 'r5, Z+'
]
