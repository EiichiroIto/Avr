"
An AvrOpASRTest is a test class for testing the behavior of AvrOpASR
"
Class {
	#name : 'AvrOpASRTest',
	#superclass : 'TestCase',
	#traits : 'TAvrOneRegisterOpTest',
	#classTraits : 'TAvrOneRegisterOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpASRTest >> newOp [

	^ AvrOpASR new
]

{ #category : 'tests' }
AvrOpASRTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #ASR
]

{ #category : 'tests' }
AvrOpASRTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9405
]
