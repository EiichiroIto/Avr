Class {
	#name : 'AvrArduinoNanoSerial',
	#superclass : 'AvrATmega328P',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoSerial >> all [

	self
		setupVectors;
		label: #boot;
		boot;
		clearCounter;
		setupTimer0;
		setupSerial0Baud: 9600.
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
AvrArduinoNanoSerial >> loop [

	| label1 label2 |
	self useLatterHalfRegisterDuring: [ :r |
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
	"self useLatterHalfRegisterDuring: [ :r |
		asm ldiR: r data: $. asInteger.
		self serial0SendRegister: r ].
	self delay: 1000"
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
