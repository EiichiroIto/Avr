"
An AvrOpSBITest is a test class for testing the behavior of AvrOpSBI
"
Class {
	#name : 'AvrOpSBITest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpSBITest >> newOp [

	^ AvrOpSBI new
]

{ #category : 'tests' }
AvrOpSBITest >> testCategory [

	self assert: self newOp category isSymbol
]

{ #category : 'tests' }
AvrOpSBITest >> testDescription [

	self assert: self newOp description isString
]

{ #category : 'tests' }
AvrOpSBITest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SBI
]

{ #category : 'tests' }
AvrOpSBITest >> testOpcode [

	self assert: self newOp opcode equals: 16r9A00
]

{ #category : 'tests' }
AvrOpSBITest >> testOpcodeMask [

	| op mask |
	op := self newOp.
	mask := op opcodeMask bitXor: 16rFFFF.
	self assert: (op opcode bitAnd: mask) equals: 0
]

{ #category : 'tests' }
AvrOpSBITest >> testSelector [

	self assert: self newOp selector isSymbol
]
