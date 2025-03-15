"
An AvrOpJMPTest is a test class for testing the behavior of AvrOpJMP
"
Class {
	#name : 'AvrOpJMPTest',
	#superclass : 'TestCase',
	#traits : 'TAvrAbsoluteOpTest',
	#classTraits : 'TAvrAbsoluteOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpJMPTest >> newOp [

	^ AvrOpJMP new
]

{ #category : 'tests' }
AvrOpJMPTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #JMP
]

{ #category : 'tests' }
AvrOpJMPTest >> testOpcode [

	self assert: self newOp opcode equals: 16r940C
]
