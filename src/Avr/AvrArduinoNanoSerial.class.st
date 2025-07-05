Class {
	#name : 'AvrArduinoNanoSerial',
	#superclass : 'AvrATmega328P',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoSerial >> all [

	ram setSize: const ramSize.
	self setupRegisterPool.
	self setupVectors.
	asm label: #boot.
	self
		boot;
		setupSerial0Baud: 9600.
	asm sei.
	asm rjmp: #setup.
	self intHandlerNamed: #noInterrupt.
	asm label: #setup.
	self setup.
	self forever: [ self loop ]
]

{ #category : 'programs' }
AvrArduinoNanoSerial >> loop [

	| label1 label2 |
	self useLatterHalfRegisterIn: [ :r |
		label2 := self nextLabel.
		asm label: label2.
		self serial0DataAvailable.
		label1 := self nextLabel.
		asm breq: label1.
		self serial0PeekDataInto: r.
		self serial0SendRegister: r.
		self togglePin: 13.
		self wait8.
		asm rjmp: label2.
		asm label: label1 ]
]

{ #category : 'programs' }
AvrArduinoNanoSerial >> setup [

	self digitalPin: 13 mode: 1
]

{ #category : 'programs' }
AvrArduinoNanoSerial >> setupVectors [

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
	asm jmp: #noInterrupt
]
