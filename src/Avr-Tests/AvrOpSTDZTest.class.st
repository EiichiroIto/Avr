"
An AvrOpSTDZTest is a test class for testing the behavior of AvrOpSTDZ
"
Class {
	#name : 'AvrOpSTDZTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp4Test',
	#classTraits : 'TAvrRegisterAndImmediateOp4Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpSTDZTest >> newOp [

	^ AvrOpSTDZ new
]

{ #category : 'tests' }
AvrOpSTDZTest >> testArguments [

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
AvrOpSTDZTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #STD
]

{ #category : 'tests' }
AvrOpSTDZTest >> testOpcode [

	self assert: self newOp opcode equals: 16r8200
]

{ #category : 'tests' }
AvrOpSTDZTest >> testOperandText [

	| obj |
	obj := self newOp.
	self assert: obj operandText equals: 'Z+nil, nil'.
	obj register: 10.
	obj immediate: 20.
	self assert: obj operandText equals: 'Z+20, r10'
]
