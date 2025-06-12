Class {
	#name : 'AvrArduinoNanoMinimal',
	#superclass : 'AvrATmega328P',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoMinimal >> all [

	self
		setupVectors;
		label: #boot;
		boot.
	asm rjmp: #setup.
	self
		label: #softReset;
		softReset;
		label: #setup;
		setup;
		label: #loop;
		loop.
	asm rjmp: #loop
]

{ #category : 'programs' }
AvrArduinoNanoMinimal >> boot [

	asm eorDest: 1 source: 1.
	asm out: self sreg r: 1.
	asm ldiR: self yl data: self ramEndLow.
	asm ldiR: self yh data: self ramEndHigh.
	asm out: self sph r: self yh.
	asm out: self spl r: self yl
]

{ #category : 'programs' }
AvrArduinoNanoMinimal >> loop [

	self digitalWrite: 7 boolean: true.
	"self digitalWrite: 11 boolean: true."
	self wait8.
	self digitalWrite: 7 boolean: false.
	"self digitalWrite: 11 boolean: false."
	self wait8
]

{ #category : 'programs' }
AvrArduinoNanoMinimal >> setup [

	self digitalPin: 7 mode: 1.
	self digitalPin: 11 mode: 1
]

{ #category : 'programs' }
AvrArduinoNanoMinimal >> setupVectors [

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
	asm jmp: #softReset.
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
