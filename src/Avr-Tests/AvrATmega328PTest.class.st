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
AvrATmega328PTest >> testAdcStartConversion [

	self assert: self newObj adcStartConversion equals: 16r40
]

{ #category : 'tests' }
AvrATmega328PTest >> testAddDestsSources [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj addDests: #( 4 5 8 9 ) sources: #( 24 25 26 27 ).
	self assert: program codes size equals: 4.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #ADD.
	self assert: code second dest equals: 4.
	self assert: code second source equals: 24.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #ADC.
	self assert: code second dest equals: 5.
	self assert: code second source equals: 25.
	code := program codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #ADC.
	self assert: code second dest equals: 8.
	self assert: code second source equals: 26.
	code := program codes fourth.
	self assert: code first equals: 6.
	self assert: code second mnemonic equals: #ADC.
	self assert: code second dest equals: 9.
	self assert: code second source equals: 27
]

{ #category : 'tests' }
AvrATmega328PTest >> testAddRegistersByteUsingZeroRegister [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj addRegisters: #( 24 25 26 27 ) byte: 5 usingZeroRegister: 1.
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
AvrATmega328PTest >> testAdmuxDefault [

	self assert: self newObj admuxDefault equals: 16r40
]

{ #category : 'tests' }
AvrATmega328PTest >> testBoot [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj registerPool: #( 20 ) asOrderedCollection.
	obj boot.
	codes := obj assembledCodes.
	self assert: codes size equals: 6.
	code := codes first.
	self assert: code first equals: 100.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 20.
	self assert: code second immediate equals: 0.
	code := codes second.
	self assert: code first equals: 102.
	self assert: code second mnemonic equals: #OUT.
	self assert: code second register equals: 20.
	self assert: code second immediate equals: AvrArduinoNanoIO sreg port.
	code := codes third.
	self assert: code first equals: 104.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 20.
	self
		assert: code second immediate
		equals: AvrArduinoNanoRam ramEndLow value.
	code := codes fourth.
	self assert: code first equals: 106.
	self assert: code second mnemonic equals: #OUT.
	self assert: code second register equals: 20.
	self assert: code second immediate equals: AvrArduinoNanoIO spl port.
	code := codes fifth.
	self assert: code first equals: 108.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 20.
	self
		assert: code second immediate
		equals: AvrArduinoNanoRam ramEndHigh value.
	code := codes sixth.
	self assert: code first equals: 110.
	self assert: code second mnemonic equals: #OUT.
	self assert: code second register equals: 20.
	self assert: code second immediate equals: AvrArduinoNanoIO sph port
]

{ #category : 'tests' }
AvrATmega328PTest >> testChunkNamed [

	| obj codes code |
	obj := self newObj.
	obj asm nop.
	obj chunk: [ obj asm nop ] named: #chunk.
	obj asm nop.
	codes := obj program codes.
	self assert: codes size equals: 3.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #NOP.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #NOP.
	code := codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #NOP.
	self assert: (obj program labeler labelNameAt: #chunk) equals: 2
]

{ #category : 'tests' }
AvrATmega328PTest >> testClearCounter [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj registerPool: #( 5 ) asOrderedCollection.
	obj clearCounter.
	codes := obj assembledCodes.
	self assert: codes size equals: 5.
	code := codes first.
	self assert: code first equals: 100.
	self assert: code second mnemonic equals: #EOR.
	self assert: code second dest equals: 5.
	self assert: code second source equals: 5.
	code := codes second.
	self assert: code first equals: 102.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 5.
	self assert: code second immediate equals: obj counter address.
	code := codes third.
	self assert: code first equals: 106.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 5.
	self assert: code second immediate equals: obj counter address + 1.
	code := codes fourth.
	self assert: code first equals: 110.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 5.
	self assert: code second immediate equals: obj counter address + 2.
	code := codes fifth.
	self assert: code first equals: 114.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 5.
	self assert: code second immediate equals: obj counter address + 3
]

{ #category : 'tests' }
AvrATmega328PTest >> testCounter [

	| obj c |
	obj := self newObj.
	self assert: (obj counter isKindOf: AvrArduinoRam).
	c := AvrArduinoRam new.
	obj counter: c.
	self assert: obj counter identicalTo: c
]

{ #category : 'tests' }
AvrATmega328PTest >> testCpDestsSources [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj cpDests: #( 24 25 26 27 ) sources: #( 5 6 7 8 ).
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
AvrATmega328PTest >> testDigitalPinMode [

	| obj program codes code |
	obj := self newObj.
	program := obj program.
	obj digitalPin: 5 mode: 0.
	codes := obj assembledCodes.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #CBI.
	self assert: code second io equals: 16r0A.
	self assert: code second bit equals: 5.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #CBI.
	self assert: code second io equals: 16r0B.
	self assert: code second bit equals: 5.

	obj := self newObj.
	program := obj program.
	obj digitalPin: 5 mode: 1.
	codes := obj assembledCodes.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #SBI.
	self assert: code second io equals: 16r0A.
	self assert: code second bit equals: 5.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #CBI.
	self assert: code second io equals: 16r0B.
	self assert: code second bit equals: 5.

	obj := self newObj.
	program := obj program.
	obj digitalPin: 5 mode: 2.
	codes := obj assembledCodes.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #CBI.
	self assert: code second io equals: 16r0A.
	self assert: code second bit equals: 5.
	code := codes second.
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
AvrATmega328PTest >> testDigitalReadInto [

	| obj program codes code |
	obj := self newObj.
	program := obj program.
	obj digitalRead: 9 into: 16.
	self assert: program codes size equals: 2.
	codes := obj assembledCodes.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #IN.
	self assert: code second immediate equals: 16r03.
	self assert: code second register equals: 16.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #ANDI.
	self assert: code second immediate equals: 1 << 1.
	self assert: code second register equals: 16
]

{ #category : 'tests' }
AvrATmega328PTest >> testDigitalWriteBoolean [

	| obj program codes code |
	obj := self newObj.
	program := obj program.
	obj digitalWrite: 5 boolean: true.
	codes := obj assembledCodes.
	self assert: codes size equals: 1.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #SBI.
	self assert: code second io equals: 16r0B.
	self assert: code second bit equals: 5.

	obj := self newObj.
	program := obj program.
	obj digitalWrite: 5 boolean: false.
	codes := obj assembledCodes.
	self assert: codes size equals: 1.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #CBI.
	self assert: code second io equals: 16r0B.
	self assert: code second bit equals: 5
]

{ #category : 'tests' }
AvrATmega328PTest >> testDigitalWriteRegister [

	| obj program codes code |
	obj := self newObj.
	program := obj program.
	obj digitalWrite: 13 register: 4.
	self assert: program codes size equals: 5.
	codes := obj assembledCodes.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #AND.
	self assert: code second dest equals: 4.
	self assert: code second source equals: 4.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #BREQ.
	"self assert: code second immediate equals: 'label1'."
	self assert: code second immediate equals: (8 - 4) / 2.
	code := codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #SBI.
	self assert: code second io equals: 16r05.
	self assert: code second bit equals: 5.
	code := codes fourth.
	self assert: code first equals: 6.
	self assert: code second mnemonic equals: #RJMP.
	"self assert: code second immediate equals: 'label2'."
	self assert: code second immediate equals: (10 - 8) / 2.
	code := codes fifth.
	self assert: code first equals: 8.
	self assert: code second mnemonic equals: #CBI.
	self assert: code second io equals: 16r05.
	self assert: code second bit equals: 5.
	self assert: (program labeler labelNameAt: 'label1') equals: 8.
	self assert: (program labeler labelNameAt: 'label2') equals: 10
]

{ #category : 'tests' }
AvrATmega328PTest >> testDoWhileEqual [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj doWhileEqual: [ obj asm nop ].
	codes := obj assembledCodes.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 100.
	self assert: code second mnemonic equals: #NOP.
	code := codes second.
	self assert: code first equals: 102.
	self assert: code second mnemonic equals: #BREQ.
	self assert: code second immediate equals: -2
]

{ #category : 'tests' }
AvrATmega328PTest >> testDoWhileLessThan [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj doWhileLessThan: [ obj asm nop ].
	codes := obj assembledCodes.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 100.
	self assert: code second mnemonic equals: #NOP.
	code := codes second.
	self assert: code first equals: 102.
	self assert: code second mnemonic equals: #BRLT.
	self assert: code second immediate equals: -2
]

{ #category : 'tests' }
AvrATmega328PTest >> testDoWhileNotEqual [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj doWhileNotEqual: [ obj asm nop ].
	codes := obj assembledCodes.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 100.
	self assert: code second mnemonic equals: #NOP.
	code := codes second.
	self assert: code first equals: 102.
	self assert: code second mnemonic equals: #BRNE.
	self assert: code second immediate equals: -2
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
AvrATmega328PTest >> testForever [

	| obj codes code |
	obj := self newObj.
	obj asm nop.
	obj forever: [ obj asm nop ].
	obj asm nop.
	codes := obj program codes.
	self assert: codes size equals: 4.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #NOP.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #NOP.
	code := codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #RJMP.
	self assert: code second immediate equals: #label1.
	code := codes fourth.
	self assert: code first equals: 6.
	self assert: code second mnemonic equals: #NOP.
	self assert: (obj program labeler labelNameAt: #label1) equals: 2
]

{ #category : 'tests' }
AvrATmega328PTest >> testFosc [

	self assert: self newObj fosc equals: 16000000
]

{ #category : 'tests' }
AvrATmega328PTest >> testIfEqual [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj ifEqual: [ obj asm nop ].
	codes := obj assembledCodes.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 100.
	self assert: code second mnemonic equals: #BRNE.
	self assert: code second immediate equals: 1.
	code := codes second.
	self assert: code first equals: 102.
	self assert: code second mnemonic equals: #NOP
]

{ #category : 'tests' }
AvrATmega328PTest >> testIfEqualIfNotEqual [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj ifEqual: [ obj asm sei ] ifNotEqual: [ obj asm cli ].
	codes := obj assembledCodes.
	self assert: codes size equals: 4.
	code := codes first.
	self assert: code first equals: 100.
	self assert: code second mnemonic equals: #BRNE.
	self assert: code second immediate equals: 2.
	code := codes second.
	self assert: code first equals: 102.
	self assert: code second mnemonic equals: #SEI.
	code := codes third.
	self assert: code first equals: 104.
	self assert: code second mnemonic equals: #RJMP.
	self assert: code second immediate equals: 1.
	code := codes fourth.
	self assert: code first equals: 106.
	self assert: code second mnemonic equals: #CLI
]

{ #category : 'tests' }
AvrATmega328PTest >> testIfNotEqual [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj ifNotEqual: [ obj asm nop ].
	codes := obj assembledCodes.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 100.
	self assert: code second mnemonic equals: #BREQ.
	self assert: code second immediate equals: 1.
	code := codes second.
	self assert: code first equals: 102.
	self assert: code second mnemonic equals: #NOP
]

{ #category : 'tests' }
AvrATmega328PTest >> testInitialize [

	| obj |
	obj := AvrATmega328P basicNew.
	self assert: obj digitalPins isNil.
	self assert: obj registerPool isNil.
	obj initialize.
	self assert: obj digitalPins isArray.
	self assert: obj digitalPins size equals: 14.
	self assert: obj registerPool size equals: 32
]

{ #category : 'tests' }
AvrATmega328PTest >> testLdRegistersAddress [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj ldRegisters: #( 4 5 8 9 ) address: 16r0100.
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
	self assert: code second register equals: 8.
	self assert: code second immediate equals: 16r0102.
	code := program codes fourth.
	self assert: code first equals: 12.
	self assert: code second mnemonic equals: #LDS.
	self assert: code second register equals: 9.
	self assert: code second immediate equals: 16r0103
]

{ #category : 'tests' }
AvrATmega328PTest >> testLdRegistersAddressUsingZ [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj ldRegisters: #( 4 5 8 9 ) addressUsingZ: 16r1234.
	self assert: program codes size equals: 6.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: obj zl.
	self assert: code second immediate equals: 16r34.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: obj zh.
	self assert: code second immediate equals: 16r12.
	code := program codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #LD.
	self assert: code second register equals: 4.
	self assert: code second selector equals: #ldzInc:.
	code := program codes fourth.
	self assert: code first equals: 6.
	self assert: code second mnemonic equals: #LD.
	self assert: code second register equals: 5.
	self assert: code second selector equals: #ldzInc:.
	code := program codes fifth.
	self assert: code first equals: 8.
	self assert: code second mnemonic equals: #LD.
	self assert: code second register equals: 8.
	self assert: code second selector equals: #ldzInc:.
	code := program codes sixth.
	self assert: code first equals: 10.
	self assert: code second mnemonic equals: #LD.
	self assert: code second register equals: 9.
	self assert: code second selector equals: #ldzInc:
]

{ #category : 'tests' }
AvrATmega328PTest >> testLdRegistersImmediate [

	| obj program codes code |
	obj := self newObj.
	program := obj program.
	obj ldRegisters: #( 24 25 30 31 ) immediate: 16r12345678.
	codes := obj assembledCodes.
	self assert: codes size equals: 4.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 24.
	self assert: code second immediate equals: 16r78.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 25.
	self assert: code second immediate equals: 16r56.
	code := codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 30.
	self assert: code second immediate equals: 16r34.
	code := codes fourth.
	self assert: code first equals: 6.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 31.
	self assert: code second immediate equals: 16r12
]

{ #category : 'tests' }
AvrATmega328PTest >> testMilliSecondsInto [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj milliSecondsInto: #( 3 4 5 6 ).
	codes := obj assembledCodes.
	self assert: codes size equals: 4.
	code := codes first.
	self assert: code first equals: 100.
	self assert: code second mnemonic equals: #LDS.
	self assert: code second register equals: 3.
	self assert: code second immediate equals: obj counter address.
	code := codes second.
	self assert: code first equals: 104.
	self assert: code second mnemonic equals: #LDS.
	self assert: code second register equals: 4.
	self assert: code second immediate equals: obj counter address + 1.
	code := codes third.
	self assert: code first equals: 108.
	self assert: code second mnemonic equals: #LDS.
	self assert: code second register equals: 5.
	self assert: code second immediate equals: obj counter address + 2.
	code := codes fourth.
	self assert: code first equals: 112.
	self assert: code second mnemonic equals: #LDS.
	self assert: code second register equals: 6.
	self assert: code second immediate equals: obj counter address + 3
]

{ #category : 'tests' }
AvrATmega328PTest >> testOutPortImmediate [

	| obj codes code |
	obj := self newObj.
	obj program address: 120.
	obj outPort: 12 immediate: 45.
	codes := obj assembledCodes.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 120.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 16.
	self assert: code second immediate equals: 45.
	code := codes second.
	self assert: code first equals: 122.
	self assert: code second mnemonic equals: #OUT.
	self assert: code second register equals: 16.
	self assert: code second immediate equals: 12
]

{ #category : 'tests' }
AvrATmega328PTest >> testPushRegistersDuring [

	| obj codes code |
	obj := self newObj.
	obj pushRegisters: #( 1 2 ) during: [ obj asm nop ].
	codes := obj assembledCodes.
	self assert: codes size equals: 5.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #PUSH.
	self assert: code second register equals: 1.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #PUSH.
	self assert: code second register equals: 2.
	code := codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #NOP.
	code := codes fourth.
	self assert: code first equals: 6.
	self assert: code second mnemonic equals: #POP.
	self assert: code second register equals: 2.
	code := codes fifth.
	self assert: code first equals: 8.
	self assert: code second mnemonic equals: #POP.
	self assert: code second register equals: 1.
	self
		should: [ obj pushRegisters: #( 1 2 2 ) during: [  ] ]
		raise: Error
]

{ #category : 'tests' }
AvrATmega328PTest >> testSerialData8 [

	self assert: self newObj serialData8 equals: 2r00000110
]

{ #category : 'tests' }
AvrATmega328PTest >> testSerialDataRegisterEmpty [

	self assert: self newObj serialDataRegisterEmpty equals: 16r20
]

{ #category : 'tests' }
AvrATmega328PTest >> testSerialReceiveComplete [

	self assert: self newObj serialReceiveComplete equals: 2r10000000
]

{ #category : 'tests' }
AvrATmega328PTest >> testSerialTransmitComplete [

	self assert: self newObj serialTransmitComplete equals: 2r01000000
]

{ #category : 'tests' }
AvrATmega328PTest >> testSerialTxRxEnable [

	self assert: self newObj serialTxRxEnable equals: 2r00011000
]

{ #category : 'tests' }
AvrATmega328PTest >> testSetupDigitalPins [

	| obj arr |
	obj := AvrATmega328P basicNew.
	self assert: obj digitalPins isNil.
	obj setupIOandRam.
	obj setupDigitalPins.
	arr := obj digitalPins.
	self assert: arr isArray.
	self assert: arr size equals: 14.
	self assert: arr first first label equals: #pinD.
	self assert: arr first second equals: 0
]

{ #category : 'tests' }
AvrATmega328PTest >> testSetupIOandRam [

	| obj |
	obj := AvrATmega328P basicNew.
	self assert: obj io isNil.
	self assert: obj ram isNil.
	obj setupIOandRam.
	self assert: obj io equals: AvrArduinoNanoIO.
	self assert: obj ram equals: AvrArduinoNanoRam
]

{ #category : 'tests' }
AvrATmega328PTest >> testSetupRegisterPool [

	| obj |
	obj := AvrATmega328P basicNew.
	self assert: obj registerPool isNil.
	obj registerPool: OrderedCollection new.
	obj setupRegisterPool.
	self assert: obj registerPool isCollection.
	self
		assertCollection: obj registerPool
		equals: (0 to: 31) asOrderedCollection
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
AvrATmega328PTest >> testStAddressRegisters [

	| obj program codes code |
	obj := self newObj.
	program := obj program.
	obj stAddress: 16r0100 registers: #( 4 5 6 7 ).
	codes := obj assembledCodes.
	self assert: codes size equals: 4.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 4.
	self assert: code second immediate equals: 16r0100.
	code := codes second.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 5.
	self assert: code second immediate equals: 16r0101.
	code := codes third.
	self assert: code first equals: 8.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 6.
	self assert: code second immediate equals: 16r0102.
	code := codes fourth.
	self assert: code first equals: 12.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 7.
	self assert: code second immediate equals: 16r0103
]

{ #category : 'tests' }
AvrATmega328PTest >> testStAddressUsingZregisters [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj stAddressUsingZ: 16r1234 registers: #( 4 5 8 9 ).
	self assert: program codes size equals: 6.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: obj zl.
	self assert: code second immediate equals: 16r34.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: obj zh.
	self assert: code second immediate equals: 16r12.
	code := program codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #ST.
	self assert: code second register equals: 4.
	self assert: code second selector equals: #stzInc:.
	code := program codes fourth.
	self assert: code first equals: 6.
	self assert: code second mnemonic equals: #ST.
	self assert: code second register equals: 5.
	self assert: code second selector equals: #stzInc:.
	code := program codes fifth.
	self assert: code first equals: 8.
	self assert: code second mnemonic equals: #ST.
	self assert: code second register equals: 8.
	self assert: code second selector equals: #stzInc:.
	code := program codes sixth.
	self assert: code first equals: 10.
	self assert: code second mnemonic equals: #ST.
	self assert: code second register equals: 9.
	self assert: code second selector equals: #stzInc:
]

{ #category : 'tests' }
AvrATmega328PTest >> testSubDestsSources [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj subDests: #( 4 5 8 9 ) sources: #( 24 25 26 27 ).
	self assert: program codes size equals: 4.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #SUB.
	self assert: code second dest equals: 4.
	self assert: code second source equals: 24.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #SBC.
	self assert: code second dest equals: 5.
	self assert: code second source equals: 25.
	code := program codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #SBC.
	self assert: code second dest equals: 8.
	self assert: code second source equals: 26.
	code := program codes fourth.
	self assert: code first equals: 6.
	self assert: code second mnemonic equals: #SBC.
	self assert: code second dest equals: 9.
	self assert: code second source equals: 27
]

{ #category : 'tests' }
AvrATmega328PTest >> testTogglePin [

	| obj program codes code |
	obj := self newObj.
	program := obj program.
	obj togglePin: 3.
	codes := obj assembledCodes.
	self assert: codes size equals: 1.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #SBI.
	self assert: code second io equals: 16r09.
	self assert: code second bit equals: 3
]

{ #category : 'tests' }
AvrATmega328PTest >> testUbrrForBaud [

	self assert: (self newObj ubrrForBaud: 9600) equals: 103.
	self assert: (self newObj ubrrForBaud: 38400) equals: 25.
	self assert: (self newObj ubrrForBaud: 115200) equals: 8
]

{ #category : 'tests' }
AvrATmega328PTest >> testUseAdiwRegistersDuring [

	| obj list |
	obj := self newObj.
	list := obj registerPool.
	self assert: list size equals: 32.
	obj use: 1 adiwRegistersDuring: [ :r |
		self assert: r equals: #( 24 ) asOrderedCollection.
		self deny: (list includes: r).
		obj
			use: 1
			adiwRegistersDuring: [ :r2 |
			self assert: r2 equals: #( 26 ) asOrderedCollection ] ].
	self assert: list size equals: 32.
	self
		should: [ obj useRegisterDuring: [ :r | list add: r ] ]
		raise: Error
]

{ #category : 'tests' }
AvrATmega328PTest >> testUseLatterHalfRegisterDuring [

	| obj list |
	obj := self newObj.
	list := obj registerPool.
	self assert: list size equals: 32.
	obj useLatterHalfRegisterDuring: [ :r |
		self assert: r equals: 16.
		self deny: (list includes: r).
		obj useLatterHalfRegisterDuring: [ :r2 | self assert: r2 equals: 17 ] ].
	self assert: list size equals: 32.
	self
		should: [ obj useRegisterDuring: [ :r | list add: r ] ]
		raise: Error
]

{ #category : 'tests' }
AvrATmega328PTest >> testUseLatterHalfRegistersDuring [

	| obj list |
	obj := self newObj.
	list := obj registerPool.
	self assert: list size equals: 32.
	obj use: 4 latterHalfRegistersDuring: [ :r |
		self assertCollection: r equals: #( 16 17 18 19 ) asOrderedCollection.
		obj
			use: 4
			latterHalfRegistersDuring: [ :r2 |
			self assertCollection: r2 equals: #( 20 21 22 23 ) asOrderedCollection ] ].
	self assert: list size equals: 32
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
