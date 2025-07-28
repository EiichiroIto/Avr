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
AvrATmega328PTest >> testAddRegistersByte [

	| obj program codes code |
	obj := self newObj.
	program := obj program.
	obj addRegisters: #( 24 25 26 27 ) byte: 5.
	self assert: program codes size equals: 8.
	codes := program codes.
	code := codes at: 1.
	self assert: code first equals: 0.
	self assert: code second selector equals: #push:.
	self assert: code second register equals: 16.
	code := codes at: 2.
	self assert: code first equals: 2.
	self assert: code second selector equals: #ldiR:data:.
	self assert: code second register equals: 16.
	self assert: code second immediate equals: 5.
	code := codes at: 3.
	self assert: code first equals: 4.
	self assert: code second selector equals: #addDest:source:.
	self assert: code second dest equals: 24.
	self assert: code second source equals: 16.
	code := codes at: 4.
	self assert: code first equals: 6.
	self assert: code second selector equals: #eorDest:source:.
	self assert: code second dest equals: 16.
	self assert: code second source equals: 16.
	code := codes at: 5.
	self assert: code first equals: 8.
	self assert: code second selector equals: #adcDest:source:.
	self assert: code second dest equals: 25.
	self assert: code second source equals: 16.
	code := codes at: 6.
	self assert: code first equals: 10.
	self assert: code second selector equals: #adcDest:source:.
	self assert: code second dest equals: 26.
	self assert: code second source equals: 16.
	code := codes at: 7.
	self assert: code first equals: 12.
	self assert: code second selector equals: #adcDest:source:.
	self assert: code second dest equals: 27.
	self assert: code second source equals: 16.
	code := codes at: 8.
	self assert: code first equals: 14.
	self assert: code second selector equals: #pop:.
	self assert: code second register equals: 16
]

