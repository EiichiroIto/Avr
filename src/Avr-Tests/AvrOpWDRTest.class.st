"
An AvrOpWDRTest is a test class for testing the behavior of AvrOpWDR
"
Class {
	#name : 'AvrOpWDRTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpWDRTest >> newOp [

	^ AvrOpWDR new
]

{ #category : 'tests' }
AvrOpWDRTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #WDR
]

{ #category : 'tests' }
AvrOpWDRTest >> testOpcode [

	self assert: self newOp opcode equals: 16r95A8
]
