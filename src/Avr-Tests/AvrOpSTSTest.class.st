"
An AvrOpSTSTest is a test class for testing the behavior of AvrOpSTS
"
Class {
	#name : 'AvrOpSTSTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterAndImmediateOp3Test',
	#classTraits : 'TAvrRegisterAndImmediateOp3Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpSTSTest >> newOp [

	^ AvrOpSTS new
]

{ #category : 'tests' }
AvrOpSTSTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #STS
]

{ #category : 'tests' }
AvrOpSTSTest >> testOpcode [

	self assert: self newOp opcode equals: 16r9200
]

{ #category : 'tests' }
AvrOpSTSTest >> testOperandText [

	| obj |
	obj := self newOp.
	self assert: obj operandText equals: 'nil, nil'.
	obj register: 10.
	obj immediate: 20.
	self assert: obj operandText equals: '0x14, r10'
]
