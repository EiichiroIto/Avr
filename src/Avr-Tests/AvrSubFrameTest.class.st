"
An AvrSubFrameTest is a test class for testing the behavior of AvrSubFrame
"
Class {
	#name : 'AvrSubFrameTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Assembly',
	#package : 'Avr-Tests',
	#tag : 'Assembly'
}

{ #category : 'instance creation' }
AvrSubFrameTest >> newObj [

	^ AvrSubFrame new
]

{ #category : 'tests' }
AvrSubFrameTest >> testInputs [

	| obj a |
	obj := self newObj.
	self assert: obj inputs isNil.
	a := #( 1 2 3 ).
	obj inputs: a.
	self assert: obj inputs identicalTo: a
]

{ #category : 'tests' }
AvrSubFrameTest >> testOutputs [

	| obj a |
	obj := self newObj.
	self assert: obj outputs isNil.
	a := #( 1 2 3 ).
	obj outputs: a.
	self assert: obj outputs identicalTo: a
]
