"
An AvrArduinoTest is a test class for testing the behavior of AvrArduino
"
Class {
	#name : 'AvrArduinoTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrArduinoTest >> newObj [

	^ AvrArduino new
]

{ #category : 'tests' }
AvrArduinoTest >> testAsm [

	| obj a |
	obj := self newObj.
	self assert: (obj asm isKindOf: AvrAssembler).
	a := AvrAssembler new.
	obj asm: a.
	self assert: obj asm identicalTo: a
]

{ #category : 'tests' }
AvrArduinoTest >> testInitialize [

	| obj |
	obj := self newObj.
	self assert: (obj program isKindOf: AvrProgram)
]

{ #category : 'tests' }
AvrArduinoTest >> testIntHandlerNamed [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj intHandlerNamed: #nop.
	self assert: program codes size equals: 2.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #NOP.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #RETI.
	self assert: (program labeler labelNameAt: #nop) equals: 0
]

{ #category : 'tests' }
AvrArduinoTest >> testIo [

	| obj r |
	obj := self newObj.
	self assert: (obj io isKindOf: AvrIOMap).
	r := AvrArduinoNanoIOMap new.
	obj io: r.
	self assert: obj io identicalTo: r
]

{ #category : 'tests' }
AvrArduinoTest >> testLabel [

	| obj |
	obj := self newObj.
	self assert: obj program labeler labels isEmpty.
	obj program address: 123.
	obj program label: 'abc'.
	self assert: (obj program labeler labelAddressAt: 123) equals: 'abc'
]

{ #category : 'tests' }
AvrArduinoTest >> testLabelNameAt [

	| obj |
	obj := self newObj.
	self assert: obj program labeler labels isEmpty.
	obj program address: 123.
	obj program label: 'abc'.
	self assert: (obj labelNameAt: 'abc') equals: 123
]

{ #category : 'tests' }
AvrArduinoTest >> testNewAssembler [

	self assert: (self newObj newAssembler isKindOf: AvrAssembler).

]

{ #category : 'tests' }
AvrArduinoTest >> testNewIO [

	self assert: (self newObj newIO isKindOf: AvrIOMap)
]

{ #category : 'tests' }
AvrArduinoTest >> testNewProgram [

	self assert: (self newObj program isKindOf: AvrProgram)
]

{ #category : 'tests' }
AvrArduinoTest >> testNewRam [

	self assert: (self newObj newRam isKindOf: AvrMemoryMap)
]

{ #category : 'tests' }
AvrArduinoTest >> testNextLabel [

	| obj |
	obj := self newObj.
	self assert: obj program labeler peekLabel equals: 'label1'.
	self assert: obj nextLabel equals: 'label1'.
	self assert: obj program labeler peekLabel equals: 'label2'.
	self assert: obj nextLabel equals: 'label2'
]

{ #category : 'tests' }
AvrArduinoTest >> testNop [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj nop.
	self assert: program codes size equals: 1.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #NOP
]

{ #category : 'tests' }
AvrArduinoTest >> testProgram [

	| obj a |
	obj := self newObj.
	self assert: (obj program isKindOf: AvrProgram).
	a := AvrProgram new.
	obj program: a.
	self assert: obj program identicalTo: a
]

{ #category : 'tests' }
AvrArduinoTest >> testRam [

	| obj r |
	obj := self newObj.
	self assert: (obj ram isKindOf: AvrMemoryMap).
	r := AvrArduinoNanoMemoryMap new.
	obj ram: r.
	self assert: obj ram identicalTo: r
]

{ #category : 'tests' }
AvrArduinoTest >> testReset [

	| obj asm |
	obj := self newObj.
	asm := obj asm.
	self assert: obj asm equals: asm.
	obj reset.
	self deny: obj asm equals: asm
]

{ #category : 'tests' }
AvrArduinoTest >> testSubroutineNamed [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj subroutineNamed: #nop.
	self assert: program codes size equals: 2.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #NOP.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #RET.
	self assert: (program labeler labelNameAt: #nop) equals: 0
]
