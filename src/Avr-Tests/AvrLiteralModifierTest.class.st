"
An AvrLiteralModifierTest is a test class for testing the behavior of AvrLiteralModifier
"
Class {
	#name : 'AvrLiteralModifierTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Assembly',
	#package : 'Avr-Tests',
	#tag : 'Assembly'
}

{ #category : 'instance creation' }
AvrLiteralModifierTest >> newObj [

	^ AvrLiteralModifier new
]

{ #category : 'tests' }
AvrLiteralModifierTest >> testAddress [

	| obj lit |
	obj := self newObj.
	lit := AvrLiteral label: #abc address: 123.
	obj literal: lit.
	self assert: obj address equals: 123
]

{ #category : 'tests' }
AvrLiteralModifierTest >> testAsModifier [

	| obj obj2 |
	obj := self newObj.
	obj2 := obj asModifier.
	self assert: obj identicalTo: obj2
]

{ #category : 'tests' }
AvrLiteralModifierTest >> testLabel [

	| obj lit |
	obj := self newObj.
	lit := AvrLiteral label: #abc address: 123.
	obj literal: lit.
	self assert: obj label equals: #abc
]

{ #category : 'tests' }
AvrLiteralModifierTest >> testList [

	| obj a |
	obj := self newObj.
	self assert: obj list isCollection.
	self assert: obj list isEmpty.
	a := OrderedCollection new.
	obj list: a.
	self assert: obj list identicalTo: a
]

{ #category : 'tests' }
AvrLiteralModifierTest >> testLiteral [

	| obj lit |
	obj := self newObj.
	self assert: obj literal isNil.
	lit := AvrLiteral label: #abc port: 123.
	obj literal: lit.
	self assert: obj literal identicalTo: lit
]

{ #category : 'tests' }
AvrLiteralModifierTest >> testMinus [

	| obj |
	obj := self newObj.
	obj literal: (AvrLiteral label: #abc address: 10).
	obj := obj - 5.
	self assert: obj value equals: 5.
	obj := obj - 1.
	self assert: obj value equals: 4
]

{ #category : 'tests' }
AvrLiteralModifierTest >> testPlus [

	| obj |
	obj := self newObj.
	obj literal: (AvrLiteral label: #abc address: 10).
	obj := obj + 5.
	self assert: obj value equals: 15.
	obj := obj + 3.
	self assert: obj value equals: 18
]

{ #category : 'tests' }
AvrLiteralModifierTest >> testPort [

	| obj lit |
	obj := self newObj.
	lit := AvrLiteral label: #abc port: 123.
	obj literal: lit.
	self assert: obj port equals: 123
]

{ #category : 'tests' }
AvrLiteralModifierTest >> testPrintOn [

	| obj s |
	obj := self newObj.
	s := WriteStream on: String new.
	obj printOn: s.
	self assert: s contents equals: 'Mod([nil],list=())'
]

{ #category : 'tests' }
AvrLiteralModifierTest >> testType [

	| obj lit |
	obj := self newObj.
	lit := AvrLiteral label: #abc port: 123.
	obj literal: lit.
	self assert: obj type equals: #port
]

{ #category : 'tests' }
AvrLiteralModifierTest >> testValue [

	| obj |
	obj := self newObj.
	obj literal: (AvrLiteral label: #abc address: 10).
	self assert: obj value equals: 10.
	obj := obj - 5.
	self assert: obj value equals: 5.
	obj := obj + 2.
	self assert: obj value equals: 7
]

{ #category : 'tests' }
AvrLiteralModifierTest >> testValueWithLabeler [

	| obj labeler |
	labeler := AvrLabeler new.
	labeler labelNameAt: #abc put: 1234.
	labeler labelNameAt: #def put: 4567.

	obj := self newObj.
	obj literal: (AvrLiteral label: #a port: 456).
	self assert: (obj valueWithLabeler: labeler) equals: 456.

	obj := self newObj.
	obj literal: (AvrLiteral label: #a port: #abc).
	self assert: (obj valueWithLabeler: labeler) equals: 1234.
	obj := obj + 5.
	self assert: (obj valueWithLabeler: labeler) equals: 1239.

	obj := self newObj.
	obj literal: (AvrLiteral label: #a address: 456).
	self assert: (obj valueWithLabeler: labeler) equals: 456.

	obj := self newObj.
	obj literal: (AvrLiteral label: #a address: #def).
	self assert: (obj valueWithLabeler: labeler) equals: 4567.
	obj := obj - 3.
	self assert: (obj valueWithLabeler: labeler) equals: 4564
]
