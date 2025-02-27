"
An AvrInputOutputTest is a test class for testing the behavior of AvrInputOutput
"
Class {
	#name : 'AvrInputOutputTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrInputOutputTest >> newOp [

	^ AvrInputOutput new
]

{ #category : 'tests' }
AvrInputOutputTest >> testArguments [

	| obj r |
	obj := self newOp.
	obj io: 10.
	obj bit: 20.
	r := obj arguments.
	self assert: r size equals: 2.
	self assert: r first equals: 10.
	self assert: r second equals: 20
]

{ #category : 'tests' }
AvrInputOutputTest >> testBit [

	| op |
	op := self newOp.
	self assert: op bit isNil.
	op bit: 1.
	self assert: op bit equals: 1.
	op bit: 2.
	self assert: op bit equals: 2
]

{ #category : 'tests' }
AvrInputOutputTest >> testBitRange [

	self assert: self newOp bitRange isCollection
]

{ #category : 'tests' }
AvrInputOutputTest >> testIo [

	| op |
	op := self newOp.
	self assert: op io isNil.
	op io: 1.
	self assert: op io equals: 1.
	op io: 2.
	self assert: op io equals: 2
]

{ #category : 'tests' }
AvrInputOutputTest >> testIoRange [

	self assert: self newOp ioRange isCollection
]

{ #category : 'tests' }
AvrInputOutputTest >> testIsValid [

	| op |
	op := self newOp.
	self deny: op isValid.
	op bit: 3.
	op io: 16r10.
	self assert: op isValid.
	op bit: 8.
	op io: 16r10.
	self deny: op isValid.
	op bit: 3.
	op io: 16r20.
	self deny: op isValid
]

{ #category : 'tests' }
AvrInputOutputTest >> testOperand [

	| op |
	op := self newOp.
	op bit: 3.
	op io: 16r10.
	self assert: op operand equals: 2r10000011
]

{ #category : 'tests' }
AvrInputOutputTest >> testOperandText [

	| op |
	op := self newOp.
	self assert: op operandText equals: 'nil, nil'.
	op bit: 1.
	op io: 16r10.
	self assert: op operandText equals: '0x10, 1'
]
