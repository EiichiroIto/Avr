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
	self assert: obj codes first identicalTo: op.
	self assert: obj address equals: 2.
	op := AvrOpJMP new immediate: 10.
	obj add: op.
	self assert: obj codes size equals: 2.
	self assert: obj codes second identicalTo: op.
	self assert: obj address equals: 6
]

{ #category : 'tests' }
AvrProgramTest >> testAddAddress [

	| obj |
	obj := self newObj.
	self assert: obj labeler labels isEmpty.
	obj addAddress: 123.
	obj addAddress: 234.
	obj addAddress: 123.
	obj addAddress: 234.
	obj addAddress: 456.
	self assert: (obj labeler labelAddressAt: 123) equals: 'label1'.
	self assert: (obj labeler labelAddressAt: 234) equals: 'label2'.
	self assert: (obj labeler labelAddressAt: 456) equals: 'label3'.
	self assert: obj labeler labels size equals: 3
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
	self assert: (obj labeler labelAddressAt: 123) equals: 'abc'.
	self assert: (obj labeler labelAddressAt: 456) equals: 'def'
]

{ #category : 'tests' }
AvrProgramTest >> testLabeler [

	| obj a |
	obj := self newObj.
	self assert: (obj labeler isKindOf: AvrLabeler).
	a := AvrLabeler new.
	obj labeler: a.
	self assert: obj labeler identicalTo: a
]

{ #category : 'tests' }
AvrProgramTest >> testNewLabeler [

	self assert: (self newObj newLabeler isKindOf: AvrLabeler)
]

{ #category : 'tests' }
AvrProgramTest >> testPrintLabeledOpAtOn [

	| obj stream op |
	obj := self newObj.
	stream := String new writeStream.
	op := AvrOpJMP new immediate: 16r6E.
	stream := String new writeStream.
	obj printLabeledOp: op at: 12 on: stream.
	self assert: stream contents equals: 'jmp	0xdc'.
	obj labeler labelName: 'label' address: 16rDC.
	stream := String new writeStream.
	obj printLabeledOp: op at: 12 on: stream.
	self assert: stream contents equals: 'jmp	@label'
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
AvrProgramTest >> testPrintOpAtOn [

	| obj stream op |
	obj := self newObj.
	op := AvrOpJMP new immediate: 16r6E.
	stream := String new writeStream.
	obj printOp: op at: 12 on: stream.
	self assert: stream contents equals: '   c:	0c 94 6e 00 	jmp	0xdc'
]

{ #category : 'tests' }
AvrProgramTest >> testPrintOpOn [

	| obj stream op |
	obj := self newObj.
	op := AvrOpJMP new immediate: 16r6E.
	stream := String new writeStream.
	obj printOp: op on: stream.
	self assert: stream contents equals: 'jmp	0xdc'
]

{ #category : 'tests' }
AvrProgramTest >> testPrintOperandOfAtOn [

	| obj stream op |
	obj := self newObj.
	op := AvrOpJMP new immediate: 16r6E.
	stream := String new writeStream.
	obj printOperandOf: op at: 12 on: stream.
	self assert: stream contents equals: '0xdc'.
	obj labeler labelName: 'label' address: 16rDC.
	stream := String new writeStream.
	obj printOperandOf: op at: 12 on: stream.
	self assert: stream contents equals: '@label'
]

{ #category : 'tests' }
AvrProgramTest >> testPrintWithLabel [

	| obj r |
	obj := self newObj.
	obj address: 14.
	obj add: (AvrOpJMP new immediate: 10).
	obj add: AvrOpNOP new.
	obj add: AvrOpNOP new.
	obj startAddress: 14.
	r := obj printWithLabel.
	self assert: r equals: 'jmp	@label1
nop
label1:
nop
'
]

{ #category : 'tests' }
AvrProgramTest >> testPrintWithoutLabel [

	| obj r |
	obj := self newObj.
	obj startAddress: 100.
	obj add: (AvrOpJMP new immediate: 10).
	obj add: AvrOpNOP new.
	obj add: AvrOpNOP new.
	r := obj printWithoutLabel.
	self assert: r equals: '  64:	0c 94 0a 00 	jmp	0x14
  68:	00 00 	nop	
  6a:	00 00 	nop	
'
]

{ #category : 'tests' }
AvrProgramTest >> testStartAddress [

	| obj |
	obj := self newObj.
	self assert: obj startAddress equals: 0.
	obj startAddress: 123.
	self assert: obj startAddress equals: 123
]

{ #category : 'tests' }
AvrProgramTest >> testUpdateLabelUsing [

	| obj op |
	obj := self newObj.
	obj address: 123.
	op := AvrOpJMP new immediate: 10.
	obj updateLabelUsing: op.
	self assert: (obj labeler labelNameAt: 'label1') equals: 20.
	op := AvrOpRCALL new immediate: 10.
	obj updateLabelUsing: op.
	self assert: (obj labeler labelNameAt: 'label2') equals: 123 + 20
]
