"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpSTZ3Test',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpSTZ3Test >> newOp [

	^ AvrOpSTZ3 new
]

{ #category : 'tests' }
AvrOpSTZ3Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #ST
]

{ #category : 'tests' }
AvrOpSTZ3Test >> testOpcode [

	self assert: self newOp opcode equals: 16r9202
]

{ #category : 'as yet unclassified' }
AvrOpSTZ3Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: '-Z, r5'
]
