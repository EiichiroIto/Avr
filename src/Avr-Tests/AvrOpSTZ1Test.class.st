"
An AvrOpCOMTest is a test class for testing the behavior of AvrOpCOM
"
Class {
	#name : 'AvrOpSTZ1Test',
	#superclass : 'TestCase',
	#traits : 'TAvrRegisterOp1Test',
	#classTraits : 'TAvrRegisterOp1Test classTrait',
	#category : 'Avr-Tests-Instructions',
	#package : 'Avr-Tests',
	#tag : 'Instructions'
}

{ #category : 'instance creation' }
AvrOpSTZ1Test >> newOp [

	^ AvrOpSTZ1 new
]

{ #category : 'tests' }
AvrOpSTZ1Test >> testMnemonic [

	self assert: self newOp mnemonic equals: #ST
]

{ #category : 'tests' }
AvrOpSTZ1Test >> testOpcode [

	self assert: self newOp opcode equals: 16r8200
]

{ #category : 'tests' }
AvrOpSTZ1Test >> testOperandText [

	| obj |
	obj := self newOp.
	obj register: 5.
	self assert: obj operandText equals: 'Z, r5'
]
