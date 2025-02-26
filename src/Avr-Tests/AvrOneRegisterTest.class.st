"
An AvrOneRegisterTest is a test class for testing the behavior of AvrOneRegister
"
Class {
	#name : 'AvrOneRegisterTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOneRegisterTest >> newOp [

	^ AvrOneRegister new
]

{ #category : 'tests' }
AvrOneRegisterTest >> testArguments [

	| obj r |
	obj := self newOp.
	obj register: 15.
	r := obj arguments.
	self assert: r size equals: 1.
	self assert: r first equals: 15
]

{ #category : 'tests' }
AvrOneRegisterTest >> testOperandText [

	| obj |
	obj := self newOp.
	self assert: obj operandText equals: 'nil'.
	obj register: 23.
	self assert: obj operandText equals: 'r23'
]

{ #category : 'tests' }
AvrOneRegisterTest >> testRegister [

	| obj |
	obj := self newOp.
	self assert: obj register isNil.
	obj register: 23.
	self assert: obj register equals: 23
]

{ #category : 'tests' }
AvrOneRegisterTest >> testRegisterString [

	| obj |
	obj := self newOp.
	self assert: obj registerString equals: 'nil'.
	obj register: 23.
	self assert: obj registerString equals: 'r23'
]