{ #category : 'tests' }
AvrATmega328PTest >> testAvailableLatterHalfRegisters [

	| obj r |
	obj := self newObj.
	obj asm registerFrames reset.
	obj asm registerFrames unusedRegisters: #( 2 4 6 8 18 20 22 ) asOrderedCollection.
	r := obj availableLatterHalfRegisters: 2.
	self assertCollection: r equals: #( 18 20 ) asOrderedCollection.
	self
		assertCollection: obj asm registerFrames unusedRegisters
		equals: #( 2 4 6 8 18 20 22 ) asOrderedCollection
]

{ #category : 'tests' }
AvrATmega328PTest >> testBoot [

	| obj codes code |
	obj := self newObj.
	obj asm registerFrames unusedRegisters: #( 20 ) asOrderedCollection.
	obj program address: 100.
	obj ram setSize: 16r900.
	obj boot.
	codes := obj asm assembledCodesFor: obj.
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
	self
		assert: code second immediate
		equals: AvrArduinoNanoIOMap new sreg port.
	code := codes third.
	self assert: code first equals: 104.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 20.
	self
		assert: code second immediate
		equals: (obj ram ramEnd value bitAnd: 16rFF).
	code := codes fourth.
	self assert: code first equals: 106.
	self assert: code second mnemonic equals: #OUT.
	self assert: code second register equals: 20.
	self
		assert: code second immediate
		equals: AvrArduinoNanoIOMap new spl port.
	code := codes fifth.
	self assert: code first equals: 108.
	self assert: code second mnemonic equals: #LDI.
	self assert: code second register equals: 20.
	self
		assert: code second immediate
		equals: obj ram ramEnd value >> 8.
	code := codes sixth.
	self assert: code first equals: 110.
	self assert: code second mnemonic equals: #OUT.
	self assert: code second register equals: 20.
	self
		assert: code second immediate
		equals: AvrArduinoNanoIOMap new sph port
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
AvrATmega328PTest >> testClearCounterAddress [

	| obj codes code counter |
	obj := self newObj.
	obj asm registerFrames unusedRegisters: #( 5 ) asOrderedCollection.
	obj program address: 100.
	obj ram setSize: 16r900.
	counter := obj ram label: #counter address: 100.
	obj clearCounterAddress: counter.
	codes := obj asm assembledCodesFor: obj.
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
	self assert: code second immediate equals: 100.
	code := codes third.
	self assert: code first equals: 106.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 5.
	self assert: code second immediate equals: 101.
	code := codes fourth.
	self assert: code first equals: 110.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 5.
	self assert: code second immediate equals: 102.
	code := codes fifth.
	self assert: code first equals: 114.
	self assert: code second mnemonic equals: #STS.
	self assert: code second register equals: 5.
	self assert: code second immediate equals: 103
]

{ #category : 'tests' }
AvrATmega328PTest >> testCompareDestsSources [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj compareDests: #( 4 5 8 9 ) sources: #( 24 25 26 27 ).
	self assert: program codes size equals: 4.
	code := program codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #CP.
	self assert: code second dest equals: 4.
	self assert: code second source equals: 24.
	code := program codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #CPC.
	self assert: code second dest equals: 5.
	self assert: code second source equals: 25.
	code := program codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #CPC.
	self assert: code second dest equals: 8.
	self assert: code second source equals: 26.
	code := program codes fourth.
	self assert: code first equals: 6.
	self assert: code second mnemonic equals: #CPC.
	self assert: code second dest equals: 9.
	self assert: code second source equals: 27
]

{ #category : 'tests' }
AvrATmega328PTest >> testConst [

	| obj a |
	obj := self newObj.
	self assert: (obj const isKindOf: AvrATmegaConstants).
	a := AvrATmegaConstants new.
	obj const: a.
	self assert: obj const identicalTo: a
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
	codes := obj asm assembledCodesFor: obj.
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
	codes := obj asm assembledCodesFor: obj.
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
	codes := obj asm assembledCodesFor: obj.
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
	codes := obj asm assembledCodesFor: obj.
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
	codes := obj asm assembledCodesFor: obj.
	self assert: codes size equals: 1.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #SBI.
	self assert: code second io equals: 16r0B.
	self assert: code second bit equals: 5.

	obj := self newObj.
	program := obj program.
	obj digitalWrite: 5 boolean: false.
	codes := obj asm assembledCodesFor: obj.
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
	codes := obj asm assembledCodesFor: obj.
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
	codes := obj asm assembledCodesFor: obj.
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
	codes := obj asm assembledCodesFor: obj.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 100.
	self assert: code second mnemonic equals: #NOP.
	code := codes second.
	self assert: code first equals: 102.
	self assert: code second mnemonic equals: #BRCS.
	self assert: code second immediate equals: -2
]

{ #category : 'tests' }
AvrATmega328PTest >> testDoWhileNotEqual [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj doWhileNotEqual: [ obj asm nop ].
	codes := obj asm assembledCodesFor: obj.
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
AvrATmega328PTest >> testIfEqual [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj ifEqual: [ obj asm nop ].
	codes := obj asm assembledCodesFor: obj.
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
	codes := obj asm assembledCodesFor: obj.
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
AvrATmega328PTest >> testIfGreaterEqual [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj ifGreaterEqual: [ obj asm nop ].
	codes := obj asm assembledCodesFor: obj.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 100.
	self assert: code second mnemonic equals: #BRCS.
	self assert: code second immediate equals: 1.
	code := codes second.
	self assert: code first equals: 102.
	self assert: code second mnemonic equals: #NOP
]

{ #category : 'tests' }
AvrATmega328PTest >> testIfLessThan [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj ifLessThan: [ obj asm nop ].
	codes := obj asm assembledCodesFor: obj.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 100.
	self assert: code second mnemonic equals: #BRCC.
	self assert: code second immediate equals: 1.
	code := codes second.
	self assert: code first equals: 102.
	self assert: code second mnemonic equals: #NOP
]

{ #category : 'tests' }
AvrATmega328PTest >> testIfNotEqual [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj ifNotEqual: [ obj asm nop ].
	codes := obj asm assembledCodesFor: obj.
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
AvrATmega328PTest >> testIfNotZero [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj ifNotZero: [ obj asm nop ].
	codes := obj asm assembledCodesFor: obj.
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
AvrATmega328PTest >> testIfNotZeroIfZero [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj ifNotZero: [ obj asm sei ] ifZero: [ obj asm cli ].
	codes := obj asm assembledCodesFor: obj.
	self assert: codes size equals: 4.
	code := codes first.
	self assert: code first equals: 100.
	self assert: code second mnemonic equals: #BRNE.
	self assert: code second immediate equals: 2.
	code := codes second.
	self assert: code first equals: 102.
	self assert: code second mnemonic equals: #CLI.
	code := codes third.
	self assert: code first equals: 104.
	self assert: code second mnemonic equals: #RJMP.
	self assert: code second immediate equals: 1.
	code := codes fourth.
	self assert: code first equals: 106.
	self assert: code second mnemonic equals: #SEI
]

{ #category : 'tests' }
AvrATmega328PTest >> testIfZero [

	| obj codes code |
	obj := self newObj.
	obj program address: 100.
	obj ifZero: [ obj asm nop ].
	codes := obj asm assembledCodesFor: obj.
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
AvrATmega328PTest >> testInitialize [

	| obj |
	obj := AvrATmega328P basicNew.
	self assert: obj digitalPins isNil.
	obj initialize.
	self assert: obj digitalPins isArray.
	self assert: obj digitalPins size equals: 14
]

{ #category : 'tests' }
AvrATmega328PTest >> testLoadRegistersAddress [

	| obj program code |
	obj := self newObj.
	program := obj program.
	obj loadRegisters: #( 4 5 8 9 ) address: 16r0100.
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
AvrATmega328PTest >> testLoadRegistersImmediate [

	| obj program codes code |
	obj := self newObj.
	program := obj program.
	obj loadRegisters: #( 24 25 30 31 ) immediate: 16r12345678.
	codes := obj asm assembledCodesFor: obj.
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
AvrATmega328PTest >> testNewConstants [

	self assert: (self newObj newConstants isKindOf: AvrATmegaConstants)
]

{ #category : 'tests' }
AvrATmega328PTest >> testNewIO [

	self assert: (self newObj newIO isKindOf: AvrArduinoNanoIOMap)
]

{ #category : 'tests' }
AvrATmega328PTest >> testNewRam [

	self assert: (self newObj newRam isKindOf: AvrArduinoNanoMemoryMap)
]

{ #category : 'tests' }
AvrATmega328PTest >> testOutPortImmediate [

	| obj codes code |
	obj := self newObj.
	obj program address: 120.
	obj outPort: 12 immediate: 45.
	codes := obj asm assembledCodesFor: obj.
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
AvrATmega328PTest >> testSetupDigitalPins [

	| obj arr |
	obj := AvrATmega328P basicNew.
	self assert: obj digitalPins isNil.
	obj io: AvrArduinoNanoIOMap new.
	obj setupDigitalPins.
	arr := obj digitalPins.
	self assert: arr isArray.
	self assert: arr size equals: 14.
	self assert: arr first first label equals: #pinD.
	self assert: arr first second equals: 0
]

{ #category : 'tests' }
AvrATmega328PTest >> testSetupTimer0 [

	| obj stream code |
	obj := self newObj.
	obj setupTimer0.
	stream := ReadStream on: obj program codes.
	code := stream next second.
	self assert: code selector equals: #ldiR:data:.
	self assert: code register equals: 16.
	self assert: code immediate equals: 2r00000010.
	code := stream next second.
	self assert: code selector equals: #out:r:.
	self assert: code register equals: 16.
	self assert: code immediate value equals: 16r24.
	code := stream next second.
	self assert: code selector equals: #ldiR:data:.
	self assert: code register equals: 16.
	self assert: code immediate equals: 2r00000011.
	code := stream next second.
	self assert: code selector equals: #out:r:.
	self assert: code register equals: 16.
	self assert: code immediate value equals: 16r25.
	code := stream next second.
	self assert: code selector equals: #ldiR:data:.
	self assert: code register equals: 16.
	self assert: code immediate equals: 249.
	code := stream next second.
	self assert: code selector equals: #out:r:.
	self assert: code register equals: 16.
	self assert: code immediate value equals: 16r27.
	code := stream next second.
	self assert: code selector equals: #ldiR:data:.
	self assert: code register equals: 16.
	self assert: code immediate equals: 2r00000010.
	code := stream next second.
	self assert: code selector equals: #stsR:data:.
	self assert: code register equals: 16.
	self assert: code immediate value equals: 16r6E.
	self assert: stream atEnd
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
AvrATmega328PTest >> testStoreAddressRegisters [

	| obj program codes code |
	obj := self newObj.
	program := obj program.
	obj storeAddress: 16r0100 registers: #( 4 5 6 7 ).
	codes := obj asm assembledCodesFor: obj.
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
	codes := obj asm assembledCodesFor: obj.
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
AvrATmega328PTest >> testUseLatterHalfRegisterIn [

	| obj list |
	obj := self newObj.
	obj asm registerFrames reset.
	obj asm registerFrames unusedRegisters: (0 to: 31) asOrderedCollection.
	list := obj asm registerFrames unusedRegisters.
	self assert: list size equals: 32.
	obj useLatterHalfRegisterIn: [ :r |
		self assert: r equals: 16.
		self deny: (list includes: r).
		obj useLatterHalfRegisterIn: [ :r2 | self assert: r2 equals: 17 ] ].
	self assert: list size equals: 32.
	self should: [ obj useRegisterIn: [ :r | list add: r ] ] raise: Error
]

{ #category : 'tests' }
AvrATmega328PTest >> testUseLatterHalfRegistersIn [

	| obj list |
	obj := self newObj.
	obj asm registerFrames reset.
	obj asm registerFrames unusedRegisters: (0 to: 31) asOrderedCollection.
	list := obj asm registerFrames unusedRegisters.
	self assert: list size equals: 32.
	obj use: 4 latterHalfRegistersIn: [ :r |
		self assertCollection: r equals: #( 16 17 18 19 ) asOrderedCollection.
		obj
			use: 4
			latterHalfRegistersIn: [ :r2 |
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
