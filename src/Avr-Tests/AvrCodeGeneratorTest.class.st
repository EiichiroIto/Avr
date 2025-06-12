"
An AvrCodeGeneratorTest is a test class for testing the behavior of AvrCodeGenerator
"
Class {
	#name : 'AvrCodeGeneratorTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Utils',
	#package : 'Avr-Tests',
	#tag : 'Utils'
}

{ #category : 'instance creation' }
AvrCodeGeneratorTest >> newObj [

	^ AvrCodeGenerator new
]

{ #category : 'tests' }
AvrCodeGeneratorTest >> testGenerateCollection [

	| obj list r |
	obj := self newObj.
	self assert: obj output isNil.
	list := {
		        AvrOpNOP new.
		        AvrOpCLI new }.
	obj generateCollection: list.
	r := obj output contents.
	self assert: r size equals: 4.
	self assert: r first equals: 0.
	self assert: r second equals: 0.
	self assert: r third equals: 16rF8.
	self assert: r fourth equals: 16r94
]

{ #category : 'tests' }
AvrCodeGeneratorTest >> testGenerateOp [

	| obj op r |
	obj := self newObj.
	self assert: obj output isNil.
	op := AvrOpNOP new.
	obj generateOp: op.
	r := obj output contents.
	self assert: r size equals: 2.
	self assert: r first equals: 0.
	self assert: r second equals: 0
]

{ #category : 'tests' }
AvrCodeGeneratorTest >> testNewByteStream [

	| obj r |
	obj := self newObj.
	r := obj newByteStream.
	self assert: r isStream.
	self assert: (r contents isKindOf: ByteArray)
]

{ #category : 'tests' }
AvrCodeGeneratorTest >> testOutput [

	| obj a |
	obj := self newObj.
	self assert: obj output isNil.
	a := ByteArray new writeStream.
	obj output: a.
	self assert: obj output identicalTo: a
]

{ #category : 'tests' }
AvrCodeGeneratorTest >> testPrivGenerateOp [

	| obj op r |
	obj := self newObj.
	obj output: obj newByteStream.
	self assert: obj output contents isEmpty.
	op := AvrOpNOP new.
	obj privGenerateOp: op.
	r := obj output contents.
	self assert: r size equals: 2.
	self assert: r first equals: 0.
	self assert: r second equals: 0
]
