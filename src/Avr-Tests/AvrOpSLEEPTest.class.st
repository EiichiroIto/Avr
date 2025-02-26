"
An AvrOpSLEEPTest is a test class for testing the behavior of AvrOpSLEEP
"
Class {
	#name : 'AvrOpSLEEPTest',
	#superclass : 'TestCase',
	#traits : 'TAvrNoOperandOpTest',
	#classTraits : 'TAvrNoOperandOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSLEEPTest >> newOp [

	^ AvrOpSLEEP new
]

{ #category : 'tests' }
AvrOpSLEEPTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SLEEP
]

{ #category : 'tests' }
AvrOpSLEEPTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9588
]
