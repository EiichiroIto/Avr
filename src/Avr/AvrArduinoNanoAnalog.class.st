Class {
	#name : 'AvrArduinoNanoAnalog',
	#superclass : 'AvrATmega328P',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoAnalog >> all [

	ram setSize: const ramSize.
	self setupRegisterPool.
	self setupVectors.
	asm label: #boot.
	self
		boot;
		setupCounter;
		clearCounter;
		setupTimer0;
		setupSerial0Baud: 9600;
		setupAnalog.
	asm sei.
	asm rjmp: #setup.
	self intHandlerNamed: #noInterrupt.
	self intHandlerNamed: #timer0compa.
	asm label: #setup.
	self setup.
	self forever: [ self loop ].
	self setupSubroutines
]

{ #category : 'programs' }
AvrArduinoNanoAnalog >> loop [

	self useRegister: 16 in: [ :r16 |
		self use: 2 latterHalfRegistersIn: [ :rs2 |
			self analogRead: 7 into: rs2.
			asm movDest: r16 source: rs2 second.
			asm callSubroutine: #serialPrintHexR16.
			asm movDest: r16 source: rs2 first.
			asm callSubroutine: #serialPrintHexR16.
			asm callSubroutine: #serialPrintLf ] ].
	self togglePin: 13.
	self use: 4 latterHalfRegistersIn: [ :rs2 |
		self loadRegisters: rs2 immediate: 1000.
		self delay: rs2 ]
]

{ #category : 'as yet unclassified' }
AvrArduinoNanoAnalog >> serialPrintHexR16 [

	self useInputs: #( 16 ) outputs: nil in: [ :r16 |
		asm swap: r16.
		asm callSubroutine: #serialPrintNibbleHexR16.
		asm swap: r16.
		asm callSubroutine: #serialPrintNibbleHexR16 ]
]

{ #category : 'as yet unclassified' }
AvrArduinoNanoAnalog >> serialPrintLf [

	self pushAndUseRegisters: #( 16 ) during: [ :r16 |
		asm ldiR: r16 data: 13.
		asm callSubroutine: #serialSendR16.
		asm ldiR: r16 data: 10.
		asm callSubroutine: #serialSendR16 ]
]

{ #category : 'as yet unclassified' }
AvrArduinoNanoAnalog >> serialPrintNibbleHexR16 [

	self useInputs: #( 16 ) outputs: nil in: [ :r16 |
		self pushRegisters: #( 16 ) during: [
			self nibble2HexDigitRegister: r16.
			asm callSubroutine: #serialSendR16 ] ]
]

{ #category : 'as yet unclassified' }
AvrArduinoNanoAnalog >> serialSendR16 [

	self
		useInputs: #( 16 )
		outputs: nil
		in: [ :r16 | self serial0SendRegister: r16 ]
]

{ #category : 'programs' }
AvrArduinoNanoAnalog >> setup [

	self digitalPin: 13 mode: 1.
	self use: 4 latterHalfRegistersIn: [ :rs2 |
		self loadRegisters: rs2 immediate: 1000.
		self delay: rs2 ].
	0 to: 15 do: [ :each |
		self useRegister: 16 in: [ :r |
			asm ldiR: r data: each.
			asm callSubroutine: #serialPrintHexR16 ] ].
	asm callSubroutine: #serialPrintLf
]

{ #category : 'as yet unclassified' }
AvrArduinoNanoAnalog >> setupSubroutines [

	self subroutineNamed: #serialPrintHexR16.
	self subroutineNamed: #serialPrintNibbleHexR16.
	self subroutineNamed: #serialPrintLf.
	self subroutineNamed: #serialSendR16
]

{ #category : 'programs' }
AvrArduinoNanoAnalog >> setupVectors [

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
