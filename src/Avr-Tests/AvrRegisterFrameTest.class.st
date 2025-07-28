"
An AvrRegisterFrameTest is a test class for testing the behavior of AvrRegisterFrame
"
Class {
	#name : 'AvrRegisterFrameTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Assembly',
	#package : 'Avr-Tests',
	#tag : 'Assembly'
}

{ #category : 'instance creation' }
AvrRegisterFrameTest >> newObj [

	^ AvrRegisterFrame new
]

{ #category : 'tests' }
AvrRegisterFrameTest >> testAllocateRegisters [

	| obj r |
	obj := self newObj.
	obj unusedRegisters: #( 4 6 9 10 12 16 ) asOrderedCollection.
	r := obj allocateRegisters: #( 12 10 4 ).
	self assertCollection: r equals: #( 12 10 4 ).
	self
		assertCollection: obj unusedRegisters
		equals: #( 6 9 16 ) asOrderedCollection
]

{ #category : 'tests' }
AvrRegisterFrameTest >> testAllocateRegistersCount [

	| obj r |
	obj := self newObj.
	obj unusedRegisters: #( 4 6 9 ) asOrderedCollection.
	r := obj allocateRegistersCount: 2.
	self assertCollection: r equals: #( 4 6 ).
	self
		assertCollection: obj unusedRegisters
		equals: #( 9 ) asOrderedCollection
]

{ #category : 'tests' }
AvrRegisterFrameTest >> testCheckAnyRegistersAvailable [

	| obj |
	obj := self newObj.
	obj unusedRegisters: #( 4 6 9 10 12 16 ) asOrderedCollection.
	self assert: (obj checkAnyRegistersAvailable: #( 2 3 4 )).
	self deny: (obj checkAnyRegistersAvailable: #( 2 3 5 )).
	self assert: (obj checkAnyRegistersAvailable: #( 4 6 9 ))
]

{ #category : 'tests' }
AvrRegisterFrameTest >> testFreeRegisters [

	| obj |
	obj := self newObj.
	obj unusedRegisters: #( 1 2 3 ) asOrderedCollection.
	obj freeRegisters: #( 4 5 ).
	self
		assertCollection: obj unusedRegisters
		equals: #( 1 2 3 4 5 ) asOrderedCollection.
	self should: [ obj freeRegisters: #( 5 6 ) ] raise: Error
]

{ #category : 'tests' }
AvrRegisterFrameTest >> testUnusedRegisters [

	| obj a |
	obj := self newObj.
	self assert: obj unusedRegisters isNil.
	a := OrderedCollection new.
	obj unusedRegisters: a.
	self assert: obj unusedRegisters identicalTo: a
]
