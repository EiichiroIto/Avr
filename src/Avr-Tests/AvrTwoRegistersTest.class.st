"
An AvrTwoRegistersTest is a test class for testing the behavior of AvrTwoRegisters
"
Class {
	#name : 'AvrTwoRegistersTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrTwoRegistersTest >> newOp [

	^ AvrTwoRegisters new
]

{ #category : 'tests' }
AvrTwoRegistersTest >> testArguments [

	| obj r |
	obj := self newOp.
	obj dest: 10.
	obj source: 20.
	r := obj arguments.
	self assert: r size equals: 2.
	self assert: r first equals: 10.
	self assert: r second equals: 20
]

{ #category : 'tests' }
AvrTwoRegistersTest >> testDest [

	| obj |
	obj := self newOp.
	self assert: obj dest isNil.
	obj dest: 10.
	self assert: obj dest equals: 10
]

{ #category : 'tests' }
AvrTwoRegistersTest >> testOperandText [

	| obj |
	obj := self newOp.
	self assert: obj operandText equals: 'rnil, rnil'.
	obj dest: 10.
	obj source: 20.
	self assert: obj operandText equals: 'r10, r20'
]

{ #category : 'tests' }
AvrTwoRegistersTest >> testSource [

	| obj |
	obj := self newOp.
	self assert: obj source isNil.
	obj source: 10.
	self assert: obj source equals: 10
]
