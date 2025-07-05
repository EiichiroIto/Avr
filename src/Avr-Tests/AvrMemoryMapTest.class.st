"
An AvrMemoryMapTest is a test class for testing the behavior of AvrMemoryMap
"
Class {
	#name : 'AvrMemoryMapTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrMemoryMapTest >> newObj [

	^ AvrMemoryMap new
]

{ #category : 'tests' }
AvrMemoryMapTest >> testAdd [

	| obj r |
	obj := self newObj.
	r := AvrLiteral label: #abc address: 12.
	self assert: obj map isArray.
	self assert: (obj map at: 13) isNil.
	obj add: r.
	self assert: (obj map at: 13) identicalTo: r.
	obj add: r.
	self assert: (obj map at: 13) identicalTo: r.
	r := AvrLiteral label: #def address: 12.
	self should: [ obj add: r ] raise: Error
]

{ #category : 'tests' }
AvrMemoryMapTest >> testInitialize [

	| obj |
	obj := AvrIOMap basicNew.
	self assert: obj map isNil.
	obj initialize.
	self assert: obj map isArray.
	self assert: obj map size equals: 256
]

{ #category : 'tests' }
AvrMemoryMapTest >> testLabelAddress [

	| obj r |
	obj := self newObj.
	r := obj label: #abc address: 123.
	self assert: (r isKindOf: AvrLiteral).
	self assert: r label equals: #abc.
	self assert: r address equals: 123
]
