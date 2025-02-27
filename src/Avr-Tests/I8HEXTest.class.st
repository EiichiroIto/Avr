"
A SimpleIntelHEXTest is a test class for testing the behavior of SimpleIntelHEX
"
Class {
	#name : 'I8HEXTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Utils',
	#package : 'Avr-Tests',
	#tag : 'Utils'
}

{ #category : 'instance creation' }
I8HEXTest >> newObj [

	^ I8HEX new
]

{ #category : 'tests' }
I8HEXTest >> testBinary [

	| obj a |
	obj := self newObj.
	self assert: (obj binary isKindOf: ByteArray).
	a := #[ 1 2 3 ].
	obj binary: a.
	self assert: obj binary identicalTo: a
]

{ #category : 'tests' }
I8HEXTest >> testBinarySize [

	| obj |
	obj := self newObj.
	self assert: obj binarySize equals: 0.
	obj binarySize: 123.
	self assert: obj binarySize equals: 123
]

{ #category : 'tests' }
I8HEXTest >> testDefaultSize [

	self assert: self newObj defaultSize isInteger
]

{ #category : 'tests' }
I8HEXTest >> testInitialize [

	| obj |
	obj := self newObj.
	self assert: (obj binary isKindOf: ByteArray).
	self assert: obj binarySize isInteger
]

{ #category : 'tests' }
I8HEXTest >> testNewSizeFor [

	| obj |
	obj := self newObj.
	self assert: (obj newSizeFor: 0) equals: 1024.
	self assert: (obj newSizeFor: 1) equals: 2048.
	self assert: (obj newSizeFor: 1024) equals: 2048.
	self assert: (obj newSizeFor: 1025) equals: 2048 + 1024
]

{ #category : 'tests' }
I8HEXTest >> testPutAddress [

	| obj |
	obj := self newObj.
	obj put: #[ 1 2 3 ] address: 0.
	self assert: obj binary first equals: 1.
	self assert: obj binary second equals: 2.
	self assert: obj binary third equals: 3.
	obj put: #[ 4 5 ] address: 2.
	self assert: obj binary first equals: 1.
	self assert: obj binary second equals: 2.
	self assert: obj binary third equals: 4.
	self assert: obj binary fourth equals: 5
]

{ #category : 'tests' }
I8HEXTest >> testReadString [

	| obj r |
	obj := self newObj.
	r := obj readString: ':100000000C945C000C946E000C946E000C946E00CA'.
	self assert: r isArray.
	self assert: r size equals: 3.
	self assert: r first equals: 0.
	self assert: r second equals: 0.
	self assert: r third size equals: 16.
	r := obj readString: ':0E041000209751F30E940000E7CFF894FFCF31'.
	self assert: r isArray.
	self assert: r size equals: 3.
	self assert: r first equals: 0.
	self assert: r second equals: 16r0410.
	self assert: r third size equals: 14.
	r := obj readString: ':00000001FF'.
	self assert: r isArray.
	self assert: r size equals: 3.
	self assert: r first equals: 1.
	self assert: r second equals: 0.
	self assert: r third size equals: 0.
	self
		should: [
		obj readString: ';100000000C945C000C946E000C946E000C946E00CA' ]
		raise: Error.
	self
		should: [
		obj readString: ':100000000C945C000C946E000C946E000C946E00CB' ]
		raise: Error.
	self
		should: [
		obj readString: ':100000000C945C000C946E000C946E000C946E00CA0' ]
		raise: Error
]

{ #category : 'tests' }
I8HEXTest >> testWriteSize [

	self assert: self newObj writeSize isInteger.
	self assert: self newObj writeSize > 0
]
