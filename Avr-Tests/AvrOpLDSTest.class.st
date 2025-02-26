"
An AvrOpLDSTest is a test class for testing the behavior of AvrOpLDS
"
Class {
	#name : 'AvrOpLDSTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp3Test',
	#classTraits : 'TAvrRegisterAndImmediateOp3Test classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpLDSTest >> newOp [

	^ AvrOpLDS new
]

{ #category : 'tests' }
AvrOpLDSTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #LDS
]

{ #category : 'tests' }
AvrOpLDSTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9000
]
