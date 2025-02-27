"
An AvrRegisterWithImmediateTest is a test class for testing the behavior of AvrRegisterWithImmediate
"
Class {
	#name : 'AvrRegisterWithImmediateTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrRegisterWithImmediateTest >> newOp [

	^ AvrRegisterWithImmediate new
]

{ #category : 'tests' }
AvrRegisterWithImmediateTest >> testArguments [

	| obj r |
	obj := self newOp.
	obj register: 10.
	obj immediate: 20.
	r := obj arguments.
	self assert: r size equals: 2.
	self assert: r first equals: 10.
	self assert: r second equals: 20
]

{ #category : 'tests' }
AvrRegisterWithImmediateTest >> testImmediate [

	| obj |
	obj := self newOp.
	self assert: obj immediate isNil.
	obj immediate: 123.
	self assert: obj immediate equals: 123
]

{ #category : 'tests' }
AvrRegisterWithImmediateTest >> testOperandText [

	| obj |
	obj := self newOp.
	self assert: obj operandText equals: 'nil, nil'.
	obj register: 10.
	obj immediate: 20.
	self assert: obj operandText equals: 'r10, 0x14'
]

{ #category : 'tests' }
AvrRegisterWithImmediateTest >> testRegister [

	| obj |
	obj := self newOp.
	self assert: obj register isNil.
	obj register: 23.
	self assert: obj register equals: 23
]

{ #category : 'tests' }
AvrRegisterWithImmediateTest >> testRegisterString [

	| obj |
	obj := self newOp.
	self assert: obj registerString equals: 'nil'.
	obj register: 23.
	self assert: obj registerString equals: 'r23'
]
