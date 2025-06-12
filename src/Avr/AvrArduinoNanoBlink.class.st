Class {
	#name : 'AvrArduinoNanoBlink',
	#superclass : 'AvrATmega328P',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoBlink >> all [

	self
		setupVectors;
		label: #boot;
		boot;
		setupTimer0.
	asm sei.
	asm rjmp: #setup.
	self intHandler: [  ] named: #noInterrupt.
	self intHandler: [ self timer0compa ] named: #timer0compa.
	self
		label: #setup;
		setup.
	self forever: [ self loop ]
]

{ #category : 'programs' }
AvrArduinoNanoBlink >> boot [

	| r |
	r := self useRegister: 1.
	asm eorDest: r source: r.
	asm out: self sreg r: r.
	asm ldiR: self yl data: self ramEndLow.
	asm ldiR: self yh data: self ramEndHigh.
	asm out: self sph r: self yh.
	asm out: self spl r: self yl
]

{ #category : 'constants' }
AvrArduinoNanoBlink >> counterAddress [

	^ 16r0100
]

{ #category : 'macros' }
AvrArduinoNanoBlink >> delay: anInteger [

	| r16 r4 label1 |
	r16 := self useRegister32: 16.
	r4 := self useRegister32: 4.
	self
		pushRegisters: {
				r16.
				(r16 + 1).
				(r16 + 2).
				(r16 + 3).
				r4.
				(r4 + 1).
				(r4 + 2).
				(r4 + 3) }
		during: [
			self ld32register: r16 dword: anInteger.
			self ld32register: r4 address: self counterAddress.
			self add32register: r16 register: r4.
			label1 := self nextLabel.
			asm label: label1.
			self ld32register: r4 address: self counterAddress.
			self cp32dest: r4 source: r16.
			asm brlt: label1 ]
]

{ #category : 'programs' }
AvrArduinoNanoBlink >> loop [

	self togglePin: 13.
	self delay: 1000
]

{ #category : 'programs' }
AvrArduinoNanoBlink >> setup [

	| r0 |
	r0 := self useRegister: 0.
	self digitalPin: 13 mode: 1.
	asm eorDest: r0 source: r0.
	self st32address: self counterAddress register: r0 usingZeroRegister: r0
]

{ #category : 'macros' }
AvrArduinoNanoBlink >> setupTimer0 [

	| r |
	r := self useRegister: 16.
	asm ldiR: r data: 2r00000010.
	asm out: self tccr0a r: r.
	asm ldiR: r data: 2r00000011.
	asm out: self tccr0b r: r.
	asm ldiR: r data: 249.
	asm out: self ocr0a r: r.
	asm ldiR: r data: 2r00000010.
	asm stsAddress: self timsk0 r: r
]

{ #category : 'programs' }
AvrArduinoNanoBlink >> setupVectors [

	asm jmp: #boot.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #timer0compa.
	asm jmp: #timer0compa.
	asm jmp: #timer0compa.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt.
	asm jmp: #noInterrupt
]

{ #category : 'programs' }
AvrArduinoNanoBlink >> timer0compa [

	| r0 r24 r25 r26 r27 |
	r0 := self useRegister: 0.
	r24 := self useRegister: 24.
	r25 := self useRegister: 25.
	r26 := self useRegister: 26.
	r27 := self useRegister: 27.
	asm push: r0.
	asm inR: r0 address: self sreg.
	self
		pushRegisters: {
				r0.
				r24.
				r25.
				r26.
				r27 }
		during: [
			self ld32register: r24 address: self counterAddress.
			asm eorDest: r0 source: r0.
			self add32register: r24 byte: 1 usingZeroRegister: r0.
			self st32address: self counterAddress register: r24 ].
	asm out: self sreg r: r0.
	asm pop: r0
]
