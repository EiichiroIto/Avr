"
An AvrInstructionTest is a test class for testing the behavior of AvrInstruction
"
Class {
	#name : 'AvrInstructionTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Core',
	#package : 'Avr-Tests',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AvrInstructionTest >> newOp [

	^ AvrInstruction new
]

{ #category : 'tests' }
AvrInstructionTest >> testCodeSize [

	self assert: self newOp codeSize equals: 2
]

{ #category : 'tests' }
AvrInstructionTest >> testExtendedCode [

	self assert: self newOp extendedCode isNil
]

{ #category : 'tests' }
AvrInstructionTest >> testIsAbsolute [

	self deny: self newOp isAbsolute
]

{ #category : 'tests' }
AvrInstructionTest >> testIsRelative [

	self deny: self newOp isRelative
]

{ #category : 'tests' }
AvrInstructionTest >> testPrintAbsoluteAddress [

	| obj |
	obj := self newOp.
	self assert: (obj printAbsoluteAddress: nil) equals: 'nil'.
	self assert: (obj printAbsoluteAddress: 'abc') equals: '@abc'.
	self assert: (obj printAbsoluteAddress: 16r12) equals: '0x24'
]

{ #category : 'tests' }
AvrInstructionTest >> testPrintDecImmediate [

	| obj |
	obj := self newOp.
	self assert: (obj printDecImmediate: nil) equals: 'nil'.
	self assert: (obj printDecImmediate: 'abc') equals: '@abc'.
	self assert: (obj printDecImmediate: 78) equals: '78'
]

{ #category : 'tests' }
AvrInstructionTest >> testPrintHexImmediate [

	| obj |
	obj := self newOp.
	self assert: (obj printHexImmediate: nil) equals: 'nil'.
	self assert: (obj printHexImmediate: 'abc') equals: '@abc'.
	self assert: (obj printHexImmediate: 16r78) equals: '0x78'
]

{ #category : 'tests' }
AvrInstructionTest >> testPrintRelativeAddress [

	| obj |
	obj := self newOp.
	self assert: (obj printRelativeAddress: nil) equals: 'nil'.
	self assert: (obj printRelativeAddress: 'abc') equals: '@abc'.
	self assert: (obj printRelativeAddress: 10) equals: '.+20'.
	self assert: (obj printRelativeAddress: -6) equals: '.-12'
]
