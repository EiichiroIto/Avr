"
An AvrOpSBICTest is a test class for testing the behavior of AvrOpSBIC
"
Class {
	#name : 'AvrOpSBICTest',
	#superclass : 'TestCase',
	#traits : 'TAvrIORegAndBitOpTest',
	#classTraits : 'TAvrIORegAndBitOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpSBICTest >> newOp [

	^ AvrOpSBIC new
]

{ #category : 'tests' }
AvrOpSBICTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SBIC
]

{ #category : 'tests' }
AvrOpSBICTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9900
]
