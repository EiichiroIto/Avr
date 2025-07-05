Class {
	#name : 'AvrATmega328P',
	#superclass : 'AvrArduino',
	#instVars : [
		'digitalPins',
		'counter',
		'const'
	],
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'macros' }
AvrATmega328P >> addDests: aCollection sources: aCollection2 [

	asm addDest: aCollection first source: aCollection2 first.
	aCollection copyWithoutFirst
		with: aCollection2 copyWithoutFirst
		do: [ :each :each2 | asm adcDest: each source: each2 ]
]

{ #category : 'macros' }
AvrATmega328P >> addRegisters: aCollection byte: anInteger [

	self useLatterHalfRegisterIn: [ :r |
		self pushRegisters: { r } during: [
			asm ldiR: r data: anInteger.
			asm addDest: aCollection first source: r.
			asm eorDest: r source: r.
			(aCollection copyFrom: 2 to: aCollection size) do: [ :each |
				asm adcDest: each source: r ] ] ]
]

{ #category : 'gpio' }
AvrATmega328P >> analogRead: anInteger into: aCollection [

	| label r1 r2 |
	r1 := aCollection first.
	r2 := aCollection second.
	self
		useRegisters: {
				const zl.
				const zh }
		in: [ :zl :zh |
			asm ldsR: r1 address: ram admux.
			asm oriR: r1 data: anInteger.
			asm stsAddress: ram admux r: r1.
			asm ldiR: zl data: ram adcsra.
			asm ldiR: zh data: 0.
			asm ldz: r1.
			asm oriR: r1 data: const adcStartConversion.
			asm stz: r1.
			label := self nextLabel.
			asm label: label.
			asm ldz: r1.
			asm sbrc: r1 bit: 6.
			asm rjmp: label.
			asm ldsR: r1 address: ram adcl.
			asm ldsR: r2 address: ram adch ]
]

{ #category : 'private' }
AvrATmega328P >> availableLatterHalfRegisters: anInteger [

	^ (asm availableRegisters select: [ :each | each >= 16 ])
		  copyFrom: 1
		  to: anInteger
]

{ #category : 'programs' }
AvrATmega328P >> boot [

	self outPort: io sreg immediate: 0.
	self outPort: io spl immediate: (ram ramEnd value bitAnd: 16rFF).
	self outPort: io sph immediate: (ram ramEnd value >> 8)
]

{ #category : 'macros' }
AvrATmega328P >> chunk: aBlock named: aString [

	asm label: aString.
	aBlock value
]

{ #category : 'timer' }
AvrATmega328P >> clearCounter [

	self useRegisterIn: [ :r |
		asm eorDest: r source: r.
		0 to: 3 do: [ :each |
		asm stsAddress: counter + each r: r ] ]
]

{ #category : 'macros' }
AvrATmega328P >> compareDests: aCollection sources: aCollection2 [

	asm cpDest: aCollection first source: aCollection2 first.
	aCollection copyWithoutFirst
		with: aCollection2 copyWithoutFirst
		do: [ :each :each2 | asm cpcDest: each source: each2 ]
]

{ #category : 'accessing' }
AvrATmega328P >> const [

	^ const
]

{ #category : 'accessing' }
AvrATmega328P >> const: anObject [

	const := anObject
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
	self use: 4 registersIn: [ :rs2 |
		self pushRegisters: aCollection , rs2 during: [
			self milliSecondsGet: rs2.
			self addDests: aCollection sources: rs2.
			label1 := self nextLabel.
			asm label: label1.
			self milliSecondsGet: rs2.
			self cpDests: rs2 sources: aCollection.
			asm brcs: label1 ] ]
]

{ #category : 'misc' }
AvrATmega328P >> delayMicroseconds: aCollection [

	| r1 r2 label1 label2 |
	aCollection size = 2 ifFalse: [ self error ].
	label1 := self nextLabel.
	label2 := self nextLabel.
	r1 := aCollection first.
	r2 := aCollection second.
	self useRegisterIn: [ :r |
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
	asm brcs: label
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
AvrATmega328P >> for: anInteger from: anInteger2 to: anInteger3 do: aBlock [

	| label |
	label := self nextLabel.
	asm ldiR: anInteger data: anInteger2.
	asm label: label.
	self pushRegisters: { anInteger } during: [ aBlock cull: anInteger ].
	asm cpiR: anInteger data: anInteger3.
	self ifLessThan: [
		asm inc: anInteger.
		asm rjmp: label ]
]

{ #category : 'macros' }
AvrATmega328P >> forever: aBlock [

	| label |
	label := self nextLabel.
	asm label: label.
	aBlock value.
	asm rjmp: label
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
AvrATmega328P >> ifGreaterEqual: aBlock [

	| label1 |
	label1 := self nextLabel.
	asm brcs: label1.
	aBlock value.
	asm label: label1
]

{ #category : 'macros' }
AvrATmega328P >> ifLessThan: aBlock [

	| label1 |
	label1 := self nextLabel.
	asm brcc: label1.
	aBlock value.
	asm label: label1
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
	self setupDigitalPins.
	const := self newConstants
]

{ #category : 'private' }
AvrATmega328P >> latterHalfRegisters: anInteger excepts: aCollection [

	| list |
	list := (16 to: 31) \ (aCollection ifNil: [ #(  ) ]).
	^ list copyFrom: 1 to: anInteger
]

{ #category : 'macros' }
AvrATmega328P >> loadRegisters: aCollection address: anInteger [

	aCollection doWithIndex: [ :each :index |
		asm ldsR: each address: anInteger + index - 1 ]
]

{ #category : 'macros' }
AvrATmega328P >> loadRegisters: aCollection immediate: anInteger2 [

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
AvrATmega328P >> milliSecondsGet: aCollection [

	self loadRegisters: aCollection address: counter
]

{ #category : 'timer' }
AvrATmega328P >> milliSecondsPut: aCollection [

	self storeAddress: counter registers: aCollection
]

{ #category : 'macros' }
AvrATmega328P >> movDests: aCollection sources: aCollection2 [

	aCollection
		with: aCollection2
		do: [ :each :each2 | asm movDest: each source: each2 ]
]

{ #category : 'instance creation' }
AvrATmega328P >> newConstants [

	^ AvrATmegaConstants new
]

{ #category : 'instance creation' }
AvrATmega328P >> newIO [

	^ AvrArduinoNanoIOMap new
]

{ #category : 'instance creation' }
AvrATmega328P >> newRam [

	^ AvrArduinoNanoMemoryMap new
]

{ #category : 'misc' }
AvrATmega328P >> nibble2HexDigitRegister: anInteger [

	| label rs |
	label := self nextLabel.
	rs := self latterHalfRegisters: 1 excepts: { anInteger }.
	self pushAndUseRegisters: rs during: [ :r |
		asm ldiR: r data: 16r0F.
		asm andDest: anInteger source: r.
		asm ldiR: r data: 48.
		asm addDest: anInteger source: r.
		asm ldiR: r data: 58.
		asm cpDest: anInteger source: r.
		asm brcs: label.
		asm ldiR: r data: 7.
		asm addDest: anInteger source: r.
		asm label: label ]
]

{ #category : 'programs' }
AvrATmega328P >> noInterrupt [

	"do nothing"
]

{ #category : 'macros' }
AvrATmega328P >> outPort: anInteger immediate: anInteger2 [

	self useLatterHalfRegisterIn: [ :r |
		asm ldiR: r data: anInteger2.
		asm out: anInteger r: r ]
]

{ #category : 'macros' }
AvrATmega328P >> pushAndUseRegisters: aCollection during: aBlock [

	self pushRegisters: aCollection during: [
		asm getRegisters: aCollection.
		aBlock numArgs = 0
			ifTrue: [ aBlock value ]
			ifFalse: [ aBlock valueWithArguments: aCollection ].
		asm releaseRegisters: aCollection ]
]

{ #category : 'macros' }
AvrATmega328P >> pushRegisters: aCollection during: aBlock [

	| reuseRegisters tmp |
	aCollection size = aCollection asSet size ifFalse: [
		self error: 'registers duplicated' ].
	reuseRegisters := aCollection \ asm availableRegisters.
	aCollection do: [ :each | asm push: each ].
	tmp := asm availableRegisters copy.
	asm releaseRegisters: reuseRegisters.
	aBlock value.
	asm getRegisters: reuseRegisters.
	((asm availableRegisters includesAll: tmp) and: [
		 tmp includesAll: asm availableRegisters ]) ifFalse: [ self error ].
	aCollection reverseDo: [ :each | asm pop: each ]
]

{ #category : 'serial' }
AvrATmega328P >> serial0DataAvailable [

	| rs |
	rs := self latterHalfRegisters: 1 excepts: #(  ).
	self pushAndUseRegisters: rs during: [ :r |
		asm ldsR: r address: ram ucsr0a.
		asm andiR: r data: const serialReceiveComplete ]
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

	| label rs |
	label := self nextLabel.
	rs := self latterHalfRegisters: 1 excepts: { anInteger }.
	self pushAndUseRegisters: rs during: [ :r |
		asm label: label.
		asm ldsR: r address: ram ucsr0a.
		asm andiR: r data: const serialDataRegisterEmpty.
		asm breq: label.
		asm stsAddress: ram udr0 r: anInteger ]
]

{ #category : 'programs' }
AvrATmega328P >> setup [

	self subclassResponsibility
]

{ #category : 'gpio' }
AvrATmega328P >> setupAnalog [

	self useLatterHalfRegisterIn: [ :r |
		asm ldiR: r data: const admuxDefault.
		asm stsAddress: ram admux r: r.
		asm ldiR: r data: const adcsraDefault.
		asm stsAddress: ram adcsra r: r ]
]

{ #category : 'timer' }
AvrATmega328P >> setupCounter [

	counter := ram label: #counter address: const defaultCounterAddress
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
AvrATmega328P >> setupRegisterPool [

	asm availableRegisters: (0 to: 31) asOrderedCollection
]

{ #category : 'serial' }
AvrATmega328P >> setupSerial0Baud: anInteger [

	| ubrr |
	self useLatterHalfRegisterIn: [ :r |
		ubrr := self ubrrForBaud: anInteger.
		asm ldiR: r data: (ubrr bitAnd: 16rFF).
		asm stsAddress: ram ubrr0l r: r.
		asm ldiR: r data: (ubrr >> 8 bitAnd: 16rFF).
		asm stsAddress: ram ubrr0h r: r.
		asm ldiR: r data: const serialTxRxEnable.
		asm stsAddress: ram ucsr0b r: r.
		asm ldiR: r data: const serialData8.
		asm stsAddress: ram ucsr0c r: r ]
]

{ #category : 'timer' }
AvrATmega328P >> setupTimer0 [

	self useLatterHalfRegisterIn: [ :r |
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
AvrATmega328P >> storeAddress: anInteger registers: aCollection [

	aCollection doWithIndex: [ :each :index |
		asm stsAddress: anInteger + index - 1 r: each ]
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

	| rs |
	rs := #( 16 17 18 19 ).
	self pushRegisters: rs , #( 2 20 ) during: [
		self useRegister: 2 in: [ :r |
			asm inR: r address: io sreg.
			self useRegisters: rs in: [ :a :b :c :d |
				self milliSecondsGet: rs.
				self addRegisters: rs byte: 1.
				self milliSecondsPut: rs ].
			asm out: io sreg r: r ] ]
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

	^ (const fosc / 16 / anInteger) rounded - 1
]

{ #category : 'private' }
AvrATmega328P >> use: anInteger latterHalfRegistersIn: aBlock [

	| registers |
	registers := self availableLatterHalfRegisters: anInteger.
	asm getRegisters: registers.
	aBlock value: registers.
	asm releaseRegisters: registers
]

{ #category : 'private' }
AvrATmega328P >> useLatterHalfRegisterIn: aBlock [

	| registers |
	registers := self availableLatterHalfRegisters: 1.
	asm getRegisters: registers.
	aBlock cull: registers first.
	asm releaseRegisters: registers
]

{ #category : 'misc' }
AvrATmega328P >> wait8 [
	"wait for approximately 40us"

	| label |
	self useRegisterIn: [ :r |
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
