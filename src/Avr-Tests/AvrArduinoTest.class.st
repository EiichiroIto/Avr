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
	obj intHandler: [ obj asm inc: 10 ] named: 'test1'.
	self assert: program codes size equals: 2.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #INC.
	self assert: code second register equals: 10.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #RETI.
	self assert: (program labeler labelNameAt: 'test1') equals: 0
]

{ #category : 'tests' }
AvrArduinoTest >> testIo [

	| obj |
	obj := self newObj.
	self assert: obj io isNil.
	obj io: AvrArduinoNanoIO.
	self assert: obj io identicalTo: AvrArduinoNanoIO
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
AvrArduinoTest >> testNewProgram [

	self assert: (self newObj program isKindOf: AvrProgram)
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

	| obj |
	obj := self newObj.
	self assert: obj ram isNil.
	obj ram: AvrArduinoNanoRam.
	self assert: obj ram identicalTo: AvrArduinoNanoRam
]

{ #category : 'tests' }
AvrArduinoTest >> testRegisterPool [

	| obj |
	obj := self newObj.
	self assert: obj registerPool isCollection.
	self assert: obj registerPool isEmpty
]

{ #category : 'tests' }
AvrArduinoTest >> testReturnRegisters [

	| obj list |
	obj := self newObj.
	list := obj registerPool.
	list addAll: #( 1 2 3 ).
	obj returnRegisters: #( 4 5 ).
	self
		assertCollection: obj registerPool
		equals: #( 1 2 3 4 5 ) asOrderedCollection.
	self should: [ obj returnRegisters: #( 5 6 ) ] raise: Error
]

{ #category : 'tests' }
AvrArduinoTest >> testSubroutineNamed [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj subroutine: [ obj asm inc: 10 ] named: 'test1'.
	self assert: program codes size equals: 2.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #INC.
	self assert: code second register equals: 10.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #RET.
	self assert: (program labeler labelNameAt: 'test1') equals: 0
]

{ #category : 'tests' }
AvrArduinoTest >> testUseRegisterDuring [

	| obj list |
	obj := self newObj.
	list := obj registerPool.
	list addAll: (0 to: 31).
	self assert: list size equals: 32.
	obj useRegisterDuring: [ :r |
		self assert: r equals: 0.
		self deny: (list includes: r) ].
	self assert: list size equals: 32.
	self
		should: [ obj useRegisterDuring: [ :r | list add: r ] ]
		raise: Error
]

{ #category : 'tests' }
AvrArduinoTest >> testUseRegistersDuring [

	| obj list |
	obj := self newObj.
	list := obj registerPool.
	list addAll: (0 to: 31).
	self assert: list size equals: 32.
	obj use: 4 registersDuring: [ :r |
		self assertCollection: r equals: #( 0 1 2 3 ).
		obj
			use: 4
			registersDuring: [ :r2 |
			self assertCollection: r2 equals: #( 4 5 6 7 ) ] ].
	self assert: list size equals: 32
]

{ #category : 'tests' }
AvrArduinoTest >> testUseRegistersDuring2 [

	| obj list |
	obj := self newObj.
	list := obj registerPool.
	list addAll: (0 to: 31).
	self assert: list size equals: 32.
	obj useRegisters: #( 0 2 4 ) during: [ :r |
		self assertCollection: r equals: #( 0 2 4 ).
		self deny: (list includes: 0).
		self deny: (list includes: 2).
		self deny: (list includes: 4) ].
	self assert: list size equals: 32
]
