"
An AvrArduinoRamTest is a test class for testing the behavior of AvrArduinoRam
"
Class {
	#name : 'AvrArduinoRamTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrArduinoRamTest >> newObj [

	^ AvrArduinoRam new
]

{ #category : 'tests' }
AvrArduinoRamTest >> testAddress [

	| obj |
	obj := self newObj.
	self assert: obj address isNil.
	obj address: 123.
	self assert: obj address equals: 123.
	obj address: 456.
	self assert: obj address equals: 456
]

{ #category : 'tests' }
AvrArduinoRamTest >> testLabel [

	| obj |
	obj := self newObj.
	self assert: obj label isNil.
	obj label: #abc.
	self assert: obj label equals: #abc.
	obj label: #def.
	self assert: obj label equals: #def
]

{ #category : 'tests' }
AvrArduinoRamTest >> testMinus [

	| obj obj2 |
	obj := self newObj.
	obj address: 123.
	self assert: obj address equals: 123.
	obj2 := obj - 10.
	self assert: obj2 address equals: 113
]

{ #category : 'tests' }
AvrArduinoRamTest >> testPlus [

	| obj obj2 |
	obj := self newObj.
	obj address: 123.
	self assert: obj address equals: 123.
	obj2 := obj + 10.
	self assert: obj2 address equals: 133
]

{ #category : 'tests' }
AvrArduinoRamTest >> testPrintOn [

	| obj s |
	obj := self newObj.
	s := String new writeStream.
	obj printOn: s.
	self assert: s contents equals: 'MEM(nil)'.
	obj label: #abc.
	obj address: 1000.
	s := String new writeStream.
	obj printOn: s.
	self assert: s contents equals: 'MEM(abc=03E8)'
]

{ #category : 'tests' }
AvrArduinoRamTest >> testValue [

	| obj |
	obj := self newObj.
	obj address: 123.
	self assert: obj value equals: 123.
	obj address: 456.
	self assert: obj value equals: 456
]
