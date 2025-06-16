Class {
	#name : 'AvrATmega328P',
	#superclass : 'AvrArduino',
	#instVars : [
		'digitalPins',
		'counter'
	],
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'constants' }
AvrATmega328P >> adcStartConversion [

	^ 2r01000000
]

{ #category : 'constants' }
AvrATmega328P >> adcsraDefault [

	^ 2r10000111
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
AvrATmega328P >> admuxDefault [

	^ 16r40
]

{ #category : 'gpio' }
AvrATmega328P >> analogRead: anInteger into: aCollection [

	| label r1 r2 |
	r1 := aCollection first.
	r2 := aCollection second.
	self
		useRegisters: {
				self zl.
				self zh }
		during: [ :z |
			asm ldsR: r1 address: ram admux.
			asm oriR: r1 data: anInteger.
			asm stsAddress: ram admux r: r1.
			asm ldiR: z first data: ram adcsra.
			asm ldiR: z second data: 0.
			asm ldz: r1.
			asm oriR: r1 data: self adcStartConversion.
			asm stz: r1.
			label := self nextLabel.
			asm label: label.
			asm ldz: r1.
			asm sbrc: r1 bit: 6.
			asm rjmp: label.
			asm ldsR: r1 address: ram adcl.
			asm ldsR: r2 address: ram adch ]
]

{ #category : 'programs' }
AvrATmega328P >> boot [

	self outPort: io sreg immediate: 0.
	self outPort: io spl immediate: ram ramEndLow.
	self outPort: io sph immediate: ram ramEndHigh
]

{ #category : 'macros' }
AvrATmega328P >> chunk: aBlock named: aString [

	asm label: aString.
	aBlock value
]

{ #category : 'timer' }
AvrATmega328P >> clearCounter [

	self useRegisterDuring: [ :r |
		asm eorDest: r source: r.
		0 to: 3 do: [ :each |
		asm stsAddress: counter + each r: r ] ]
]

{ #category : 'accessing' }
AvrATmega328P >> counter [

	^ counter
]

{ #category : 'accessing' }
AvrATmega328P >> counter: anObject [

	counter := anObject
]

{ #category : 'macros' }
AvrATmega328P >> cpDests: aCollection sources: aCollection2 [

	asm cpDest: aCollection first source: aCollection2 first.
	aCollection copyWithoutFirst
		with: aCollection2 copyWithoutFirst
		do: [ :each1 :each2 | asm cpcDest: each1 source: each2 ]
]

{ #category : 'timer' }
AvrATmega328P >> delay: aCollection [

	| label1 |
	self use: 4 registersDuring: [ :rs2 |
		self pushRegisters: aCollection , rs2 during: [
			self ldRegisters: rs2 address: counter.
			self addDests: aCollection sources: rs2.
			label1 := self nextLabel.
			asm label: label1.
			self ldRegisters: rs2 address: counter.
			self cpDests: rs2 sources: aCollection.
			asm brlt: label1 ] ]
]

{ #category : 'misc' }
AvrATmega328P >> delayMicroseconds: aCollection [

	| r1 r2 label1 label2 |
	label1 := self nextLabel.
	label2 := self nextLabel.
	r1 := aCollection first.
	r2 := aCollection second.
	self useRegisterDuring: [ :r |
		asm eorDest: r source: r.
		asm cpiR: r1 data: 16r02.
		asm cpcDest: r2 source: r.
		asm brcs: label1.
		self addDests: aCollection sources: aCollection.
		self addDests: aCollection sources: aCollection.
		asm sbiwR: r1 data: 5.
		asm label: label2.
		asm sbiwR: r1 data: 1.
		asm brne: label2.
		asm label: label1 ]
]

{ #category : 'gpio' }
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

{ #category : 'gpio' }
AvrATmega328P >> digitalRead: anInteger into: anInteger2 [

	| pair pin bit |
	pair := digitalPins at: anInteger + 1.
	pin := pair first.
	bit := pair second.
	asm inR: anInteger2 address: pin.
	asm andiR: anInteger2 data: 1 << bit
]

{ #category : 'gpio' }
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

{ #category : 'gpio' }
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
AvrATmega328P >> doWhileEqual: aBlock [

	| label |
	label := self nextLabel.
	asm label: label.
	aBlock value.
	asm breq: label
]

{ #category : 'macros' }
AvrATmega328P >> doWhileLessThan: aBlock [

	| label |
	label := self nextLabel.
	asm label: label.
	aBlock value.
	asm brlt: label
]

{ #category : 'macros' }
AvrATmega328P >> doWhileNotEqual: aBlock [

	| label |
	label := self nextLabel.
	asm label: label.
	aBlock value.
	asm brne: label
]

{ #category : 'misc' }
AvrATmega328P >> endlessLoop [

	asm cli.
	asm rjmp: -1
]

{ #category : 'macros' }
AvrATmega328P >> forever: aBlock [

	| label |
	label := self nextLabel.
	asm label: label.
	aBlock value.
	asm rjmp: label
]

{ #category : 'constants' }
AvrATmega328P >> fosc [

	^ 16000000
]

{ #category : 'macros' }
AvrATmega328P >> ifEqual: aBlock [

	| label1 |
	label1 := self nextLabel.
	asm brne: label1.
	aBlock value.
	asm label: label1
]

{ #category : 'macros' }
AvrATmega328P >> ifEqual: aBlock ifNotEqual: aBlock2 [

	| label1 label2 |
	label1 := self nextLabel.
	label2 := self nextLabel.
	asm brne: label1.
	aBlock value.
	asm rjmp: label2.
	asm label: label1.
	aBlock2 value.
	asm label: label2
]

{ #category : 'macros' }
AvrATmega328P >> ifNotEqual: aBlock [

	| label1 |
	label1 := self nextLabel.
	asm breq: label1.
	aBlock value.
	asm label: label1
]

{ #category : 'initialization' }
AvrATmega328P >> initialize [

	super initialize.
	self setupIOandRam.
	self setupDigitalPins.
	self setupRegisterPool.
	counter := AvrArduinoNanoRam label: #counter address: 16r0100
]

{ #category : 'macros' }
AvrATmega328P >> ldRegisters: aCollection address: anInteger [

	aCollection doWithIndex: [ :each :index |
		asm ldsR: each address: anInteger + index - 1 ]
]

{ #category : 'macros' }
AvrATmega328P >> ldRegisters: aCollection addressUsingZ: anInteger [

	asm ldiR: self zl data: (anInteger bitAnd: 16rFF).
	asm ldiR: self zh data: (anInteger >> 8 bitAnd: 16rFF).
	aCollection do: [ :each | asm ldzInc: each ]
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

{ #category : 'timer' }
AvrATmega328P >> milliSecondsInto: aCollection [

	self ldRegisters: aCollection address: counter
]

{ #category : 'misc' }
AvrATmega328P >> nibble2HexDigitRegister: anInteger [

	| label |
	label := self nextLabel.
	self useLatterHalfRegisterDuring: [ :r |
		self pushRegisters: { r } during: [
			asm ldiR: r data: 16r0F.
			asm andDest: anInteger source: r.
			asm ldiR: r data: 48.
			asm addDest: anInteger source: r.
			asm cpiR: anInteger data: 58.
			asm brlt: label.
			asm ldiR: r data: 7.
			asm addDest: anInteger source: r.
			asm label: label ] ]
]

{ #category : 'macros' }
AvrATmega328P >> outPort: anInteger immediate: anInteger2 [

	self useLatterHalfRegisterDuring: [ :r |
		asm ldiR: r data: anInteger2.
		asm out: anInteger r: r ]
]

{ #category : 'macros' }
AvrATmega328P >> pushRegisters: aCollection during: aBlock [

	aCollection size = aCollection asSet size ifFalse: [
		self error: 'registers duplicated' ].
	aCollection do: [ :each | asm push: each ].
	aBlock value.
	aCollection reverseDo: [ :each | asm pop: each ]
]

{ #category : 'serial' }
AvrATmega328P >> serial0DataAvailable [

	self useLatterHalfRegisterDuring: [ :r |
		self pushRegisters: { r } during: [
			asm ldsR: r address: ram ucsr0a.
			asm andiR: r data: self serialReceiveComplete ] ]
]

{ #category : 'serial' }
AvrATmega328P >> serial0PeekDataInto: anInteger [

	asm ldsR: anInteger address: ram udr0
]

{ #category : 'serial' }
AvrATmega328P >> serial0ReceiveDataInto: anInteger [

	| label |
	label := self nextLabel.
	asm label: label.
	self serial0DataAvailable.
	asm breq: label.
	self serial0PeekDataInto: anInteger
]

{ #category : 'serial' }
AvrATmega328P >> serial0SendRegister: anInteger [

	| label |
	label := self nextLabel.
	self useLatterHalfRegisterDuring: [ :r |
		self pushRegisters: { r } during: [
			asm label: label.
			asm ldsR: r address: ram ucsr0a.
			asm andiR: r data: self serialDataRegisterEmpty.
			asm breq: label.
			asm stsAddress: ram udr0 r: anInteger ] ]
]

{ #category : 'constants' }
AvrATmega328P >> serialData8 [

	^ 16r06
]

{ #category : 'constants' }
AvrATmega328P >> serialDataRegisterEmpty [

	^ 16r20
]

{ #category : 'constants' }
AvrATmega328P >> serialReceiveComplete [

	^ 16r80
]

{ #category : 'constants' }
AvrATmega328P >> serialTransmitComplete [

	^ 16r40
]

{ #category : 'constants' }
AvrATmega328P >> serialTxRxEnable [

	^ 16r18
]

{ #category : 'programs' }
AvrATmega328P >> setup [

	self subclassResponsibility
]

{ #category : 'gpio' }
AvrATmega328P >> setupAnalog [

	self useLatterHalfRegisterDuring: [ :r |
		asm ldiR: r data: self admuxDefault.
		asm stsAddress: ram admux r: r.
		asm ldiR: r data: self adcsraDefault.
		asm stsAddress: ram adcsra r: r ]
]

{ #category : 'private' }
AvrATmega328P >> setupDigitalPins [

	digitalPins := Array new: 14.
	digitalPins at: 1 put: (Array with: io pinD with: 0).
	digitalPins at: 2 put: (Array with: io pinD with: 1).
	digitalPins at: 3 put: (Array with: io pinD with: 2).
	digitalPins at: 4 put: (Array with: io pinD with: 3).
	digitalPins at: 5 put: (Array with: io pinD with: 4).
	digitalPins at: 6 put: (Array with: io pinD with: 5).
	digitalPins at: 7 put: (Array with: io pinD with: 6).
	digitalPins at: 8 put: (Array with: io pinD with: 7).
	digitalPins at: 9 put: (Array with: io pinB with: 0).
	digitalPins at: 10 put: (Array with: io pinB with: 1).
	digitalPins at: 11 put: (Array with: io pinB with: 2).
	digitalPins at: 12 put: (Array with: io pinB with: 3).
	digitalPins at: 13 put: (Array with: io pinB with: 4).
	digitalPins at: 14 put: (Array with: io pinB with: 5)
]

{ #category : 'private' }
AvrATmega328P >> setupIOandRam [

	io := AvrArduinoNanoIO.
	ram := AvrArduinoNanoRam
]

{ #category : 'private' }
AvrATmega328P >> setupRegisterPool [

	registerPool addAll: (0 to: 31)
]

{ #category : 'serial' }
AvrATmega328P >> setupSerial0Baud: anInteger [

	| ubrr |
	self useLatterHalfRegisterDuring: [ :r |
		ubrr := self ubrrForBaud: anInteger.
		asm ldiR: r data: (ubrr bitAnd: 16rFF).
		asm stsAddress: ram ubrr0l r: r.
		asm ldiR: r data: (ubrr >> 8 bitAnd: 16rFF).
		asm stsAddress: ram ubrr0h r: r.
		asm ldiR: r data: self serialTxRxEnable.
		asm stsAddress: ram ucsr0b r: r.
		asm ldiR: r data: self serialData8.
		asm stsAddress: ram ucsr0c r: r ]
]

{ #category : 'timer' }
AvrATmega328P >> setupTimer0 [

	self useLatterHalfRegisterDuring: [ :r |
		asm ldiR: r data: 2r00000010.
		asm out: io tccr0a r: r.
		asm ldiR: r data: 2r00000011.
		asm out: io tccr0b r: r.
		asm ldiR: r data: 249.
		asm out: io ocr0a r: r.
		asm ldiR: r data: 2r00000010.
		asm stsAddress: ram timsk0 r: r ]
]

{ #category : 'programs' }
AvrATmega328P >> setupVectors [

	self subclassResponsibility
]

{ #category : 'misc' }
AvrATmega328P >> softReset [

	asm jmp: 0
]

{ #category : 'macros' }
AvrATmega328P >> stAddress: anInteger registers: aCollection [

	aCollection doWithIndex: [ :each :index |
		asm stsAddress: anInteger + index - 1 r: each ]
]

{ #category : 'macros' }
AvrATmega328P >> stAddressUsingZ: anInteger registers: aCollection [

	asm ldiR: self zl data: (anInteger bitAnd: 16rFF).
	asm ldiR: self zh data: (anInteger >> 8 bitAnd: 16rFF).
	aCollection do: [ :each | asm stzInc: each ]
]

{ #category : 'macros' }
AvrATmega328P >> subDests: aCollection sources: aCollection2 [

	asm subDest: aCollection first source: aCollection2 first.
	aCollection copyWithoutFirst
		with: aCollection2 copyWithoutFirst
		do: [ :each :each2 | asm sbcDest: each source: each2 ]
]

{ #category : 'timer' }
AvrATmega328P >> timer0compa [

	self useRegisterDuring: [ :r |
		asm push: r.
		asm inR: r address: io sreg.
		self useRegisters: #( 24 25 26 27 ) during: [ :rs |
			self pushRegisters: { r } , rs during: [
				self milliSecondsInto: rs.
				asm eorDest: r source: r.
				self addRegisters: rs byte: 1 usingZeroRegister: r.
				self stAddress: counter registers: rs ] ].
		asm out: io sreg r: r.
		asm pop: r ]
]

{ #category : 'gpio' }
AvrATmega328P >> togglePin: anInteger [

	| pair pin bit |
	pair := digitalPins at: anInteger + 1.
	pin := pair first.
	bit := pair second.
	asm sbi: pin bit: bit
]

{ #category : 'private' }
AvrATmega328P >> ubrrForBaud: anInteger [

	^ (self fosc / 16 / anInteger) rounded - 1
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
AvrATmega328P >> useLatterHalfRegisterDuring: aBlock [

	| register |
	register := registerPool
		            detect: [ :each | each >= 16 ]
		            ifNone: [ self error ].
	registerPool remove: register.
	aBlock value: register.
	self returnRegisters: { register }
]

{ #category : 'misc' }
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

{ #category : 'constants' }
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
