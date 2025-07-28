Class {
	#name : 'AvrArduinoNanoAnalog',
	#superclass : 'AvrATmega328P',
	#instVars : [
		'timer0Counter'
	],
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoAnalog >> all [

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
		clearCounterAddress: timer0Counter;
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

{ #category : 'defaults' }
AvrArduinoNanoAnalog >> defaultCounterAddress [

	^ 16r0100
]

{ #category : 'programs' }
AvrArduinoNanoAnalog >> loop [

	asm useRegister: 16 in: [ :r16 |
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
		self delay: rs2 address: timer0Counter ]
]

{ #category : 'serials' }
AvrArduinoNanoAnalog >> serialPrintHexR16 [

	asm useInputs: #( 16 ) outputs: nil in: [ :r16 |
		asm pushAndUseRegisters: { 16 } during: [
			asm swap: r16.
			asm callSubroutine: #serialPrintNibbleHexR16.
			asm swap: r16.
			asm callSubroutine: #serialPrintNibbleHexR16 ] ]
]

{ #category : 'serials' }
AvrArduinoNanoAnalog >> serialPrintLf [

	asm pushAndUseRegisters: #( 16 ) during: [ :r16 |
		asm ldiR: r16 data: 13.
		asm callSubroutine: #serialSendR16.
		asm ldiR: r16 data: 10.
		asm callSubroutine: #serialSendR16 ]
]

{ #category : 'serials' }
AvrArduinoNanoAnalog >> serialPrintNibbleHexR16 [

	asm useInputs: #( 16 ) outputs: nil in: [ :r16 |
		asm pushRegisters: #( 16 ) during: [
			self nibble2HexDigitRegister: r16.
			asm callSubroutine: #serialSendR16 ] ]
]

{ #category : 'serials' }
AvrArduinoNanoAnalog >> serialSendR16 [

	asm
		useInputs: #( 16 )
		outputs: nil
		in: [ :r16 | self serial0SendRegister: r16 ]
]

{ #category : 'programs' }
AvrArduinoNanoAnalog >> setup [

	self digitalPin: 13 mode: 1.
	self use: 4 latterHalfRegistersIn: [ :rs2 |
		self loadRegisters: rs2 immediate: 1000.
		self delay: rs2 address: timer0Counter ].
	0 to: 15 do: [ :each |
		asm useRegister: 16 in: [ :r |
			asm ldiR: r data: each.
			asm callSubroutine: #serialPrintHexR16 ] ].
	asm callSubroutine: #serialPrintLf
]

{ #category : 'serials' }
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

{ #category : 'timer' }
AvrArduinoNanoAnalog >> timer0compa [

	self timerAddress: timer0Counter registers: #( 16 17 18 19 )
]
