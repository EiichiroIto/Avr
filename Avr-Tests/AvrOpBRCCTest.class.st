"
An AvrOpBRCCTest is a test class for testing the behavior of AvrOpBRCC
"
Class {
	#name : 'AvrOpBRCCTest',
	#superclass : 'TestCase',
	#traits : 'TAvrRelativeOpTest',
	#classTraits : 'TAvrRelativeOpTest classTrait',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrOpBRCCTest >> newOp [

	^ AvrOpBRCC new
]

{ #category : 'tests' }
AvrOpBRCCTest >> testMnemonic [

	self assert: self newOp mnemonic equals: #BRCC
]

{ #category : 'tests' }
AvrOpBRCCTest >> testOpcode [

	self assert: self newOp opcode equals: 16rF400
]
