"
An AvrOpCBITest is a test class for testing the behavior of AvrOpCBI
"
Class {
	#name : 'AvrOpCBITest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpCBITest >> newOp [

	^ AvrOpCBI new
]

{ #category : 'tests' }
AvrOpCBITest >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
AvrOpCBITest >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
AvrOpCBITest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CBI
]

{ #category : 'tests' }
AvrOpCBITest >> testOpcode [

	self assert: self newOp opcode equals: 16r9800
]

{ #category : 'tests' }
AvrOpCBITest >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
AvrOpCBITest >> testSelector [

	self assert: self newOp selector isSymbol
]
