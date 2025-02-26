"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpELPM3Test',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpELPM3Test >> newOp [

	^ AvrOpELPM3 new
]

{ #category : 'tests' }
AvrOpELPM3Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #ELPM
]

{ #category : 'tests' }
AvrOpELPM3Test >> testOpcode [

	self assert: self newOp opcode equals: 16r9007
]

{ #category : 'as yet unclassified' }
AvrOpELPM3Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: 'r5, Z+'
]
