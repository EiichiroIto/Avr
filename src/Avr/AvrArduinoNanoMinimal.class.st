Class {
	#name : 'AvrArduinoNanoMinimal',
	#superclass : 'AvrATmega328P',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoMinimal >> all [

	ram setSize: const ramSize.
	self setupRegisterPool.
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
AvrArduinoNanoMinimal >> loop [

	| rs |
	rs := #( 24 25 ).
	self useRegisters: rs in: [ :r24 :r25 |
		self togglePin: 7.
		self loadRegisters: rs immediate: 1000.
		self delayMicroseconds: rs ]
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
