Class {
	#name : 'AvrArduinoNanoBlink',
	#superclass : 'AvrATmega328P',
	#instVars : [
		'timer0Counter'
	],
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoBlink >> all [

	ram setSize: const ramSize.
	timer0Counter := ram
		                 label: #counter
		                 address: self defaultCounterAddress.
	asm setupRegisterFrames.
	self setupVectors.
	asm label: #boot.
	self
		boot;
		setupTimer0;
		clearCounterAddress: timer0Counter.
	asm sei.
	asm rjmp: #setup.
	self intHandlerNamed: #noInterrupt.
	self intHandlerNamed: #timer0compa.
	asm label: #setup.
	self setup.
	self forever: [ self loop ]
]

{ #category : 'defaults' }
AvrArduinoNanoBlink >> defaultCounterAddress [

	^ 16r0100
]

{ #category : 'programs' }
AvrArduinoNanoBlink >> loop [

	self togglePin: 13.
	self use: 4 latterHalfRegistersIn: [ :rs |
		self loadRegisters: rs immediate: 1000.
		self delay: rs address: timer0Counter ]
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

{ #category : 'timer' }
AvrArduinoNanoBlink >> timer0compa [

	self timerAddress: timer0Counter registers: #( 16 17 18 19 )
]
