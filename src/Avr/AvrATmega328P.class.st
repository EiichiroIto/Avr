Class {
	#name : 'AvrATmega328P',
	#superclass : 'AvrArduino',
	#instVars : [
		'digitalPins'
	],
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'constants' }
AvrATmega328P >> adch [

	^ 16r79
]

{ #category : 'constants' }
AvrATmega328P >> adcl [

	^ 16r78
]

{ #category : 'constants' }
AvrATmega328P >> adcsra [

	^ 16r7A
]

{ #category : 'macros' }
AvrATmega328P >> addDests: aCollection sources: aCollection2 [

	asm addDest: aCollection first source: aCollection2 first.
	aCollection copyWithoutFirst
		with: aCollection2 copyWithoutFirst
		do: [ :each :each2 | asm adcDest: each source: each2 ]
]

{ #category : 'macros' }
AvrATmega328P >> addRegisters: aCollection byte: anInteger usingZeroRegister: anInteger2 [

	asm adiwR: aCollection first data: anInteger.
	(aCollection copyFrom: 3 to: aCollection size) do: [ :each |
		asm adcDest: each source: anInteger2 ]
]

{ #category : 'constants' }
AvrATmega328P >> admux [

	^ 16r7C
]

{ #category : 'constants' }
AvrATmega328P >> admuxHigh [

	^ 16r40
]

{ #category : 'constants' }
AvrATmega328P >> admuxMask [

	^ 16r0F
]

{ #category : 'macros' }
AvrATmega328P >> analogRead: anInteger register: anInteger2 [

	| label |
	asm ldiR: anInteger2 data: anInteger.
	asm andiR: anInteger2 data: self admuxMask.
	asm oriR: anInteger2 data: self admuxHigh.
	asm stsAddress: self admux r: anInteger2.
	asm ldiR: self zl data: self adcsra.
	asm ldiR: self zh data: 0.
	asm ldz: anInteger2.
	asm oriR: anInteger2 data: 1 << 6.
	asm stz: anInteger2.
	label := self nextLabel.
	asm label: label.
	asm ldz: anInteger2.
	asm sbrc: anInteger2 bit: 6.
	asm rjmp: label.
	asm ldsR: anInteger2 address: self adcl.
	asm ldsR: anInteger2 + 1 address: self adch
]

{ #category : 'programs' }
AvrATmega328P >> boot [

	self useRegisterDuring: [ :r |
		asm eorDest: r source: r.
		asm out: self sreg r: r ].
	asm ldiR: self yl data: self ramEndLow.
	asm ldiR: self yh data: self ramEndHigh.
	asm out: self sph r: self yh.
	asm out: self spl r: self yl
]

{ #category : 'programs' }
AvrATmega328P >> clearCounter [

	self useRegisterDuring: [ :r |
		asm eorDest: r source: r.
		0 to: 3 do: [ :each |
		asm stsAddress: self counterAddress + each r: r ] ]
]

{ #category : 'constants' }
AvrATmega328P >> counterAddress [

	^ 16r0100
]

{ #category : 'macros' }
AvrATmega328P >> cpDests: aCollection sources: aCollection2 [

	asm cpDest: aCollection first source: aCollection2 first.
	aCollection copyWithoutFirst
		with: aCollection2 copyWithoutFirst
		do: [ :each1 :each2 | asm cpcDest: each1 source: each2 ]
]

{ #category : 'constants' }
AvrATmega328P >> ddrB [

	^ 16r04
]

{ #category : 'constants' }
AvrATmega328P >> ddrC [

	^ 16r07
]

{ #category : 'constants' }
AvrATmega328P >> ddrD [

	^ 16r0A
]

{ #category : 'macros' }
AvrATmega328P >> delay: anInteger [

	| label1 |
	self use: 4 latterHalfRegistersDuring: [ :rs1 |
		self use: 4 registersDuring: [ :rs2 |
			self pushRegisters: rs1 , rs2 during: [
				self ldRegisters: rs1 immediate: anInteger.
				self ldRegisters: rs2 address: self counterAddress.
				self addDests: rs1 sources: rs2.
				label1 := self nextLabel.
				asm label: label1.
				self ldRegisters: rs2 address: self counterAddress.
				self cpDests: rs2 sources: rs1.
				asm brlt: label1 ] ] ]
]

{ #category : 'macros' }
AvrATmega328P >> digitalPin: anInteger mode: anInteger2 [

	| pair pin bit |
	pair := digitalPins at: anInteger + 1.
	pin := pair first.
	bit := pair second.
	anInteger2 = 1 ifTrue: [
		asm sbi: pin + 1 bit: bit.
		asm cbi: pin + 2 bit: bit.
		^ self ].
	anInteger2 = 2 ifTrue: [
		asm cbi: pin + 1 bit: bit.
		asm sbi: pin + 2 bit: bit.
		^ self ].
	asm cbi: pin + 1 bit: bit.
	asm cbi: pin + 2 bit: bit
]

{ #category : 'accessing' }
AvrATmega328P >> digitalPins [

	^ digitalPins
]

{ #category : 'accessing' }
AvrATmega328P >> digitalPins: anObject [

	digitalPins := anObject
]

{ #category : 'macros' }
AvrATmega328P >> digitalRead: anInteger register: anInteger2 [

	| pair pin bit |
	pair := digitalPins at: anInteger + 1.
	pin := pair first.
	bit := pair second.
	asm inR: anInteger2 address: pin.
	asm andiR: anInteger2 data: 1 << bit
]

{ #category : 'macros' }
AvrATmega328P >> digitalWrite: anInteger boolean: aBoolean [

	| pair pin bit |
	pair := digitalPins at: anInteger + 1.
	pin := pair first.
	bit := pair second.
	aBoolean ifTrue: [
		asm sbi: pin + 2 bit: bit.
		^ self ].
	asm cbi: pin + 2 bit: bit
]

{ #category : 'macros' }
AvrATmega328P >> digitalWrite: anInteger register: anInteger2 [

	| pair pin bit label1 label2 |
	pair := digitalPins at: anInteger + 1.
	pin := pair first.
	bit := pair second.
	asm andDest: anInteger2 source: anInteger2.
	label1 := self nextLabel.
	asm breq: label1.
	asm sbi: pin + 2 bit: bit.
	label2 := self nextLabel.
	asm rjmp: label2.
	asm label: label1.
	asm cbi: pin + 2 bit: bit.
	asm label: label2
]

{ #category : 'macros' }
AvrATmega328P >> endlessLoop [

	asm cli.
	asm rjmp: -1
]

{ #category : 'constants' }
AvrATmega328P >> fosc [

	^ 16000000
]

{ #category : 'initialization' }
AvrATmega328P >> initialize [

	super initialize.
	self setupDigitalPins.
	self setupRegisterPool
]

{ #category : 'macros' }
AvrATmega328P >> label: aString [

	asm label: aString
]

{ #category : 'macros' }
AvrATmega328P >> ldRegisters: aCollection address: anInteger [

	aCollection doWithIndex: [ :each :index |
		asm ldsR: each address: anInteger + index - 1 ]
]

{ #category : 'macros' }
AvrATmega328P >> ldRegisters: aCollection immediate: anInteger2 [

	| value |
	value := anInteger2.
	aCollection do: [ :each |
		asm ldiR: each data: (value bitAnd: 16rFF).
		value := value >> 8 ]
]

{ #category : 'programs' }
AvrATmega328P >> loop [

	self subclassResponsibility
]

{ #category : 'constants' }
AvrATmega328P >> mcucr [

	^ 16r35
]

{ #category : 'constants' }
AvrATmega328P >> ocr0a [

	^ 16r27
]

{ #category : 'constants' }
AvrATmega328P >> ocr0b [

	^ 16r28
]

{ #category : 'constants' }
AvrATmega328P >> pinB [

	^ 16r03
]

{ #category : 'constants' }
AvrATmega328P >> pinC [

	^ 16r06
]

{ #category : 'constants' }
AvrATmega328P >> pinD [

	^ 16r09
]

{ #category : 'constants' }
AvrATmega328P >> portB [

	^ 16r05
]

{ #category : 'constants' }
AvrATmega328P >> portC [

	^ 16r08
]

{ #category : 'constants' }
AvrATmega328P >> portD [

	^ 16r0B
]

{ #category : 'constants' }
AvrATmega328P >> ramEnd [

	^ 16r8FF
]

{ #category : 'constants' }
AvrATmega328P >> ramEndHigh [

	^ self ramEnd >> 8
]

{ #category : 'constants' }
AvrATmega328P >> ramEndLow [

	^ self ramEnd bitAnd: 16rFF
]

{ #category : 'private' }
AvrATmega328P >> returnRegisters: aCollection [

	(registerPool includes: aCollection) ifTrue: [ self error ].
	registerPool addAll: aCollection.
	registerPool sort
]

{ #category : 'macros' }
AvrATmega328P >> serial0DataAvailable [

	self useLatterHalfRegisterDuring: [ :r |
		asm ldsR: r address: self ucsr0a.
		asm andiR: r data: self serial0ReceiveComplete ]
]

{ #category : 'constants' }
AvrATmega328P >> serial0DataRegisterEmpty [

	^ 16r20
]

{ #category : 'macros' }
AvrATmega328P >> serial0PeekDataInto: anInteger [

	asm ldsR: anInteger address: self udr0
]

{ #category : 'constants' }
AvrATmega328P >> serial0ReceiveComplete [

	^ 16r80
]

{ #category : 'macros' }
AvrATmega328P >> serial0ReceiveDataInto: anInteger [

	| label |
	label := self nextLabel.
	asm label: label.
	self serial0DataAvailable.
	asm breq: label.
	self serial0PeekDataInto: anInteger
]

{ #category : 'macros' }
AvrATmega328P >> serial0SendRegister: anInteger [

	| label |
	label := self nextLabel.
	asm label: label.
	self useLatterHalfRegisterDuring: [ :r |
		asm ldsR: r address: self ucsr0a.
		asm andiR: r data: self serial0DataRegisterEmpty.
		asm breq: label.
		asm stsAddress: self udr0 r: anInteger ]
]

{ #category : 'constants' }
AvrATmega328P >> serial0TransmitComplete [

	^ 16r40
]

{ #category : 'constants' }
AvrATmega328P >> serialData8 [

	^ 16r06
]

{ #category : 'constants' }
AvrATmega328P >> serialTxRxEnable [

	^ 16r18
]

{ #category : 'programs' }
AvrATmega328P >> setup [

	self subclassResponsibility
]

{ #category : 'private' }
AvrATmega328P >> setupDigitalPins [

	digitalPins := Array new: 14.
	digitalPins at: 1 put: (Array with: self pinD with: 0).
	digitalPins at: 2 put: (Array with: self pinD with: 1).
	digitalPins at: 3 put: (Array with: self pinD with: 2).
	digitalPins at: 4 put: (Array with: self pinD with: 3).
	digitalPins at: 5 put: (Array with: self pinD with: 4).
	digitalPins at: 6 put: (Array with: self pinD with: 5).
	digitalPins at: 7 put: (Array with: self pinD with: 6).
	digitalPins at: 8 put: (Array with: self pinD with: 7).
	digitalPins at: 9 put: (Array with: self pinB with: 0).
	digitalPins at: 10 put: (Array with: self pinB with: 1).
	digitalPins at: 11 put: (Array with: self pinB with: 2).
	digitalPins at: 12 put: (Array with: self pinB with: 3).
	digitalPins at: 13 put: (Array with: self pinB with: 4).
	digitalPins at: 14 put: (Array with: self pinB with: 5)
]

{ #category : 'private' }
AvrATmega328P >> setupRegisterPool [

	registerPool addAll: (0 to: 31)
]

{ #category : 'macros' }
AvrATmega328P >> setupSerial0Baud: anInteger [

	| ubrr |
	self useLatterHalfRegisterDuring: [ :r |
		ubrr := self ubrrForBaud: anInteger.
		asm ldiR: r data: (ubrr bitAnd: 16rFF).
		asm stsAddress: self ubrr0l r: r.
		asm ldiR: r data: (ubrr >> 8 bitAnd: 16rFF).
		asm stsAddress: self ubrr0h r: r.
		asm ldiR: r data: self serialTxRxEnable.
		asm stsAddress: self ucsr0b r: r.
		asm ldiR: r data: self serialData8.
		asm stsAddress: self ucsr0c r: r ]
]

{ #category : 'macros' }
AvrATmega328P >> setupTimer0 [

	self useLatterHalfRegisterDuring: [ :r |
		asm ldiR: r data: 2r00000010.
		asm out: self tccr0a r: r.
		asm ldiR: r data: 2r00000011.
		asm out: self tccr0b r: r.
		asm ldiR: r data: 249.
		asm out: self ocr0a r: r.
		asm ldiR: r data: 2r00000010.
		asm stsAddress: self timsk0 r: r ]
]

{ #category : 'programs' }
AvrATmega328P >> setupVectors [

	self subclassResponsibility
]

{ #category : 'macros' }
AvrATmega328P >> softReset [

	asm jmp: 0
]

{ #category : 'constants' }
AvrATmega328P >> sph [

	^ 16r3E
]

{ #category : 'constants' }
AvrATmega328P >> spl [

	^ 16r3D
]

{ #category : 'constants' }
AvrATmega328P >> sreg [

	^ 16r3F
]

{ #category : 'macros' }
AvrATmega328P >> stAddress: anInteger registers: aCollection [

	aCollection doWithIndex: [ :each :index |
		asm stsAddress: anInteger + index - 1 r: each ]
]

{ #category : 'constants' }
AvrATmega328P >> tccr0a [

	^ 16r24
]

{ #category : 'constants' }
AvrATmega328P >> tccr0b [

	^ 16r25
]

{ #category : 'constants' }
AvrATmega328P >> tcnt0 [

	^ 16r26
]

{ #category : 'constants' }
AvrATmega328P >> tifr0 [

	^ 16r15
]

{ #category : 'programs' }
AvrATmega328P >> timer0compa [

	self useRegisterDuring: [ :r |
		asm push: r.
		asm inR: r address: self sreg.
		self useRegisters: #( 24 25 26 27 ) during: [ :rs |
			self pushRegisters: { r } , rs during: [
				self ldRegisters: rs address: self counterAddress.
				asm eorDest: r source: r.
				self addRegisters: rs byte: 1 usingZeroRegister: r.
				self stAddress: self counterAddress registers: rs ] ].
		asm out: self sreg r: r.
		asm pop: r ]
]

{ #category : 'constants' }
AvrATmega328P >> timsk0 [

	^ 16r6E
]

{ #category : 'macros' }
AvrATmega328P >> togglePin: anInteger [

	| pair pin bit |
	pair := digitalPins at: anInteger + 1.
	pin := pair first.
	bit := pair second.
	asm sbi: pin bit: bit
]

{ #category : 'constants' }
AvrATmega328P >> ubrr0h [

	^ 16rC5
]

{ #category : 'constants' }
AvrATmega328P >> ubrr0l [

	^ 16rC4
]

{ #category : 'private' }
AvrATmega328P >> ubrrForBaud: anInteger [

	^ (self fosc / 16 / anInteger) rounded - 1
]

{ #category : 'constants' }
AvrATmega328P >> ucsr0a [

	^ 16rC0
]

{ #category : 'constants' }
AvrATmega328P >> ucsr0b [

	^ 16rC1
]

{ #category : 'constants' }
AvrATmega328P >> ucsr0c [

	^ 16rC2
]

{ #category : 'constants' }
AvrATmega328P >> udr0 [

	^ 16rC6
]

{ #category : 'private' }
AvrATmega328P >> use: anInteger adiwRegistersDuring: aBlock [

	| registers r |
	registers := OrderedCollection new.
	anInteger timesRepeat: [
		r := registerPool
			     detect: [ :each2 | #( 24 26 28 30 ) includes: each2 ]
			     ifNone: [ self error ].
		registers add: r.
		registerPool remove: r ].
	aBlock value: registers.
	self returnRegisters: registers
]

{ #category : 'private' }
AvrATmega328P >> use: anInteger latterHalfRegistersDuring: aBlock [

	| registers r |
	registers := OrderedCollection new.
	anInteger timesRepeat: [
		r := registerPool
			     detect: [ :each2 | each2 >= 16 ]
			     ifNone: [ self error ].
		registers add: r.
		registerPool remove: r ].
	aBlock value: registers.
	self returnRegisters: registers
]

{ #category : 'private' }
AvrATmega328P >> use: anInteger registersDuring: aBlock [

	| registers |
	registers := registerPool removeFirst: anInteger.
	aBlock value: registers.
	self returnRegisters: registers
]

{ #category : 'private' }
AvrATmega328P >> useLatterHalfRegisterDuring: aBlock [

	| register |
	register := registerPool
		            detect: [ :each | each >= 16 ]
		            ifNone: [ self error ].
	registerPool remove: register.
	aBlock value: register.
	self returnRegisters: { register }
]

{ #category : 'private' }
AvrATmega328P >> useRegisterDuring: aBlock [

	| register |
	register := registerPool removeFirst.
	aBlock value: register.
	(registerPool includes: register) ifTrue: [ self error ].
	registerPool addFirst: register.
	registerPool sort
]

{ #category : 'private' }
AvrATmega328P >> useRegisters: aCollection during: aBlock [

	aCollection do: [ :each | registerPool remove: each ].
	aBlock value: aCollection.
	self returnRegisters: aCollection
]

{ #category : 'macros' }
AvrATmega328P >> wait8 [
	"wait for approximately 40us"

	| label |
	self useRegisterDuring: [ :r |
		asm eorDest: r source: r.
		label := self nextLabel.
		asm label: label.
		asm inc: r.
		asm brne: label ]
]

{ #category : 'accessing' }
AvrATmega328P >> writerFormat [

	^ 'avrdude -c arduino -P {1} -b 115200 -p atmega328p -D -U flash:w:{2}:i 2> avrdude.log'
]

{ #category : 'constants' }
AvrATmega328P >> xh [

	^ 27
]

{ #category : 'constants' }
AvrATmega328P >> xl [

	^ 26
]

{ #category : 'constants' }
AvrATmega328P >> yh [

	^ 29
]

{ #category : 'constants' }
AvrATmega328P >> yl [

	^ 28
]

{ #category : 'constants' }
AvrATmega328P >> zh [

	^ 31
]

{ #category : 'constants' }
AvrATmega328P >> zl [

	^ 30
]
