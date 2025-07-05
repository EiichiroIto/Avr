"
An AvrIOMapTest is a test class for testing the behavior of AvrIOMap
"
Class {
	#name : 'AvrIOMapTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrIOMapTest >> newObj [

	^ AvrIOMap new
]

{ #category : 'tests' }
AvrIOMapTest >> testAdd [

	| obj r |
	obj := self newObj.
	r := AvrLiteral label: #abc port: 12.
	self assert: obj map isArray.
	self assert: (obj map at: 13) isNil.
	obj add: r.
	self assert: (obj map at: 13) identicalTo: r.
	obj add: r.
	self assert: (obj map at: 13) identicalTo: r.
	r := AvrLiteral label: #def port: 12.
	self should: [ obj add: r ] raise: Error
]

{ #category : 'tests' }
AvrIOMapTest >> testInitialize [

	| obj |
	obj := AvrIOMap basicNew.
	self assert: obj map isNil.
	obj initialize.
	self assert: obj map isArray.
	self assert: obj map size equals: 256
]

{ #category : 'tests' }
AvrIOMapTest >> testLabelPort [

	| obj r |
	obj := self newObj.
	r := obj label: #abc port: 123.
	self assert: (r isKindOf: AvrLiteral).
	self assert: r label equals: #abc.
	self assert: r port equals: 123
]
