Class {
	#name : 'AvrArduinoNanoAnalog',
	#superclass : 'AvrATmega328P',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoAnalog >> all [

	self setupVectors.
	asm label: #boot.
	self
		boot;
		clearCounter;
		setupTimer0;
		setupSerial0Baud: 9600;
		setupAnalog.
	asm sei.
	asm rjmp: #setup.
	self intHandler: [  ] named: #noInterrupt.
	self intHandler: [ self timer0compa ] named: #timer0compa.
	asm label: #setup.
	self setup.
	self forever: [ self loop ].
	self setupSubroutines
]

{ #category : 'programs' }
AvrArduinoNanoAnalog >> loop [

	self useRegister: 16 during: [ :r16 |
		self use: 2 latterHalfRegistersDuring: [ :rs2 |
			self analogRead: 7 into: rs2.
			asm movDest: r16 source: rs2 second.
			self callSubroutine: #serialPrintHexR16.
			asm movDest: r16 source: rs2 first.
			self callSubroutine: #serialPrintHexR16.
			self callSubroutine: #serialPrintLf ] ].
	self togglePin: 13.
	self use: 4 latterHalfRegistersDuring: [ :rs2 |
		self ldRegisters: rs2 immediate: 1000.
		self delay: rs2 ]
]

{ #category : 'programs' }
AvrArduinoNanoAnalog >> setup [

	self digitalPin: 13 mode: 1
]

{ #category : 'programs' }
AvrArduinoNanoAnalog >> setupSubroutines [

	self
		subroutine: [
			self useRegister: 16 during: [ :r16 |
				asm swap: r16.
				self callSubroutine: #serialPrintNibbleHexR16.
				asm swap: r16.
				self callSubroutine: #serialPrintNibbleHexR16 ] ]
		named: #serialPrintHexR16.
	self
		subroutine: [
			self useRegister: 16 during: [ :r16 |
				self pushRegisters: { r16 } during: [
					self nibble2HexDigitRegister: r16.
					self callSubroutine: #serialSendR16 ] ] ]
		named: #serialPrintNibbleHexR16.
	self
		subroutine: [
			self useRegister: 16 during: [ :r16 |
				self pushRegisters: { r16 } during: [
					asm ldiR: r16 data: 10.
					self callSubroutine: #serialSendR16 ] ] ]
		named: #serialPrintLf.
	self
		subroutine: [
			self
				useRegister: 16
				during: [ :r16 | self serial0SendRegister: r16 ] ]
		named: #serialSendR16
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
