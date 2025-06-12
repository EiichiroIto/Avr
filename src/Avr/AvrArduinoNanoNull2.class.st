Class {
	#name : 'AvrArduinoNanoNull2',
	#superclass : 'AvrATmega328P',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoNull2 >> all [

	self setupVectors.
	asm label: #boot.
	self boot.
	asm call: #main.
	asm jmp: #forever.
	self chunk: [ asm jmp: 0 ] named: #softReset.
	self subroutine: [ self setupTimers ] named: #setupTimers.
	self chunk: [ self timer0Interrupt ] named: #timer0Interrupt.
	self chunk: [ self main ] named: #main.
	self
		chunk: [
			asm cli.
			self forever: [  ] ]
		named: #forever
]

{ #category : 'programs' }
AvrArduinoNanoNull2 >> boot [

	| label1 label2 r1 |
	r1 := self useRegister: 1.
	asm eorDest: r1 source: r1.
	asm out: self sreg r: r1.
	self ld16register: self yl word: self ramEnd.
	asm out: self sph r: self yh.
	asm out: self spl r: self yl.
	asm ldiR: 18 data: 1.
	self ld16register: self xl word: 16r0100.
	label1 := self nextLabel.
	asm rjmp: label1.
	label2 := self nextLabel.
	asm label: label2.
	asm stxInc: r1.
	asm label: label1.
	asm cpiR: self xl data: 11.
	asm cpcDest: self xh source: 18.
	asm brne: label2
]

{ #category : 'programs' }
AvrArduinoNanoNull2 >> delay: anInteger [

	
]

{ #category : 'programs' }
AvrArduinoNanoNull2 >> loop [

	| label1 r2 |
	r2 := self useRegister: 16.
	self ld32register: 24 address: 263.
	self ld32register: 20 dword: 1000.
	self cp32dest: 24 source: 20.
	label1 := self nextLabel.
	asm brlt: label1.
	asm ldiR: r2 data: 0.
	asm stsAddress: 263 r: r2.
	asm stsAddress: 264 r: r2.
	asm stsAddress: 265 r: r2.
	asm stsAddress: 266 r: r2.
	self togglePin: 13.
	asm label: label1
]

{ #category : 'accessing' }
AvrArduinoNanoNull2 >> main [

	asm call: #setupTimers.
	self setup.
	asm ldiR: 28 data: 0.
	asm ldiR: 29 data: 0.
	self chunk: [ self loop ] named: #loop.
	asm sbiwR: 28 data: 0.
	asm breq: #loop.
	asm call: 0.
	asm rjmp: #loop
]

{ #category : 'programs' }
AvrArduinoNanoNull2 >> setup [

	self digitalPin: 13 mode: 1
]

{ #category : 'programs' }
AvrArduinoNanoNull2 >> setupTimers [

	asm sei.
	asm inR: 24 address: 36.
	asm oriR: 24 data: 2.
	asm out: 36 r: 24.
	asm inR: 24 address: 36.
	asm oriR: 24 data: 1.
	asm out: 36 r: 24.
	asm inR: 24 address: 37.
	asm oriR: 24 data: 2.
	asm out: 37 r: 24.
	asm inR: 24 address: 37.
	asm oriR: 24 data: 1.
	asm out: 37 r: 24.
	asm ldiR: 30 data: 110.
	asm ldiR: 31 data: 0.
	asm ldz: 24.
	asm oriR: 24 data: 1.
	asm stz: 24.
	asm ldiR: 30 data: 129.
	asm ldiR: 31 data: 0.
	asm stz: 1.
	asm ldz: 24.
	asm oriR: 24 data: 2.
	asm stz: 24.
	asm ldz: 24.
	asm oriR: 24 data: 1.
	asm stz: 24.
	asm ldiR: 30 data: 128.
	asm ldiR: 31 data: 0.
	asm ldz: 24.
	asm oriR: 24 data: 1.
	asm stz: 24.
	asm ldiR: 30 data: 177.
	asm ldiR: 31 data: 0.
	asm ldz: 24.
	asm oriR: 24 data: 4.
	asm stz: 24.
	asm ldiR: 30 data: 176.
	asm ldiR: 31 data: 0.
	asm ldz: 24.
	asm oriR: 24 data: 1.
	asm stz: 24.
	asm ldiR: 30 data: 122.
	asm ldiR: 31 data: 0.
	asm ldz: 24.
	asm oriR: 24 data: 4.
	asm stz: 24.
	asm ldz: 24.
	asm oriR: 24 data: 2.
	asm stz: 24.
	asm ldz: 24.
	asm oriR: 24 data: 1.
	asm stz: 24.
	asm ldz: 24.
	asm oriR: 24 data: 128.
	asm stz: 24.
	asm stsAddress: 193 r: 1
]

{ #category : 'programs' }
AvrArduinoNanoNull2 >> setupVectors [

	asm jmp: #boot.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #timer0Interrupt.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset.
	asm jmp: #softReset
]

{ #category : 'programs' }
AvrArduinoNanoNull2 >> timer0Interrupt [

	| label1 label2 |
	label1 := self nextLabel.
	label2 := self nextLabel.
	asm push: 1.
	asm push: 0.
	asm inR: 0 address: 63.
	asm push: 0.
	asm eorDest: 1 source: 1.
	self pushRegisters: #( 18 19 24 25 26 27 ) during: [
		self ld32register: 24 address: 263.
		asm ldsR: 19 address: 262.
		asm ldiR: 18 data: 3.
		asm addDest: 18 source: 19.
		asm cpiR: 18 data: 125.
		asm brcs: label1.
		asm ldiR: 18 data: 134.
		asm addDest: 18 source: 19.
		self add32register: 24 byte: 2 usingZeroRegister: 1.
		asm label: label2.
		asm stsAddress: 262 r: 18.
		self st32address: 263 register: 24.
		self ld32register: 24 address: 258.
		self add32register: 24 byte: 1 usingZeroRegister: 1.
		self st32address: 258 register: 24 ].
	asm pop: 0.
	asm out: 63 r: 0.
	asm pop: 0.
	asm pop: 1.
	asm reti.
	asm label: label1.
	self add32register: 24 byte: 1 usingZeroRegister: 1.
	asm rjmp: label2
]
