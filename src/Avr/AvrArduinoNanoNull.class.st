Class {
	#name : 'AvrArduinoNanoNull',
	#superclass : 'AvrATmega328P',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoNull >> all [

	self setupVectors.
	asm label: #boot.
	self boot.
	asm call: #main.
	asm jmp: #forever.
	self chunk: [ asm jmp: 0 ] named: #softReset.
	self subroutine: [ self setupTimers ] named: #setupTimers.
	self chunk: [ self timer0Interrupt ] named: #timer0Interrupt.
	self chunk: [ self main ] named: #main.
	self
		chunk: [
			asm cli.
			self forever: [  ] ]
		named: #forever
]

{ #category : 'programs' }
AvrArduinoNanoNull >> boot [

	| label1 label2 |
	asm eorDest: 1 source: 1.
	asm out: 63 r: 1.
	asm ldiR: 28 data: 255.
	asm ldiR: 29 data: 8.
	asm out: 62 r: 29.
	asm out: 61 r: 28.
	asm ldiR: 18 data: 1.
	asm ldiR: 26 data: 0.
	asm ldiR: 27 data: 1.
	label1 := self nextLabel.
	asm rjmp: label1.
	label2 := self nextLabel.
	asm label: label2.
	asm stxInc: 1.
	asm label: label1.
	asm cpiR: 26 data: 11.
	asm cpcDest: 27 source: 18.
	asm brne: label2
]

{ #category : 'programs' }
AvrArduinoNanoNull >> loop [

	asm ldsR: 24 address: 256.
	asm ldsR: 25 address: 257.
	asm adiwR: 24 data: 1.
	asm stsAddress: 257 r: 25.
	asm stsAddress: 256 r: 24
]

{ #category : 'accessing' }
AvrArduinoNanoNull >> main [

	asm call: #setupTimers.
	self setup.
	asm ldiR: 28 data: 0.
	asm ldiR: 29 data: 0.
	self chunk: [ self loop ] named: #loop.
	asm sbiwR: 28 data: 0.
	asm breq: #loop.
	asm call: 0.
	asm rjmp: #loop
]

{ #category : 'programs' }
AvrArduinoNanoNull >> setup [

	asm ldiR: 24 data: 123.
	asm ldiR: 25 data: 0.
	asm stsAddress: 257 r: 25.
	asm stsAddress: 256 r: 24
]

{ #category : 'programs' }
AvrArduinoNanoNull >> setupTimers [

	asm sei.
	asm inR: 24 address: 36.
	asm oriR: 24 data: 2.
	asm out: 36 r: 24.
	asm inR: 24 address: 36.
	asm oriR: 24 data: 1.
	asm out: 36 r: 24.
	asm inR: 24 address: 37.
	asm oriR: 24 data: 2.
	asm out: 37 r: 24.
	asm inR: 24 address: 37.
	asm oriR: 24 data: 1.
	asm out: 37 r: 24.
	asm ldiR: 30 data: 110.
	asm ldiR: 31 data: 0.
	asm ldz: 24.
	asm oriR: 24 data: 1.
	asm stz: 24.
	asm ldiR: 30 data: 129.
	asm ldiR: 31 data: 0.
	asm stz: 1.
	asm ldz: 24.
	asm oriR: 24 data: 2.
	asm stz: 24.
	asm ldz: 24.
	asm oriR: 24 data: 1.
	asm stz: 24.
	asm ldiR: 30 data: 128.
	asm ldiR: 31 data: 0.
	asm ldz: 24.
	asm oriR: 24 data: 1.
	asm stz: 24.
	asm ldiR: 30 data: 177.
	asm ldiR: 31 data: 0.
	asm ldz: 24.
	asm oriR: 24 data: 4.
	asm stz: 24.
	asm ldiR: 30 data: 176.
	asm ldiR: 31 data: 0.
	asm ldz: 24.
	asm oriR: 24 data: 1.
	asm stz: 24.
	asm ldiR: 30 data: 122.
	asm ldiR: 31 data: 0.
	asm ldz: 24.
	asm oriR: 24 data: 4.
	asm stz: 24.
	asm ldz: 24.
	asm oriR: 24 data: 2.
	asm stz: 24.
	asm ldz: 24.
	asm oriR: 24 data: 1.
	asm stz: 24.
	asm ldz: 24.
	asm oriR: 24 data: 128.
	asm stz: 24.
	asm stsAddress: 193 r: 1
]

{ #category : 'programs' }
AvrArduinoNanoNull >> setupVectors [

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
	asm jmp: #timer0Interrupt.
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

{ #category : 'programs' }
AvrArduinoNanoNull >> timer0Interrupt [

	| label1 label2 |
	label1 := self nextLabel.
	label2 := self nextLabel.
	asm push: 1.
	asm push: 0.
	asm inR: 0 address: 63.
	asm push: 0.
	asm eorDest: 1 source: 1.
	asm push: 18.
	asm push: 19.
	asm push: 24.
	asm push: 25.
	asm push: 26.
	asm push: 27.
	asm ldsR: 24 address: 263.
	asm ldsR: 25 address: 264.
	asm ldsR: 26 address: 265.
	asm ldsR: 27 address: 266.
	asm ldsR: 19 address: 262.
	asm ldiR: 18 data: 3.
	asm addDest: 18 source: 19.
	asm cpiR: 18 data: 125.
	asm brcs: label1.
	asm ldiR: 18 data: 134.
	asm addDest: 18 source: 19.
	asm adiwR: 24 data: 2.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm label: label2.
	asm stsAddress: 262 r: 18.
	asm stsAddress: 263 r: 24.
	asm stsAddress: 264 r: 25.
	asm stsAddress: 265 r: 26.
	asm stsAddress: 266 r: 27.
	asm ldsR: 24 address: 258.
	asm ldsR: 25 address: 259.
	asm ldsR: 26 address: 260.
	asm ldsR: 27 address: 261.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm stsAddress: 258 r: 24.
	asm stsAddress: 259 r: 25.
	asm stsAddress: 260 r: 26.
	asm stsAddress: 261 r: 27.
	asm pop: 27.
	asm pop: 26.
	asm pop: 25.
	asm pop: 24.
	asm pop: 19.
	asm pop: 18.
	asm pop: 0.
	asm out: 63 r: 0.
	asm pop: 0.
	asm pop: 1.
	asm reti.
	asm label: label1.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm rjmp: label2
]
