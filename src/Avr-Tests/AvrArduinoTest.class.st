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
AvrArduinoTest >> testCallSubroutine [

	| obj codes code |
	obj := self newObj.
	obj callSubroutine: 'abc'.
	obj callSubroutine: 'def'.
	codes := obj program codes.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #RCALL.
	self assert: code second immediate equals: 'abc'.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #RCALL.
	self assert: code second immediate equals: 'def'.
	self assert: (obj subroutines includes: 'abc').
	self assert: (obj subroutines includes: 'def')
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

	| obj a |
	obj := self newObj.
	self assert: obj registerPool isCollection.
	self assert: obj registerPool isEmpty.
	a := OrderedCollection new.
	obj registerPool: a.
	self assert: obj registerPool identicalTo: a
]

{ #category : 'tests' }
AvrArduinoTest >> testResolveUndefinedSubroutines [

	| obj |
	obj := self newObj.
	obj callSubroutine: 'all'.
	self assert: (obj program labeler labelNameAt: 'all') isNil.
	obj resolveUndefinedSubroutines.
	self assert: (obj program labeler labelNameAt: 'all') notNil
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
AvrArduinoTest >> testSubroutines [

	| obj a |
	obj := self newObj.
	self assert: obj subroutines isCollection.
	self assert: obj subroutines isEmpty.
	a := Set new.
	obj subroutines: a.
	self assert: obj subroutines identicalTo: a
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
AvrArduinoTest >> testUseRegisterDuring2 [

	| obj list |
	obj := self newObj.
	list := obj registerPool.
	list addAll: (0 to: 31).
	self assert: list size equals: 32.
	obj useRegister: 1 during: [ :r |
		self assert: r equals: 1.
		self deny: (list includes: r) ].
	self assert: list size equals: 32.
	self
		should: [ obj useRegister: 1 during: [ :r | list add: r ] ]
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
