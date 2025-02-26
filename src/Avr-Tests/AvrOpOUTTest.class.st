"
An AvrOpOUTTest is a test class for testing the behavior of AvrOpOUT
"
Class {
	#name : 'AvrOpOUTTest',
	#superclass : 'TestCase',
	#traits : 'TAvrInputOutputOpTest',
	#classTraits : 'TAvrInputOutputOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpOUTTest >> newOp [

	^ AvrOpOUT new
]

{ #category : 'tests' }
AvrOpOUTTest >> testArguments [

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
AvrOpOUTTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #OUT
]

{ #category : 'tests' }
AvrOpOUTTest >> testOpcode [

	self assert: self newOp opcode equals: 16rB800
]

{ #category : 'tests' }
AvrOpOUTTest >> testOperandText [

	| obj |
	obj := self newOp.
	self assert: obj operandText equals: 'nil, nil'.
	obj register: 10.
	obj immediate: 20.
	self assert: obj operandText equals: '0x14, r10'
]
