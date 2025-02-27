"
An AvrCodeTest is a test class for testing the behavior of AvrCode
"
Class {
	#name : 'AvrCodeTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Assembly',
	#package : 'Avr-Tests',
	#tag : 'Assembly'
}

{ #category : 'instance creation' }
AvrCodeTest >> newObj [

	^ AvrCode new
]

{ #category : 'tests' }
AvrCodeTest >> testAddress [

	| obj |
	obj := self newObj.
	self assert: obj address isNil.
	obj address: 123.
	self assert: obj address equals: 123.
	obj address: 456.
	self assert: obj address equals: 456
]

{ #category : 'tests' }
AvrCodeTest >> testOp [

	| obj a |
	obj := self newObj.
	self assert: obj op isNil.
	a := AvrOpJMP new.
	obj op: a.
	self assert: obj op identicalTo: a
]

{ #category : 'tests' }
AvrCodeTest >> testPrintOn [

	| obj stream |
	obj := self newObj.
	stream := String new writeStream.
	obj printOn: stream.
	self assert: stream contents equals: '    :' , String tab.
	obj address: 12.
	obj op: (AvrOpJMP new immediate: 16r6E).
	stream := String new writeStream.
	obj printOn: stream.
	self assert: stream contents equals: '   c:	0c 94 6e 00 	jmp	0xdc'
]

{ #category : 'tests' }
AvrCodeTest >> testPrintOpOn [

	| obj stream |
	obj := self newObj.
	stream := String new writeStream.
	obj printOpOn: stream.
	self assert: stream contents isEmpty.
	obj address: 12.
	obj op: (AvrOpJMP new immediate: 16r6E).
	stream := String new writeStream.
	obj printOpOn: stream.
	self assert: stream contents equals: 'jmp	0xdc'
]

{ #category : 'tests' }
AvrCodeTest >> testPrintOpOnUsing [

	| obj stream dict |
	dict := Dictionary new.
	obj := self newObj.
	stream := String new writeStream.
	obj printOpOn: stream using: dict.
	self assert: stream contents isEmpty.
	obj address: 12.
	obj op: (AvrOpJMP new immediate: 16r6E).
	stream := String new writeStream.
	obj printOpOn: stream using: dict.
	self assert: stream contents equals: 'jmp	0xdc'.
	dict at: 16rDC put: 'label'.
	stream := String new writeStream.
	obj printOpOn: stream using: dict.
	self assert: stream contents equals: 'jmp	@label'
]

{ #category : 'tests' }
AvrCodeTest >> testPrintOperandOnUsing [

	| obj stream dict |
	dict := Dictionary new.
	obj := self newObj.
	obj address: 12.
	obj op: (AvrOpJMP new immediate: 16r6E).
	stream := String new writeStream.
	obj printOperandOn: stream using: dict.
	self assert: stream contents equals: '0xdc'.
	dict at: 16rDC put: 'label'.
	stream := String new writeStream.
	obj printOperandOn: stream using: dict.
	self assert: stream contents equals: '@label'
]
