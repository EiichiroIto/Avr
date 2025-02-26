"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpSTY1Test',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSTY1Test >> newOp [

	^ AvrOpSTY1 new
]

{ #category : 'tests' }
AvrOpSTY1Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #ST
]

{ #category : 'tests' }
AvrOpSTY1Test >> testOpcode [

	self assert: self newOp opcode equals: 16r8208
]

{ #category : 'as yet unclassified' }
AvrOpSTY1Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: 'Y, r5'
]
