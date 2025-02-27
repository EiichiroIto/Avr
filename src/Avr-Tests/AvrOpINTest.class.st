"
An AvrOpINTest is a test class for testing the behavior of AvrOpIN
"
Class {
	#name : 'AvrOpINTest',
	#superclass : 'TestCase',
	#traits : 'TAvrInputOutputOpTest',
	#classTraits : 'TAvrInputOutputOpTest classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpINTest >> newOp [

	^ AvrOpIN new
]

{ #category : 'tests' }
AvrOpINTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #IN
]

{ #category : 'tests' }
AvrOpINTest >> testOpcode [

	self assert: self newOp opcode equals: 16rB000
]
