"
An AvrImmediateTest is a test class for testing the behavior of AvrImmediate
"
Class {
	#name : 'AvrImmediateTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrImmediateTest >> newOp [

	^ AvrImmediate new
]

{ #category : 'tests' }
AvrImmediateTest >> testArguments [

	| obj r |
	obj := self newOp.
	obj immediate: 15.
	r := obj arguments.
	self assert: r size equals: 1.
	self assert: r first equals: 15
]

{ #category : 'tests' }
AvrImmediateTest >> testHasImmediate [

	self assert: self newOp hasImmediate
]

{ #category : 'tests' }
AvrImmediateTest >> testHasLabel [

	| op |
	op := self newOp.
	self deny: op hasLabel.
	op immediate: 'abc'.
	self assert: op hasLabel.
	op immediate: 123.
	self deny: op hasLabel
]

{ #category : 'tests' }
AvrImmediateTest >> testImmediate [

	| obj |
	obj := self newOp.
	self assert: obj immediate isNil.
	obj immediate: 123.
	self assert: obj immediate equals: 123
]

{ #category : 'tests' }
AvrImmediateTest >> testIsRelative [

	self assert: self newOp isRelative
]
