"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpSTX3Test',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSTX3Test >> newOp [

	^ AvrOpSTX3 new
]

{ #category : 'tests' }
AvrOpSTX3Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #ST
]

{ #category : 'tests' }
AvrOpSTX3Test >> testOpcode [

	self assert: self newOp opcode equals: 16r920E
]

{ #category : 'as yet unclassified' }
AvrOpSTX3Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: '-X, r5'
]
