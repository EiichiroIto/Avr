"
An AvrArduinoNanoTest is a test class for testing the behavior of AvrArduinoNano
"
Class {
	#name : 'AvrATmega328PTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrATmega328PTest >> newObj [

	^ AvrATmega328P new
]

{ #category : 'tests' }
AvrATmega328PTest >> testAdch [

	| obj |
	obj := self newObj.
	self assert: obj adch equals: obj adcl + 1
]

{ #category : 'tests' }
AvrATmega328PTest >> testAdcl [

	self assert: self newObj adcl equals: 16r78
]

{ #category : 'tests' }
AvrATmega328PTest >> testAdcsra [

	self assert: self newObj adcsra equals: 16r7A
]

{ #category : 'tests' }
AvrATmega328PTest >> testAdd32registerByte [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj add32register: 24 byte: 5.
	self assert: program codes size equals: 4.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #EOR.
	self assert: code second dest equals: 0.
	self assert: code second source equals: 0.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #ADIW.
	self assert: code second register equals: 24.
	self assert: code second immediate equals: 5.
	code := program codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #ADC.
	self assert: code second dest equals: 26.
	self assert: code second source equals: 0.
	code := program codes fourth.
	self assert: code first equals: 6.
	self assert: code second mnemonic equals: #ADC.
	self assert: code second dest equals: 27.
	self assert: code second source equals: 0
]

{ #category : 'tests' }
AvrATmega328PTest >> testAdd32registerByteUsingZeroRegister [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj add32register: 24 byte: 5 usingZeroRegister: 1.
	self assert: program codes size equals: 3.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #ADIW.
	self assert: code second register equals: 24.
	self assert: code second immediate equals: 5.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #ADC.
	self assert: code second dest equals: 26.
	self assert: code second source equals: 1.
	code := program codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #ADC.
	self assert: code second dest equals: 27.
	self assert: code second source equals: 1
]

{ #category : 'tests' }
AvrATmega328PTest >> testAdmux [

	self assert: self newObj admux equals: 16r7C
]

{ #category : 'tests' }
AvrATmega328PTest >> testAdmuxHigh [

	self assert: self newObj admuxHigh equals: 16r40
]

{ #category : 'tests' }
AvrATmega328PTest >> testAdmuxMask [

	self assert: self newObj admuxMask equals: 16r0F
]

{ #category : 'tests' }
AvrATmega328PTest >> testCp32destSource [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj cp32dest: 24 source: 5.
	self assert: program codes size equals: 4.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #CP.
	self assert: code second dest equals: 24.
	self assert: code second source equals: 5.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #CPC.
	self assert: code second dest equals: 25.
	self assert: code second source equals: 6.
	code := program codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #CPC.
	self assert: code second dest equals: 26.
	self assert: code second source equals: 7.
	code := program codes fourth.
	self assert: code first equals: 6.
	self assert: code second mnemonic equals: #CPC.
	self assert: code second dest equals: 27.
	self assert: code second source equals: 8
]

{ #category : 'tests' }
AvrATmega328PTest >> testDdrB [

	| obj |
	obj := self newObj.
	self assert: obj ddrB equals: obj pinB + 1
]

{ #category : 'tests' }
AvrATmega328PTest >> testDdrC [

	| obj |
	obj := self newObj.
	self assert: obj ddrC equals: obj pinC + 1
]

{ #category : 'tests' }
AvrATmega328PTest >> testDdrD [

	| obj |
	obj := self newObj.
	self assert: obj ddrD equals: obj pinD + 1
]

{ #category : 'tests' }
AvrATmega328PTest >> testDigitalPinMode [

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
AvrATmega328PTest >> testDigitalPins [

	| obj a |
	obj := self newObj.
	self assert: obj digitalPins isArray.
	a := Array new.
	obj digitalPins: a.
	self assert: obj digitalPins identicalTo: a
]

{ #category : 'tests' }
AvrATmega328PTest >> testDigitalReadRegister [

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
AvrATmega328PTest >> testDigitalWriteBoolean [

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
AvrATmega328PTest >> testDigitalWriteRegister [

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
AvrATmega328PTest >> testEndlessLoop [

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
AvrATmega328PTest >> testInitialize [

	| obj |
	obj := AvrATmega328P basicNew.
	self assert: obj digitalPins isNil.
	obj initialize.
	self assert: obj digitalPins isArray.
	self assert: obj digitalPins size equals: 14
]

{ #category : 'tests' }
AvrATmega328PTest >> testLabel [

	| obj program |
	obj := self newObj.
	program := obj program.
	program address: 123.
	obj label: 'abc'.
	self assert: program codes size equals: 0.
	self assert: (program labeler labelNameAt: 'abc') equals: 123
]

{ #category : 'tests' }
AvrATmega328PTest >> testLd16registerWord [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj ld16register: 24 word: 16r1234.
	self assert: program codes size equals: 2.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 24.
	self assert: code second immediate equals: 16r34.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 25.
	self assert: code second immediate equals: 16r12
]

{ #category : 'tests' }
AvrATmega328PTest >> testLd32registerAddress [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj ld32register: 4 address: 16r0100.
	self assert: program codes size equals: 4.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #LDS.
	self assert: code second register equals: 4.
	self assert: code second immediate equals: 16r0100.
	code := program codes second.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #LDS.
	self assert: code second register equals: 5.
	self assert: code second immediate equals: 16r0101.
	code := program codes third.
	self assert: code first equals: 8.
	self assert: code second mnemonic equals: #LDS.
	self assert: code second register equals: 6.
	self assert: code second immediate equals: 16r0102.
	code := program codes fourth.
	self assert: code first equals: 12.
	self assert: code second mnemonic equals: #LDS.
	self assert: code second register equals: 7.
	self assert: code second immediate equals: 16r0103
]

{ #category : 'tests' }
AvrATmega328PTest >> testLd32registerDword [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj ld32register: 24 dword: 16r12345678.
	self assert: program codes size equals: 4.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 24.
	self assert: code second immediate equals: 16r78.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 25.
	self assert: code second immediate equals: 16r56.
	code := program codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 26.
	self assert: code second immediate equals: 16r34.
	code := program codes fourth.
	self assert: code first equals: 6.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 27.
	self assert: code second immediate equals: 16r12
]

{ #category : 'tests' }
AvrATmega328PTest >> testMcucr [

	self assert: self newObj mcucr equals: 16r35
]

{ #category : 'tests' }
AvrATmega328PTest >> testOcr0a [

	self assert: self newObj ocr0a equals: 16r27
]

{ #category : 'tests' }
AvrATmega328PTest >> testOcr0b [

	self assert: self newObj ocr0b equals: 16r28
]

{ #category : 'tests' }
AvrATmega328PTest >> testPinB [

	self assert: self newObj pinB equals: 3
]

{ #category : 'tests' }
AvrATmega328PTest >> testPinC [

	self assert: self newObj pinC equals: 6
]

{ #category : 'tests' }
AvrATmega328PTest >> testPinD [

	self assert: self newObj pinD equals: 9
]

{ #category : 'tests' }
AvrATmega328PTest >> testPortB [

	| obj |
	obj := self newObj.
	self assert: obj portB equals: obj pinB + 2
]

{ #category : 'tests' }
AvrATmega328PTest >> testPortC [

	| obj |
	obj := self newObj.
	self assert: obj portC equals: obj pinC + 2
]

{ #category : 'tests' }
AvrATmega328PTest >> testPortD [

	| obj |
	obj := self newObj.
	self assert: obj portD equals: obj pinD + 2
]

{ #category : 'tests' }
AvrATmega328PTest >> testRamEnd [

	self assert: self newObj ramEnd equals: 16r8FF
]

{ #category : 'tests' }
AvrATmega328PTest >> testRamEndHigh [

	self assert: self newObj ramEndHigh equals: 16r08
]

{ #category : 'tests' }
AvrATmega328PTest >> testRamEndLow [

	self assert: self newObj ramEndLow equals: 16rFF
]

{ #category : 'tests' }
AvrATmega328PTest >> testSetupDigitalPins [

	| obj arr |
	obj := AvrATmega328P basicNew.
	self assert: obj digitalPins isNil.
	obj setupDigitalPins.
	arr := obj digitalPins.
	self assert: arr isArray.
	self assert: arr size equals: 14.
	self assert: arr first first equals: obj pinD.
	self assert: arr first second equals: 0
]

{ #category : 'tests' }
AvrATmega328PTest >> testSoftReset [

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
AvrATmega328PTest >> testSph [

	self assert: self newObj sph equals: 16r3E
]

{ #category : 'tests' }
AvrATmega328PTest >> testSpl [

	self assert: self newObj spl equals: 16r3D
]

{ #category : 'tests' }
AvrATmega328PTest >> testSreg [

	self assert: self newObj sreg equals: 16r3F
]

{ #category : 'tests' }
AvrATmega328PTest >> testSt32addressRegister [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj st32address: 16r0100 register: 4.
	self assert: program codes size equals: 4.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 4.
	self assert: code second immediate equals: 16r0100.
	code := program codes second.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 5.
	self assert: code second immediate equals: 16r0101.
	code := program codes third.
	self assert: code first equals: 8.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 6.
	self assert: code second immediate equals: 16r0102.
	code := program codes fourth.
	self assert: code first equals: 12.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 7.
	self assert: code second immediate equals: 16r0103
]

{ #category : 'tests' }
AvrATmega328PTest >> testTccr0a [

	self assert: self newObj tccr0a equals: 16r24
]

{ #category : 'tests' }
AvrATmega328PTest >> testTccr0b [

	self assert: self newObj tccr0b equals: 16r25
]

{ #category : 'tests' }
AvrATmega328PTest >> testTcnt0 [

	self assert: self newObj tcnt0 equals: 16r26
]

{ #category : 'tests' }
AvrATmega328PTest >> testTifr0 [

	self assert: self newObj tifr0 equals: 16r15
]

{ #category : 'tests' }
AvrATmega328PTest >> testTimsk0 [

	self assert: self newObj timsk0 equals: 16r6E
]

{ #category : 'tests' }
AvrATmega328PTest >> testTogglePin [

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
AvrATmega328PTest >> testWait8 [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj wait8.
	self assert: program codes size equals: 3.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #EOR.
	self assert: code second dest equals: 0.
	self assert: code second source equals: 0.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #INC.
	self assert: code second register equals: 0.
	code := program codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #BRNE.
	self assert: code second immediate equals: #label1
]

{ #category : 'tests' }
AvrATmega328PTest >> testWriterFormat [

	self assert: self newObj writerFormat isString
]

{ #category : 'tests' }
AvrATmega328PTest >> testXh [

	self assert: self newObj xh equals: 16r1B
]

{ #category : 'tests' }
AvrATmega328PTest >> testXl [

	self assert: self newObj xl equals: 16r1A
]

{ #category : 'tests' }
AvrATmega328PTest >> testYh [

	self assert: self newObj yh equals: 16r1D
]

{ #category : 'tests' }
AvrATmega328PTest >> testYl [

	self assert: self newObj yl equals: 16r1C
]

{ #category : 'tests' }
AvrATmega328PTest >> testZh [

	self assert: self newObj zh equals: 16r1F
]

{ #category : 'tests' }
AvrATmega328PTest >> testZl [

	self assert: self newObj zl equals: 16r1E
]
