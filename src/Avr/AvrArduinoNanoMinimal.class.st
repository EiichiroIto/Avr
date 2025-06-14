Class {
	#name : 'AvrArduinoNanoMinimal',
	#superclass : 'AvrATmega328P',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoMinimal >> all [

	self setupVectors.
	asm label: #boot.
	self boot.
	asm rjmp: #setup.
	asm label: #softReset.
	self softReset.
	asm label: #setup.
	self setup.
	asm label: #loop.
	self loop.
	asm rjmp: #loop
]

{ #category : 'programs' }
AvrArduinoNanoMinimal >> boot [

	asm eorDest: 1 source: 1.
	asm out: io sreg r: 1.
	asm ldiR: self yl data: ram ramEndLow.
	asm ldiR: self yh data: ram ramEndHigh.
	asm out: io sph r: self yh.
	asm out: io spl r: self yl
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
