"
An AvrMapTest is a test class for testing the behavior of AvrMap
"
Class {
	#name : 'AvrMapTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrMapTest >> newObj [

	^ AvrMap new
]

{ #category : 'tests' }
AvrMapTest >> testMap [

	| obj a |
	obj := self newObj.
	self assert: obj map isNil.
	a := #( a b c ).
	obj map: a.
	self assert: obj map identicalTo: a
]

{ #category : 'tests' }
AvrMapTest >> testSetSize [

	| obj |
	obj := self newObj.
	self assert: obj map isNil.
	obj setSize: 123.
	self assert: obj map isArray.
	self assert: obj map size equals: 123
]
