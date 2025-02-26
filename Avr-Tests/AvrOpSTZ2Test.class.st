"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpSTZ2Test',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSTZ2Test >> newOp [

	^ AvrOpSTZ2 new
]

{ #category : 'tests' }
AvrOpSTZ2Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #ST
]

{ #category : 'tests' }
AvrOpSTZ2Test >> testOpcode [

	self assert: self newOp opcode equals: 16r9201
]

{ #category : 'as yet unclassified' }
AvrOpSTZ2Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: 'Z+, r5'
]
