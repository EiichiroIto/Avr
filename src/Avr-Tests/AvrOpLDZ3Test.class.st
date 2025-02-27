"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpLDZ3Test',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpLDZ3Test >> newOp [

	^ AvrOpLDZ3 new
]

{ #category : 'tests' }
AvrOpLDZ3Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #LD
]

{ #category : 'tests' }
AvrOpLDZ3Test >> testOpcode [

	self assert: self newOp opcode equals: 16r9002
]

{ #category : 'as yet unclassified' }
AvrOpLDZ3Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: 'r5, -Z'
]
