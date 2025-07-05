Class {
	#name : 'AvrArduinoNanoBlink',
	#superclass : 'AvrATmega328P',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoBlink >> all [

	ram setSize: const ramSize.
	self setupRegisterPool.
	self setupVectors.
	asm label: #boot.
	self
		boot;
		setupCounter;
		clearCounter;
		setupTimer0.
	asm sei.
	asm rjmp: #setup.
	self intHandlerNamed: #noInterrupt.
	self intHandlerNamed: #timer0compa.
	asm label: #setup.
	self setup.
	self forever: [ self loop ]
]

{ #category : 'programs' }
AvrArduinoNanoBlink >> loop [

	self togglePin: 13.
	self use: 4 latterHalfRegistersIn: [ :rs |
		self loadRegisters: rs immediate: 1000.
		self delay: rs ]
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
