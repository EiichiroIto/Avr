"
An AvrArduinoIOTest is a test class for testing the behavior of AvrArduinoIO
"
Class {
	#name : 'AvrArduinoIOTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrArduinoIOTest >> newObj [

	^ AvrArduinoIO new
]

{ #category : 'tests' }
AvrArduinoIOTest >> testLabel [

	| obj |
	obj := self newObj.
	self assert: obj label isNil.
	obj label: #abc.
	self assert: obj label equals: #abc.
	obj label: #def.
	self assert: obj label equals: #def
]

{ #category : 'tests' }
AvrArduinoIOTest >> testMinus [

	| obj obj2 |
	obj := self newObj.
	obj port: 123.
	self assert: obj port equals: 123.
	obj2 := obj - 10.
	self assert: obj2 port equals: 113
]

{ #category : 'tests' }
AvrArduinoIOTest >> testPlus [

	| obj obj2 |
	obj := self newObj.
	obj port: 123.
	self assert: obj port equals: 123.
	obj2 := obj + 10.
	self assert: obj2 port equals: 133
]

{ #category : 'tests' }
AvrArduinoIOTest >> testPort [

	| obj |
	obj := self newObj.
	self assert: obj port isNil.
	obj port: 123.
	self assert: obj port equals: 123.
	obj port: 456.
	self assert: obj port equals: 456
]

{ #category : 'tests' }
AvrArduinoIOTest >> testPrintOn [

	| obj s |
	obj := self newObj.
	s := String new writeStream.
	obj printOn: s.
	self assert: s contents equals: 'IO(nil)'.
	obj label: #abc.
	obj port: 10.
	s := String new writeStream.
	obj printOn: s.
	self assert: s contents equals: 'IO(abc=0A)'
]

{ #category : 'tests' }
AvrArduinoIOTest >> testValue [

	| obj |
	obj := self newObj.
	obj port: 123.
	self assert: obj value equals: 123.
	obj port: 456.
	self assert: obj value equals: 456
]
