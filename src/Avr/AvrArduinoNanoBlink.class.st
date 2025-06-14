Class {
	#name : 'AvrArduinoNanoBlink',
	#superclass : 'AvrATmega328P',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoBlink >> all [

	self setupVectors.
	asm label: #boot.
	self
		boot;
		clearCounter;
		setupTimer0.
	asm sei.
	asm rjmp: #setup.
	self intHandler: [  ] named: #noInterrupt.
	self intHandler: [ self timer0compa ] named: #timer0compa.
	asm label: #setup.
	self setup.
	self forever: [ self loop ]
]

{ #category : 'programs' }
AvrArduinoNanoBlink >> loop [

	self togglePin: 13.
	self delay: 1000
]

{ #category : 'programs' }
AvrArduinoNanoBlink >> setup [

	self digitalPin: 13 mode: 1
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
