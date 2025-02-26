"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpLDY2Test',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpLDY2Test >> newOp [

	^ AvrOpLDY2 new
]

{ #category : 'tests' }
AvrOpLDY2Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #LD
]

{ #category : 'tests' }
AvrOpLDY2Test >> testOpcode [

	self assert: self newOp opcode equals: 16r9009
]

{ #category : 'as yet unclassified' }
AvrOpLDY2Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: 'r5, Y+'
]
