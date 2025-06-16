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
AvrLabelerTest >> testHasAddressNameAt [

	| obj |
	obj := self newObj.
	self deny: (obj hasAddressNameAt: 'abc').
	self deny: (obj hasAddressNameAt: 'def').
	obj labelNameAt: 'abc' put: 123.
	self assert: (obj hasAddressNameAt: 'abc').
	obj labelNameAt: 'def' put: 456.
	self assert: (obj hasAddressNameAt: 'def')
]

{ #category : 'tests' }
AvrLabelerTest >> testInitialize [

	| obj |
	obj := self newObj.
	self assert: obj labelNo equals: 0
]

{ #category : 'tests' }
AvrLabelerTest >> testLabelAddressAt [

	self testLabelNameAtPut
]

{ #category : 'tests' }
AvrLabelerTest >> testLabelAddressPut [

	| obj r |
	obj := self newObj.
	self assert: obj labels isEmpty.
	r := obj labelAddressPut: 123.
	self assert: r equals: 'label1'.
	r := obj labelAddressPut: 234.
	self assert: r equals: 'label2'.
	r := obj labelAddressPut: 123.
	self assert: r equals: 'label1'.
	r := obj labelAddressPut: 234.
	self assert: r equals: 'label2'.
	r := obj labelAddressPut: 456.
	self assert: r equals: 'label3'.
	self assert: (obj labelAddressAt: 123) equals: 'label1'.
	self assert: (obj labelAddressAt: 234) equals: 'label2'.
	self assert: (obj labelAddressAt: 456) equals: 'label3'.
	self assert: obj labels size equals: 3
]

{ #category : 'tests' }
AvrLabelerTest >> testLabelNameAt [

	self testLabelNameAtPut
]

{ #category : 'tests' }
AvrLabelerTest >> testLabelNameAtPut [

	| obj |
	obj := self newObj.
	obj labelNameAt: 'abc' put: 123.
	obj labelNameAt: 'def' put: 456.
	self assert: (obj labelAddressAt: 123) equals: 'abc'.
	self assert: (obj labelAddressAt: 456) equals: 'def'.
	self assert: (obj labelAddressAt: 789) isNil.
	self assert: (obj labelNameAt: 'abc') equals: 123.
	self assert: (obj labelNameAt: 'def') equals: 456.
	self assert: (obj labelNameAt: 'ghi') isNil
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

{ #category : 'tests' }
AvrLabelerTest >> testPeekLabel [

	| obj |
	obj := self newObj.
	self assert: obj peekLabel equals: 'label1'.
	self assert: obj peekLabel equals: 'label1'.
	obj nextLabel.
	self assert: obj peekLabel equals: 'label2'
]
