"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpSTX2Test',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSTX2Test >> newOp [

	^ AvrOpSTX2 new
]

{ #category : 'tests' }
AvrOpSTX2Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #ST
]

{ #category : 'tests' }
AvrOpSTX2Test >> testOpcode [

	self assert: self newOp opcode equals: 16r920D
]

{ #category : 'as yet unclassified' }
AvrOpSTX2Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: 'X+, r5'
]
