"
An AvrOpRCALLTest is a test class for testing the behavior of AvrOpRCALL
"
Class {
	#name : 'AvrOpRCALLTest',
	#superclass : 'TestCase',
	#traits : 'TAvrImmediateOpTest',
	#classTraits : 'TAvrImmediateOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpRCALLTest >> newOp [

	^ AvrOpRCALL new
]

{ #category : 'tests' }
AvrOpRCALLTest >> testIsRelative [

	self assert: self newOp isRelative
]

{ #category : 'tests' }
AvrOpRCALLTest >> testIsValid [

	| op |
	op := self newOp.
	self deny: op isValid.
	op immediate: 2047.
	self assert: op isValid.
	op immediate: 2048.
	self deny: op isValid.
	op immediate: -2048.
	self assert: op isValid.
	op immediate: -2049.
	self deny: op isValid
]

{ #category : 'tests' }
AvrOpRCALLTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #RCALL
]

{ #category : 'tests' }
AvrOpRCALLTest >> testOpcode [

	self assert: self newOp opcode equals: 16rD000
]

{ #category : 'tests' }
AvrOpRCALLTest >> testOperand [

	| op |
	op := self newOp.
	op immediate: 1234.
	self assert: op operand equals: 1234.
	op immediate: -1234.
	self assert: op operand equals: (-1234 bitAnd: 2r111111111111)
]

{ #category : 'tests' }
AvrOpRCALLTest >> testOperandText [

	| op |
	op := self newOp.
	self assert: op operandText equals: 'nil'.
	op immediate: 10.
	self assert: op operandText equals: '.+20'.
	op immediate: -10.
	self assert: op operandText equals: '.-20'
]
