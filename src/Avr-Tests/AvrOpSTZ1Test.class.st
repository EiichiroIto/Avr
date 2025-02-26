"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpSTZ1Test',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSTZ1Test >> newOp [

	^ AvrOpSTZ1 new
]

{ #category : 'tests' }
AvrOpSTZ1Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #ST
]

{ #category : 'tests' }
AvrOpSTZ1Test >> testOpcode [

	self assert: self newOp opcode equals: 16r8200
]

{ #category : 'as yet unclassified' }
AvrOpSTZ1Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: 'Z, r5'
]
