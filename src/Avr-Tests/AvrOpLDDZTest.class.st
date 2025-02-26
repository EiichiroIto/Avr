"
An AvrOpLDDZTest is a test class for testing the behavior of AvrOpLDDZ
"
Class {
	#name : 'AvrOpLDDZTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp4Test',
	#classTraits : 'TAvrRegisterAndImmediateOp4Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpLDDZTest >> newOp [

	^ AvrOpLDDZ new
]

{ #category : 'tests' }
AvrOpLDDZTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #LDD
]

{ #category : 'tests' }
AvrOpLDDZTest >> testOpcode [

	self assert: self newOp opcode equals: 16r8000
]

{ #category : 'tests' }
AvrOpLDDZTest >> testOperandText [

	| obj |
	obj := self newOp.
	self assert: obj operandText equals: 'nil, Z+nil'.
	obj register: 10.
	obj immediate: 20.
	self assert: obj operandText equals: 'r10, Z+20'
]
