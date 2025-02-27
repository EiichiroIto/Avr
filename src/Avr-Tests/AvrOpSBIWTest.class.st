"
An AvrOpSBIWTest is a test class for testing the behavior of AvrOpSBIW
"
Class {
	#name : 'AvrOpSBIWTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp2Test',
	#classTraits : 'TAvrRegisterAndImmediateOp2Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpSBIWTest >> newOp [

	^ AvrOpSBIW new
]

{ #category : 'tests' }
AvrOpSBIWTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #SBIW
]

{ #category : 'tests' }
AvrOpSBIWTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9700
]
