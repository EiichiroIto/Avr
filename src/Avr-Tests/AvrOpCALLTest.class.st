"
An AvrOpCALLTest is a test class for testing the behavior of AvrOpCALL
"
Class {
	#name : 'AvrOpCALLTest',
	#superclass : 'TestCase',
	#traits : 'TAvrAbsoluteOpTest',
	#classTraits : 'TAvrAbsoluteOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpCALLTest >> newOp [

	^ AvrOpCALL new
]

{ #category : 'tests' }
AvrOpCALLTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #CALL
]

{ #category : 'tests' }
AvrOpCALLTest >> testOpcode [

	self assert: self newOp opcode equals: 16r940E
]
