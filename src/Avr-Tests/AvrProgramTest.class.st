"
An AvrProgramTest is a test class for testing the behavior of AvrProgram
"
Class {
	#name : 'AvrProgramTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Assembly',
	#package : 'Avr-Tests',
	#tag : 'Assembly'
}

{ #category : 'instance creation' }
AvrProgramTest >> newObj [

	^ AvrProgram new
]

{ #category : 'tests' }
AvrProgramTest >> testAdd [

	| obj op |
	obj := self newObj.
	self assert: obj codes isCollection.
	self assert: obj codes isEmpty.
	self assert: obj address equals: 0.
	op := AvrOpNOP new.
	obj add: op.
	self assert: obj codes size equals: 1.
	self assert: obj codes first address identicalTo: 0.
	self assert: obj codes first op identicalTo: op.
	self assert: obj address equals: 2.
	op := AvrOpJMP new immediate: 10.
	obj add: op.
	self assert: obj codes size equals: 2.
	self assert: obj codes second address identicalTo: 2.
	self assert: obj codes second op identicalTo: op.
	self assert: obj address equals: 6
]

{ #category : 'tests' }
AvrProgramTest >> testAddress [

	| obj |
	obj := self newObj.
	self assert: obj address equals: 0.
	obj address: 123.
	self assert: obj address equals: 123
]

{ #category : 'tests' }
AvrProgramTest >> testCodeCount [

	| obj |
	obj := self newObj.
	self assert: obj codeCount equals: 0.
	obj add: AvrOpNOP new.
	self assert: obj codeCount equals: 1.
	obj add: (AvrOpJMP new immediate: 10).
	self assert: obj codeCount equals: 2
]

{ #category : 'tests' }
AvrProgramTest >> testCodes [

	| obj a |
	obj := self newObj.
	self assert: obj codes isCollection.
	self assert: obj codes isEmpty.
	a := Array new.
	obj codes: a.
	self assert: obj codes identicalTo: a
]

{ #category : 'tests' }
AvrProgramTest >> testInitialize [

	| obj |
	obj := self newObj.
	self assert: obj codes isCollection.
	self assert: obj codes isEmpty.
	self assert: obj address equals: 0
]

{ #category : 'tests' }
AvrProgramTest >> testLabel [

	| obj |
	obj := self newObj.
	obj address: 123.
	obj label: 'abc'.
	obj address: 456.
	obj label: 'def'.
	self assert: (obj labelAddressAt: 123) equals: 'abc'.
	self assert: (obj labelAddressAt: 456) equals: 'def'
]

{ #category : 'tests' }
AvrProgramTest >> testLabelAddressAt [

	self testLabelNameAddress
]

{ #category : 'tests' }
AvrProgramTest >> testLabelNameAddress [

	| obj |
	obj := self newObj.
	obj labelName: 'abc' address: 123.
	obj labelName: 'def' address: 456.
	self assert: (obj labelAddressAt: 123) equals: 'abc'.
	self assert: (obj labelAddressAt: 456) equals: 'def'.
	self assert: (obj labelAddressAt: 789) isNil.
	self assert: (obj labelNameAt: 'abc') equals: 123.
	self assert: (obj labelNameAt: 'def') equals: 456.
	self assert: (obj labelNameAt: 'ghi') isNil
]

{ #category : 'tests' }
AvrProgramTest >> testLabelNameAt [

	self testLabelNameAddress
]

{ #category : 'tests' }
AvrProgramTest >> testLabels [

	| obj d |
	obj := self newObj.
	self assert: obj labels isDictionary.
	self assert: obj labels isEmpty.
	d := Dictionary new.
	obj labels: d.
	self assert: obj labels identicalTo: d
]

{ #category : 'tests' }
AvrProgramTest >> testNewItem [

	self assert: (self newObj newItem isKindOf: AvrCode)
]

{ #category : 'tests' }
AvrProgramTest >> testPrintMethodString [

	| obj r |
	obj := self newObj.
	obj add: (AvrOpJMP new immediate: 10).
	obj add: AvrOpNOP new.
	obj add: AvrOpNOP new.
	r := obj printMethodString.
	self assert: r equals: 'self jmp: 10.
self nop.
self nop.
'
]

{ #category : 'tests' }
AvrProgramTest >> testPrintWithLabel [

	| obj r dict |
	obj := self newObj.
	obj add: (AvrOpJMP new immediate: 10).
	obj add: AvrOpNOP new.
	obj address: 20.
	obj add: AvrOpNOP new.
	r := obj printWithLabel.
	self assert: r equals: 'jmp	0x14
nop
nop
'.
	dict := Dictionary new.
	dict at: 20 put: 'label'.
	obj labels: dict.
	r := obj printWithLabel.
	self assert: r equals: 'jmp	@label
nop
label:
nop
'
]

{ #category : 'tests' }
AvrProgramTest >> testPrintWithoutLabel [

	| obj r |
	obj := self newObj.
	obj add: (AvrOpJMP new immediate: 10).
	obj add: AvrOpNOP new.
	obj add: AvrOpNOP new.
	r := obj printWithLabel.
	self assert: r equals: 'jmp	0x14
nop
nop
'
]
