"
An AvrArduinoNanoTest is a test class for testing the behavior of AvrArduinoNano
"
Class {
	#name : 'AvrArduinoNanoTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrArduinoNanoTest >> newObj [

	^ AvrArduinoNano new
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testDdrB [

	| obj |
	obj := self newObj.
	self assert: obj ddrB equals: obj pinB + 1
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testDdrC [

	| obj |
	obj := self newObj.
	self assert: obj ddrC equals: obj pinC + 1
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testDdrD [

	| obj |
	obj := self newObj.
	self assert: obj ddrD equals: obj pinD + 1
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testDigitalPinMode [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj digitalPin: 5 mode: 0.
	self assert: program codes size equals: 2.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #CBI.
	self assert: code second io equals: 16r0A.
	self assert: code second bit equals: 5.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #CBI.
	self assert: code second io equals: 16r0B.
	self assert: code second bit equals: 5.

	obj := self newObj.
	program := obj program.
	obj digitalPin: 5 mode: 1.
	self assert: program codes size equals: 2.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #SBI.
	self assert: code second io equals: 16r0A.
	self assert: code second bit equals: 5.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #CBI.
	self assert: code second io equals: 16r0B.
	self assert: code second bit equals: 5.

	obj := self newObj.
	program := obj program.
	obj digitalPin: 5 mode: 2.
	self assert: program codes size equals: 2.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #CBI.
	self assert: code second io equals: 16r0A.
	self assert: code second bit equals: 5.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #SBI.
	self assert: code second io equals: 16r0B.
	self assert: code second bit equals: 5
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testDigitalPins [

	| obj a |
	obj := self newObj.
	self assert: obj digitalPins isArray.
	a := Array new.
	obj digitalPins: a.
	self assert: obj digitalPins identicalTo: a
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testDigitalReadRegister [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj digitalRead: 9 register: 3.
	self assert: program codes size equals: 2.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #IN.
	self assert: code second immediate equals: 16r03.
	self assert: code second register equals: 3.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #ANDI.
	self assert: code second immediate equals: 1 << 1.
	self assert: code second register equals: 3
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testDigitalWriteBoolean [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj digitalWrite: 5 boolean: true.
	self assert: program codes size equals: 1.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #SBI.
	self assert: code second io equals: 16r0B.
	self assert: code second bit equals: 5.

	obj := self newObj.
	program := obj program.
	obj digitalWrite: 5 boolean: false.
	self assert: program codes size equals: 1.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #CBI.
	self assert: code second io equals: 16r0B.
	self assert: code second bit equals: 5
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testDigitalWriteRegister [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj digitalWrite: 13 register: 4.
	self assert: program codes size equals: 5.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #AND.
	self assert: code second dest equals: 4.
	self assert: code second source equals: 4.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #BREQ.
	self assert: code second immediate equals: 'label1'.
	code := program codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #SBI.
	self assert: code second io equals: 16r05.
	self assert: code second bit equals: 5.
	code := program codes fourth.
	self assert: code first equals: 6.
	self assert: code second mnemonic equals: #RJMP.
	self assert: code second immediate equals: 'label2'.
	code := program codes fifth.
	self assert: code first equals: 8.
	self assert: code second mnemonic equals: #CBI.
	self assert: code second io equals: 16r05.
	self assert: code second bit equals: 5.
	self assert: (program labeler labelNameAt: 'label1') equals: 8.
	self assert: (program labeler labelNameAt: 'label2') equals: 10
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testEndlessLoop [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj endlessLoop.
	self assert: program codes size equals: 2.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #CLI.
	code := program codes second.
	self assert: code second mnemonic equals: #RJMP.
	self assert: code second immediate equals: -1
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testInitialize [

	| obj |
	obj := AvrArduinoNano basicNew.
	self assert: obj digitalPins isNil.
	obj initialize.
	self assert: obj digitalPins isArray.
	self assert: obj digitalPins size equals: 14
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testLabel [

	| obj program |
	obj := self newObj.
	program := obj program.
	program address: 123.
	obj label: 'abc'.
	self assert: program codes size equals: 0.
	self assert: (program labeler labelNameAt: 'abc') equals: 123
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testMcucr [

	self assert: self newObj mcucr equals: 16r35
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testNextLabel [

	| obj |
	obj := self newObj.
	self assert: obj program labeler peekLabel equals: 'label1'.
	self assert: obj nextLabel equals: 'label1'.
	self assert: obj program labeler peekLabel equals: 'label2'.
	self assert: obj nextLabel equals: 'label2'
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testPinB [

	self assert: self newObj pinB equals: 3
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testPinC [

	self assert: self newObj pinC equals: 6
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testPinD [

	self assert: self newObj pinD equals: 9
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testPortB [

	| obj |
	obj := self newObj.
	self assert: obj portB equals: obj pinB + 2
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testPortC [

	| obj |
	obj := self newObj.
	self assert: obj portC equals: obj pinC + 2
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testPortD [

	| obj |
	obj := self newObj.
	self assert: obj portD equals: obj pinD + 2
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testSetupDigitalPins [

	| obj arr |
	obj := AvrArduinoNano basicNew.
	self assert: obj digitalPins isNil.
	obj setupDigitalPins.
	arr := obj digitalPins.
	self assert: arr isArray.
	self assert: arr size equals: 14.
	self assert: arr first first equals: obj pinD.
	self assert: arr first second equals: 0
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testSoftReset [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj softReset.
	self assert: program codes size equals: 1.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #JMP.
	self assert: code second immediate equals: 0
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testSph [

	self assert: self newObj sph equals: 16r3E
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testSpl [

	self assert: self newObj spl equals: 16r3D
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testSreg [

	self assert: self newObj sreg equals: 16r3F
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testTogglePin [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj togglePin: 3.
	self assert: program codes size equals: 1.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #SBI.
	self assert: code second io equals: 16r09.
	self assert: code second bit equals: 3
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testXh [

	self assert: self newObj xh equals: 16r1B
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testXl [

	self assert: self newObj xl equals: 16r1A
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testYh [

	self assert: self newObj yh equals: 16r1D
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testYl [

	self assert: self newObj yl equals: 16r1C
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testZh [

	self assert: self newObj zh equals: 16r1F
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testZl [

	self assert: self newObj zl equals: 16r1E
]
