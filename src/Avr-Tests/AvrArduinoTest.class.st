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
AvrArduinoTest >> testAssembledCodes [

	| obj codes code |
	obj := self newObj.
	codes := obj assembledCodes.
	self assert: codes isCollection.
	self assert: codes isEmpty.
	obj asm rjmp: 'abc'.
	obj program labeler labelNameAt: 'abc' put: 12.
	codes := obj assembledCodes.
	self assert: codes size equals: 1.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #RJMP.
	self assert: code second immediate equals: 12 - 2 / 2
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

{ #category : 'tests' }
AvrArduinoTest >> testUseInputsOutputsIn [

	| obj list |
	obj := self newObj.
	list := obj asm availableRegisters.
	list addAll: (1 to: 3).
	self assert: list size equals: 3.
	obj useInputs: #( 0 4 ) outputs: nil in: [ :r1 :r2 |
		self assert: r1 equals: 0.
		self assert: r2 equals: 4.
		self deny: (list includesAny: #( 0 4 )) ].
	self assert: list size equals: 3.
	self
		should: [
		obj useInputs: #( 3 4 ) outputs: #( 4 ) in: [ :r1 :r2 |  ] ]
		raise: Error.

	obj := self newObj.
	list := obj asm availableRegisters.
	list addAll: (1 to: 3).
	self assert: list size equals: 3.
	obj useInputs: #( 4 ) outputs: #( 0 ) in: [ :r1 :r2 |
		self assert: r1 equals: 4.
		self assert: r2 equals: 0.
		self deny: (list includesAny: #( 0 4 )) ].
	self assert: list size equals: 3.
	self
		should: [ obj useInputs: #( 3 ) outputs: #( 4 ) in: [ :r1 :r2 |  ] ]
		raise: Error
]

{ #category : 'tests' }
AvrArduinoTest >> testUseRegisterIn [

	| obj list |
	obj := self newObj.
	list := obj asm availableRegisters.
	list addAll: (0 to: 31).
	self assert: list size equals: 32.
	obj useRegisterIn: [ :r |
		self assert: r equals: 0.
		self deny: (list includes: r) ].
	self assert: list size equals: 32.
	self
		should: [ obj useRegisterIn: [ :r | list add: r ] ]
		raise: Error
]

{ #category : 'tests' }
AvrArduinoTest >> testUseRegisterIn2 [

	| obj list |
	obj := self newObj.
	list := obj asm availableRegisters.
	list addAll: (0 to: 31).
	self assert: list size equals: 32.
	obj useRegister: 1 in: [ :r |
		self assert: r equals: 1.
		self deny: (list includes: r) ].
	self assert: list size equals: 32.
	self
		should: [ obj useRegister: 1 in: [ :r | list add: r ] ]
		raise: Error
]

{ #category : 'tests' }
AvrArduinoTest >> testUseRegistersIn [

	| obj list |
	obj := self newObj.
	list := obj asm availableRegisters.
	list addAll: (0 to: 31).
	self assert: list size equals: 32.
	obj use: 4 registersIn: [ :r |
		self assertCollection: r equals: #( 0 1 2 3 ).
		obj
			use: 4
			registersIn: [ :r2 |
			self assertCollection: r2 equals: #( 4 5 6 7 ) ] ].
	self assert: list size equals: 32
]

{ #category : 'tests' }
AvrArduinoTest >> testUseRegistersIn2 [

	| obj list |
	obj := self newObj.
	list := obj asm availableRegisters.
	list addAll: (0 to: 31).
	self assert: list size equals: 32.
	obj useRegisters: #( 0 2 4 ) in: [ :r0 :r2 :r4 |
		self assert: r0 equals: 0.
		self assert: r2 equals: 2.
		self assert: r4 equals: 4.
		self deny: (list includes: r0).
		self deny: (list includes: r2).
		self deny: (list includes: r4) ].
	self assert: list size equals: 32
]
