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
AvrATmega328P >> add32register: anInteger byte: anInteger2 [

	| r0 |
	r0 := self useRegister: 0.
	asm eorDest: r0 source: r0.
	self add32register: anInteger byte: anInteger2 usingZeroRegister: r0
]

{ #category : 'macros' }
AvrATmega328P >> add32register: anInteger byte: anInteger2 usingZeroRegister: anInteger3 [

	asm adiwR: anInteger data: anInteger2.
	asm adcDest: anInteger + 2 source: anInteger3.
	asm adcDest: anInteger + 3 source: anInteger3
]

{ #category : 'macros' }
AvrATmega328P >> add32register: anInteger register: anInteger2 [

	asm addDest: anInteger source: anInteger2.
	asm adcDest: anInteger + 1 source: anInteger2 + 1.
	asm adcDest: anInteger + 2 source: anInteger2 + 2.
	asm adcDest: anInteger + 3 source: anInteger2 + 3
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

	self subclassResponsibility
]

{ #category : 'macros' }
AvrATmega328P >> cp32dest: anInteger source: anInteger2 [

	asm cpDest: anInteger source: anInteger2.
	asm cpcDest: anInteger + 1 source: anInteger2 + 1.
	asm cpcDest: anInteger + 2 source: anInteger2 + 2.
	asm cpcDest: anInteger + 3 source: anInteger2 + 3
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

{ #category : 'initialization' }
AvrATmega328P >> initialize [

	super initialize.
	self setupDigitalPins
]

{ #category : 'macros' }
AvrATmega328P >> label: aString [

	asm label: aString
]

{ #category : 'macros' }
AvrATmega328P >> ld16register: anInteger word: anInteger2 [

	asm ldiR: anInteger data: (anInteger2 bitAnd: 16rFF).
	asm ldiR: anInteger + 1 data: (anInteger2 >> 8 bitAnd: 16rFF)
]

{ #category : 'macros' }
AvrATmega328P >> ld32register: anInteger address: anInteger2 [

	asm ldsR: anInteger address: anInteger2.
	asm ldsR: anInteger + 1 address: anInteger2 + 1.
	asm ldsR: anInteger + 2 address: anInteger2 + 2.
	asm ldsR: anInteger + 3 address: anInteger2 + 3
]

{ #category : 'macros' }
AvrATmega328P >> ld32register: anInteger dword: anInteger2 [

	asm ldiR: anInteger data: (anInteger2 bitAnd: 16rFF).
	asm ldiR: anInteger + 1 data: (anInteger2 >> 8 bitAnd: 16rFF).
	asm ldiR: anInteger + 2 data: (anInteger2 >> 16 bitAnd: 16rFF).
	asm ldiR: anInteger + 3 data: (anInteger2 >> 24 bitAnd: 16rFF)
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

{ #category : 'macros' }
AvrATmega328P >> pushRegisters: aCollection during: aBlock [

	aCollection do: [ :each | asm push: each ].
	aBlock value.
	aCollection reverseDo: [ :each | asm pop: each ]
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
AvrATmega328P >> st32address: anInteger register: anInteger2 [

	asm stsAddress: anInteger r: anInteger2.
	asm stsAddress: anInteger + 1 r: anInteger2 + 1.
	asm stsAddress: anInteger + 2 r: anInteger2 + 2.
	asm stsAddress: anInteger + 3 r: anInteger2 + 3
]

{ #category : 'macros' }
AvrATmega328P >> st32address: anInteger register: anInteger2 usingZeroRegister: anInteger3 [

	asm stsAddress: anInteger r: anInteger2.
	asm stsAddress: anInteger + 1 r: anInteger3.
	asm stsAddress: anInteger + 2 r: anInteger3.
	asm stsAddress: anInteger + 3 r: anInteger3
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

{ #category : 'macros' }
AvrATmega328P >> wait8 [
	"wait for approximately 40us"

	| r label |
	r := self useRegister: 0.
	label := self nextLabel.
	asm eorDest: r source: r.
	asm label: label.
	asm inc: r.
	asm brne: label
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
