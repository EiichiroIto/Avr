"
An AvrOpCLCTest is a test class for testing the behavior of AvrOpCLC
"
Class {
	#name : 'AvrOpSEHTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSEHTest >> newOp [

	^ AvrOpSEH new
]

{ #category : 'tests' }
AvrOpSEHTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SEH
]

{ #category : 'tests' }
AvrOpSEHTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9458
]
