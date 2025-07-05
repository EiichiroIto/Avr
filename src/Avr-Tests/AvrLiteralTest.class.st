"
An AvrLiteralTest is a test class for testing the behavior of AvrLiteral
"
Class {
	#name : 'AvrLiteralTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Assembly',
	#package : 'Avr-Tests',
	#tag : 'Assembly'
}

{ #category : 'instance creation' }
AvrLiteralTest >> newObj [

	^ AvrLiteral new
]

{ #category : 'tests' }
AvrLiteralTest >> testAddress [

	| obj |
	obj := self newObj.
	self assert: obj address isNil.
	obj address: 123.
	self assert: obj address equals: 123.
	obj address: 456.
	self assert: obj address equals: 456
]

{ #category : 'tests' }
AvrLiteralTest >> testAsModifier [

	| obj mod |
	obj := self newObj.
	obj label: #abc.
	obj type: #address.
	obj address: 123.
	mod := obj asModifier.
	self assert: mod literal identicalTo: obj
]

{ #category : 'tests' }
AvrLiteralTest >> testLabel [

	| obj |
	obj := self newObj.
	self assert: obj label isNil.
	obj label: #abc.
	self assert: obj label equals: #abc.
	obj label: #def.
	self assert: obj label equals: #def
]

{ #category : 'tests' }
AvrLiteralTest >> testMinus [

	| obj obj2 |
	obj := self newObj.
	obj type: #port.
	obj port: 123.
	self assert: obj value equals: 123.
	obj2 := obj - 10.
	self assert: obj2 value equals: 113.

	obj := self newObj.
	obj type: #address.
	obj address: 123.
	self assert: obj value equals: 123.
	obj2 := obj - 10.
	self assert: obj2 value equals: 113.

	obj := self newObj.
	obj type: #address.
	obj address: #abc.
	self assert: obj value equals: #abc.
	obj2 := obj - 10.
	self assertCollection: obj2 list equals: #( -10 ) asOrderedCollection
]

{ #category : 'tests' }
AvrLiteralTest >> testPlus [

	| obj obj2 |
	obj := self newObj.
	obj type: #port.
	obj port: 123.
	self assert: obj value equals: 123.
	obj2 := obj + 10.
	self assert: obj2 value equals: 133.

	obj := self newObj.
	obj type: #address.
	obj address: 123.
	self assert: obj value equals: 123.
	obj2 := obj + 10.
	self assert: obj2 value equals: 133.

	obj := self newObj.
	obj type: #address.
	obj address: #abc.
	self assert: obj value equals: #abc.
	obj2 := obj + 10.
	self assertCollection: obj2 list equals: #( 10 ) asOrderedCollection
]

{ #category : 'tests' }
AvrLiteralTest >> testPort [

	| obj |
	obj := self newObj.
	self assert: obj port isNil.
	obj port: 123.
	self assert: obj port equals: 123.
	obj port: 456.
	self assert: obj port equals: 456
]

{ #category : 'tests' }
AvrLiteralTest >> testPrintOn [

	| obj s |
	obj := self newObj.
	obj type: #port.
	s := String new writeStream.
	obj printOn: s.
	self assert: s contents equals: 'AvrLiteral(port:nil)'.
	obj label: #abc.
	obj port: 10.
	s := String new writeStream.
	obj printOn: s.
	self assert: s contents equals: 'AvrLiteral(port:abc=0A)'.

	obj := self newObj.
	obj type: #address.
	s := String new writeStream.
	obj printOn: s.
	self assert: s contents equals: 'AvrLiteral(address:nil)'.
	obj label: #abc.
	obj address: 1000.
	s := String new writeStream.
	obj printOn: s.
	self assert: s contents equals: 'AvrLiteral(address:abc=3E8)'
]

{ #category : 'tests' }
AvrLiteralTest >> testType [

	| obj |
	obj := self newObj.
	self assert: obj type isNil.
	obj type: #port.
	self assert: obj type equals: #port.

	obj := self newObj.
	self assert: obj type isNil.
	obj type: #address.
	self assert: obj type equals: #address.

	obj := self newObj.
	obj type: #port.
	self should: [ obj type: #address ] raise: Error
]

{ #category : 'tests' }
AvrLiteralTest >> testValue [

	| obj |
	obj := self newObj.
	obj type: #port.
	self assert: obj value isNil.
	obj port: 123.
	self assert: obj value equals: 123.

	obj := self newObj.
	obj type: #address.
	self assert: obj value isNil.
	obj address: 456.
	self assert: obj value equals: 456
]

{ #category : 'tests' }
AvrLiteralTest >> testValueWithLabeler [

	| obj labeler |
	labeler := AvrLabeler new.
	labeler labelNameAt: #abc put: 1234.
	labeler labelNameAt: #def put: 4567.

	obj := self newObj.
	obj type: #port.
	self assert: (obj valueWithLabeler: labeler) isNil.
	obj port: 123.
	self assert: (obj valueWithLabeler: labeler) equals: 123.

	obj := self newObj.
	obj type: #port.
	obj port: #abc.
	self assert: (obj valueWithLabeler: labeler) equals: 1234.

	obj := self newObj.
	obj type: #address.
	self assert: (obj valueWithLabeler: labeler) isNil.
	obj address: 456.
	self assert: (obj valueWithLabeler: labeler) equals: 456.

	obj := self newObj.
	obj type: #address.
	obj address: #def.
	self assert: (obj valueWithLabeler: labeler) equals: 4567.

	obj := self newObj.
	obj type: #address.
	obj address: #ghi.
	self assert: (obj valueWithLabeler: labeler) isNil
]
