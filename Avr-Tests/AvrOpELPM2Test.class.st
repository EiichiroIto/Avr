"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpELPM2Test',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpELPM2Test >> newOp [

	^ AvrOpELPM2 new
]

{ #category : 'tests' }
AvrOpELPM2Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #ELPM
]

{ #category : 'tests' }
AvrOpELPM2Test >> testOpcode [

	self assert: self newOp opcode equals: 16r9006
]

{ #category : 'as yet unclassified' }
AvrOpELPM2Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: 'r5, Z'
]
