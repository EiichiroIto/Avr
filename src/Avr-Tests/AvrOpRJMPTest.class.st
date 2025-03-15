"
An AvrOpRJMPTest is a test class for testing the behavior of AvrOpRJMP
"
Class {
	#name : 'AvrOpRJMPTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpRJMPTest >> newOp [

	^ AvrOpRJMP new
]

{ #category : 'tests' }
AvrOpRJMPTest >> testIsRelative [

	self assert: self newOp isRelative
]

{ #category : 'tests' }
AvrOpRJMPTest >> testIsValid [

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
AvrOpRJMPTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #RJMP
]

{ #category : 'tests' }
AvrOpRJMPTest >> testOpcode [

	self assert: self newOp opcode equals: 16rC000
]

{ #category : 'tests' }
AvrOpRJMPTest >> testOperand [

	| op |
	op := self newOp.
	op immediate: 1234.
	self assert: op operand equals: 1234.
	op immediate: -1234.
	self assert: op operand equals: (-1234 bitAnd: 2r111111111111)
]

{ #category : 'tests' }
AvrOpRJMPTest >> testOperandText [

	| op |
	op := self newOp.
	self assert: op operandText equals: 'nil'.
	op immediate: 10.
	self assert: op operandText equals: '.+20'.
	op immediate: -10.
	self assert: op operandText equals: '.-20'
]
