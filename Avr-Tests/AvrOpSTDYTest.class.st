"
An AvrOpSTDYTest is a test class for testing the behavior of AvrOpSTDY
"
Class {
	#name : 'AvrOpSTDYTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp4Test',
	#classTraits : 'TAvrRegisterAndImmediateOp4Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSTDYTest >> newOp [

	^ AvrOpSTDY new
]

{ #category : 'tests' }
AvrOpSTDYTest >> testArguments [

	| obj r |
	obj := self newOp.
	obj register: 10.
	obj immediate: 20.
	r := obj arguments.
	self assert: r size equals: 2.
	self assert: r first equals: 20.
	self assert: r second equals: 10
]

{ #category : 'tests' }
AvrOpSTDYTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #STD
]

{ #category : 'tests' }
AvrOpSTDYTest >> testOpcode [

	self assert: self newOp opcode equals: 16r8208
]

{ #category : 'tests' }
AvrOpSTDYTest >> testOperandText [

	| obj |
	obj := self newOp.
	self assert: obj operandText equals: 'Y+nil, nil'.
	obj register: 10.
	obj immediate: 20.
	self assert: obj operandText equals: 'Y+20, r10'
]
