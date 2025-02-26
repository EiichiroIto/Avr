"
An AvrOpLDDYTest is a test class for testing the behavior of AvrOpLDDY
"
Class {
	#name : 'AvrOpLDDYTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp4Test',
	#classTraits : 'TAvrRegisterAndImmediateOp4Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpLDDYTest >> newOp [

	^ AvrOpLDDY new
]

{ #category : 'tests' }
AvrOpLDDYTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #LDD
]

{ #category : 'tests' }
AvrOpLDDYTest >> testOpcode [

	self assert: self newOp opcode equals: 16r8008
]

{ #category : 'tests' }
AvrOpLDDYTest >> testOperandText [

	| obj |
	obj := self newOp.
	self assert: obj operandText equals: 'nil, Y+nil'.
	obj register: 10.
	obj immediate: 20.
	self assert: obj operandText equals: 'r10, Y+20'
]
