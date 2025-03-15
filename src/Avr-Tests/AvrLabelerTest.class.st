"
An AvrLabelerTest is a test class for testing the behavior of AvrLabeler
"
Class {
	#name : 'AvrLabelerTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Assembly',
	#package : 'Avr-Tests',
	#tag : 'Assembly'
}

{ #category : 'instance creation' }
AvrLabelerTest >> newObj [

	^ AvrLabeler new
]

{ #category : 'tests' }
AvrLabelerTest >> testInitialize [

	| obj |
	obj := self newObj.
	self assert: obj labelNo equals: 0
]

{ #category : 'tests' }
AvrLabelerTest >> testLabelAddressAt [

	self testLabelNameAddress
]

{ #category : 'tests' }
AvrLabelerTest >> testLabelNameAddress [

	| obj |
	obj := self newObj.
	obj labelName: 'abc' address: 123.
	obj labelName: 'def' address: 456.
	self assert: (obj labelAddressAt: 123) equals: 'abc'.
	self assert: (obj labelAddressAt: 456) equals: 'def'.
	self assert: (obj labelAddressAt: 789) isNil.
	self assert: (obj labelNameAt: 'abc') equals: 123.
	self assert: (obj labelNameAt: 'def') equals: 456.
	self assert: (obj labelNameAt: 'ghi') isNil
]

{ #category : 'tests' }
AvrLabelerTest >> testLabelNameAt [

	self testLabelNameAddress
]

{ #category : 'tests' }
AvrLabelerTest >> testLabelNo [

	| obj |
	obj := self newObj.
	self assert: obj labelNo equals: 0.
	obj labelNo: 123.
	self assert: obj labelNo equals: 123
]

{ #category : 'tests' }
AvrLabelerTest >> testLabels [

	| obj d |
	obj := self newObj.
	self assert: obj labels isDictionary.
	self assert: obj labels isEmpty.
	d := Dictionary new.
	obj labels: d.
	self assert: obj labels identicalTo: d
]

{ #category : 'tests' }
AvrLabelerTest >> testNextLabel [

	| obj |
	obj := self newObj.
	self assert: obj nextLabel equals: 'label1'.
	self assert: obj nextLabel equals: 'label2'.
	self assert: obj nextLabel equals: 'label3'
]
