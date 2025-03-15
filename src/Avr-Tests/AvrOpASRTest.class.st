"
An AvrOpASRTest is a test class for testing the behavior of AvrOpASR
"
Class {
	#name : 'AvrOpASRTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterOp1Test',
	#classTraits : 'TAvrRegisterOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
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
