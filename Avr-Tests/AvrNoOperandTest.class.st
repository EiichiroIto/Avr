"
An AvrNoOperandTest is a test class for testing the behavior of AvrNoOperand
"
Class {
	#name : 'AvrNoOperandTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrNoOperandTest >> newOp [

	^ AvrNoOperand new
]

{ #category : 'tests' }
AvrNoOperandTest >> testArguments [

	self assert: self newOp arguments isEmpty
]

{ #category : 'tests' }
AvrNoOperandTest >> testIsValid [

	self assert: self newOp isValid
]

{ #category : 'tests' }
AvrNoOperandTest >> testOperand [

	self assert: self newOp operand equals: 0
]

{ #category : 'tests' }
AvrNoOperandTest >> testOperandText [

	self assert: self newOp operandText isEmpty
]
