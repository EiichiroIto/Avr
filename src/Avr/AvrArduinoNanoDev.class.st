Class {
	#name : 'AvrArduinoNanoDev',
	#superclass : 'AvrArduinoNano',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'programs' }
AvrArduinoNanoDev >> boot [

	asm eorDest: 1 source: 1.
	asm out: 16r3F r: 1.
	asm ldiR: 28 data: 16rFF.
	asm ldiR: 29 data: 16r8.
	asm out: 16r3e r: 29.
	asm out: 16r3d r: 28.
	asm ldiR: 18 data: 1.
	asm ldiR: 26 data: 0.
	asm ldiR: 27 data: 1.
	asm rjmp: 1.
	asm stxInc: 1.
	asm cpiR: 26 data: 9.
	asm cpcDest: 27 source: 18.
	asm brne: -4.
	asm call: 146.
	asm jmp: #endlessLoop
]

{ #category : 'as yet unclassified' }
AvrArduinoNanoDev >> sample1 [

	asm jmp: 52.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 72.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm eorDest: 1 source: 1.
	asm out: 63 r: 1.
	asm ldiR: 28 data: 255.
	asm ldiR: 29 data: 8.
	asm out: 62 r: 29.
	asm out: 61 r: 28.
	asm ldiR: 18 data: 1.
	asm ldiR: 26 data: 0.
	asm ldiR: 27 data: 1.
	asm rjmp: 1.
	asm stxInc: 1.
	asm cpiR: 26 data: 9.
	asm cpcDest: 27 source: 18.
	asm brne: -4.
	asm call: 146.
	asm jmp: 220.
	asm jmp: 0.
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
	asm ldsR: 24 address: 261.
	asm ldsR: 25 address: 262.
	asm ldsR: 26 address: 263.
	asm ldsR: 27 address: 264.
	asm ldsR: 19 address: 260.
	asm ldiR: 18 data: 3.
	asm addDest: 18 source: 19.
	asm cpiR: 18 data: 125.
	asm brcc: 43.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm stsR: 18 data: 260.
	asm stsR: 24 data: 261.
	asm stsR: 25 data: 262.
	asm stsR: 26 data: 263.
	asm stsR: 27 data: 264.
	asm ldsR: 24 address: 256.
	asm ldsR: 25 address: 257.
	asm ldsR: 26 address: 258.
	asm ldsR: 27 address: 259.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm stsR: 24 data: 256.
	asm stsR: 25 data: 257.
	asm stsR: 26 data: 258.
	asm stsR: 27 data: 259.
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
	asm ldiR: 18 data: 134.
	asm addDest: 18 source: 19.
	asm adiwR: 24 data: 2.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm rjmp: -46.
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
	asm ldsR: 24 address: 110.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 110.
	asm stsR: 1 data: 129.
	asm ldsR: 24 address: 129.
	asm oriR: 24 data: 2.
	asm stsR: 24 data: 129.
	asm ldsR: 24 address: 129.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 129.
	asm ldsR: 24 address: 128.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 128.
	asm ldsR: 24 address: 177.
	asm oriR: 24 data: 4.
	asm stsR: 24 data: 177.
	asm ldsR: 24 address: 176.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 176.
	asm ldsR: 24 address: 122.
	asm oriR: 24 data: 4.
	asm stsR: 24 data: 122.
	asm ldsR: 24 address: 122.
	asm oriR: 24 data: 2.
	asm stsR: 24 data: 122.
	asm ldsR: 24 address: 122.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 122.
	asm ldsR: 24 address: 122.
	asm oriR: 24 data: 128.
	asm stsR: 24 data: 122.
	asm stsR: 1 data: 193.
	asm ldiR: 28 data: 0.
	asm ldiR: 29 data: 0.
	asm sbiwR: 28 data: 0.
	asm breq: -2.
	asm call: 0.
	asm rjmp: -5.
	asm cli.
	asm rjmp: -1
]

{ #category : 'as yet unclassified' }
AvrArduinoNanoDev >> sample2 [

	asm jmp: 52.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 159.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm jmp: 70.
	asm eorDest: 1 source: 1.
	asm out: 63 r: 1.
	asm ldiR: 28 data: 255.
	asm ldiR: 29 data: 8.
	asm out: 62 r: 29.
	asm out: 61 r: 28.
	asm ldiR: 18 data: 1.
	asm ldiR: 26 data: 0.
	asm ldiR: 27 data: 1.
	asm rjmp: 1.
	asm stxInc: 1.
	asm cpiR: 26 data: 9.
	asm cpcDest: 27 source: 18.
	asm brne: -4.
	asm call: 233.
	asm jmp: 319.
	asm jmp: 0.
	asm inR: 19 address: 63.
	asm cli.
	asm ldsR: 24 address: 261.
	asm ldsR: 25 address: 262.
	asm ldsR: 26 address: 263.
	asm ldsR: 27 address: 264.
	asm inR: 18 address: 38.
	asm sbisR: 21 data: 0.
	asm rjmp: 5.
	asm cpiR: 18 data: 255.
	asm breq: 3.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm out: 63 r: 19.
	asm movDest: 27 source: 26.
	asm movDest: 26 source: 25.
	asm movDest: 25 source: 24.
	asm eorDest: 24 source: 24.
	asm movwDest: 22 source: 24.
	asm movwDest: 24 source: 26.
	asm addDest: 22 source: 18.
	asm adcDest: 23 source: 1.
	asm adcDest: 24 source: 1.
	asm adcDest: 25 source: 1.
	asm ldiR: 20 data: 2.
	asm addDest: 22 source: 22.
	asm adcDest: 23 source: 23.
	asm adcDest: 24 source: 24.
	asm adcDest: 25 source: 25.
	asm dec: 20.
	asm brne: -6.
	asm ret.
	asm push: 8.
	asm push: 9.
	asm push: 10.
	asm push: 11.
	asm push: 12.
	asm push: 13.
	asm push: 14.
	asm push: 15.
	asm movwDest: 8 source: 22.
	asm movwDest: 10 source: 24.
	asm call: 72.
	asm movwDest: 12 source: 22.
	asm movwDest: 14 source: 24.
	asm call: 72.
	asm subDest: 22 source: 12.
	asm sbcDest: 23 source: 13.
	asm sbcDest: 24 source: 14.
	asm sbcDest: 25 source: 15.
	asm cpiR: 22 data: 232.
	asm sbciR: 23 data: 3.
	asm cpcDest: 24 source: 1.
	asm cpcDest: 25 source: 1.
	asm brcs: -11.
	asm ldiR: 18 data: 1.
	asm subDest: 8 source: 18.
	asm sbcDest: 9 source: 1.
	asm sbcDest: 10 source: 1.
	asm sbcDest: 11 source: 1.
	asm ldiR: 24 data: 232.
	asm addDest: 12 source: 24.
	asm ldiR: 24 data: 3.
	asm adcDest: 13 source: 24.
	asm adcDest: 14 source: 1.
	asm adcDest: 15 source: 1.
	asm cpDest: 8 source: 1.
	asm cpcDest: 9 source: 1.
	asm cpcDest: 10 source: 1.
	asm cpcDest: 11 source: 1.
	asm brne: -27.
	asm pop: 15.
	asm pop: 14.
	asm pop: 13.
	asm pop: 12.
	asm pop: 11.
	asm pop: 10.
	asm pop: 9.
	asm pop: 8.
	asm ret.
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
	asm ldsR: 24 address: 257.
	asm ldsR: 25 address: 258.
	asm ldsR: 26 address: 259.
	asm ldsR: 27 address: 260.
	asm ldsR: 19 address: 256.
	asm ldiR: 18 data: 3.
	asm addDest: 18 source: 19.
	asm cpiR: 18 data: 125.
	asm brcc: 43.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm stsR: 18 data: 256.
	asm stsR: 24 data: 257.
	asm stsR: 25 data: 258.
	asm stsR: 26 data: 259.
	asm stsR: 27 data: 260.
	asm ldsR: 24 address: 261.
	asm ldsR: 25 address: 262.
	asm ldsR: 26 address: 263.
	asm ldsR: 27 address: 264.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm stsR: 24 data: 261.
	asm stsR: 25 data: 262.
	asm stsR: 26 data: 263.
	asm stsR: 27 data: 264.
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
	asm ldiR: 18 data: 134.
	asm addDest: 18 source: 19.
	asm adiwR: 24 data: 2.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm rjmp: -46.
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
	asm ldsR: 24 address: 110.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 110.
	asm stsR: 1 data: 129.
	asm ldsR: 24 address: 129.
	asm oriR: 24 data: 2.
	asm stsR: 24 data: 129.
	asm ldsR: 24 address: 129.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 129.
	asm ldsR: 24 address: 128.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 128.
	asm ldsR: 24 address: 177.
	asm oriR: 24 data: 4.
	asm stsR: 24 data: 177.
	asm ldsR: 24 address: 176.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 176.
	asm ldsR: 24 address: 122.
	asm oriR: 24 data: 4.
	asm stsR: 24 data: 122.
	asm ldsR: 24 address: 122.
	asm oriR: 24 data: 2.
	asm stsR: 24 data: 122.
	asm ldsR: 24 address: 122.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 122.
	asm ldsR: 24 address: 122.
	asm oriR: 24 data: 128.
	asm stsR: 24 data: 122.
	asm stsR: 1 data: 193.
	asm ldiR: 22 data: 123.
	asm ldiR: 23 data: 0.
	asm ldiR: 24 data: 0.
	asm ldiR: 25 data: 0.
	asm call: 109.
	asm ldiR: 28 data: 0.
	asm ldiR: 29 data: 0.
	asm ldiR: 22 data: 210.
	asm ldiR: 23 data: 4.
	asm ldiR: 24 data: 0.
	asm ldiR: 25 data: 0.
	asm call: 109.
	asm sbiwR: 28 data: 0.
	asm breq: -8.
	asm call: 0.
	asm rjmp: -11.
	asm cli.
	asm rjmp: -1
]

{ #category : 'as yet unclassified' }
AvrArduinoNanoDev >> sample3 [

	asm jmp: 92.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 275.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm jmp: 110.
	asm nop.
	asm nop.
	asm word: 36.
	asm word: 39.
	asm word: 42.
	asm nop.
	asm nop.
	asm word: 37.
	asm word: 40.
	asm word: 43.
	asm cpcDest: 0 source: 4.
	asm cpcDest: 0 source: 4.
	asm cpcDest: 0 source: 4.
	asm cpcDest: 0 source: 4.
	asm mulsDest: 16 source: 18.
	asm mulsDest: 16 source: 18.
	asm mulsDest: 16 source: 18.
	asm mulsuDest: 16 source: 19.
	asm mulsuDest: 16 source: 19.
	asm mulsuDest: 16 source: 19.
	asm mulsDest: 16 source: 17.
	asm sbcDest: 0 source: 4.
	asm andDest: 1 source: 0.
	asm ldz: 4.
	asm mulsDest: 16 source: 17.
	asm sbcDest: 0 source: 4.
	asm andDest: 1 source: 0.
	asm mulsDest: 16 source: 17.
	asm sbcDest: 0 source: 4.
	asm andDest: 1 source: 0.
	asm nop.
	asm sbcDest: 0 source: 0.
	asm mulsDest: 16 source: 16.
	asm word: 1.
	asm mulsuDest: 16 source: 16.
	asm cpcDest: 16 source: 20.
	asm nop.
	asm nop.
	asm nop.
	asm nop.
	asm eorDest: 1 source: 1.
	asm out: 63 r: 1.
	asm ldiR: 28 data: 255.
	asm ldiR: 29 data: 8.
	asm out: 62 r: 29.
	asm out: 61 r: 28.
	asm ldiR: 18 data: 1.
	asm ldiR: 26 data: 0.
	asm ldiR: 27 data: 1.
	asm rjmp: 1.
	asm stxInc: 1.
	asm cpiR: 26 data: 9.
	asm cpcDest: 27 source: 18.
	asm brne: -4.
	asm call: 349.
	asm jmp: 460.
	asm jmp: 0.
	asm ldiR: 30 data: 177.
	asm ldiR: 31 data: 0.
	asm lpmz: 18.
	asm ldiR: 30 data: 157.
	asm ldiR: 31 data: 0.
	asm lpmz: 25.
	asm ldiR: 30 data: 137.
	asm ldiR: 31 data: 0.
	asm lpmz: 30.
	asm andDest: 30 source: 30.
	asm breq: 25.
	asm andDest: 18 source: 18.
	asm breq: 7.
	asm cpiR: 18 data: 3.
	asm breq: 32.
	asm brcc: 21.
	asm cpiR: 18 data: 1.
	asm breq: 35.
	asm cpiR: 18 data: 2.
	asm breq: 37.
	asm ldiR: 31 data: 0.
	asm addDest: 30 source: 30.
	asm adcDest: 31 source: 31.
	asm subiR: 30 data: 142.
	asm sbciR: 31 data: 255.
	asm lpmzInc: 26.
	asm lpmz: 27.
	asm inR: 18 address: 63.
	asm cli.
	asm ldx: 30.
	asm cpseDest: 24 source: 1.
	asm rjmp: 38.
	asm com: 25.
	asm andDest: 25 source: 30.
	asm stx: 25.
	asm out: 63 r: 18.
	asm ret.
	asm cpiR: 18 data: 7.
	asm breq: 21.
	asm cpiR: 18 data: 8.
	asm breq: 25.
	asm cpiR: 18 data: 4.
	asm brne: -23.
	asm ldsR: 18 address: 128.
	asm andiR: 18 data: 223.
	asm rjmp: 3.
	asm ldsR: 18 address: 128.
	asm andiR: 18 data: 127.
	asm stsR: 18 data: 128.
	asm rjmp: -33.
	asm inR: 18 address: 36.
	asm andiR: 18 data: 127.
	asm out: 36 r: 18.
	asm rjmp: -37.
	asm inR: 18 address: 36.
	asm andiR: 18 data: 223.
	asm rjmp: -5.
	asm ldsR: 18 address: 176.
	asm andiR: 18 data: 127.
	asm stsR: 18 data: 176.
	asm rjmp: -46.
	asm ldsR: 18 address: 176.
	asm andiR: 18 data: 223.
	asm rjmp: -7.
	asm orDest: 25 source: 30.
	asm rjmp: -38.
	asm inR: 19 address: 63.
	asm cli.
	asm ldsR: 24 address: 261.
	asm ldsR: 25 address: 262.
	asm ldsR: 26 address: 263.
	asm ldsR: 27 address: 264.
	asm inR: 18 address: 38.
	asm sbisR: 21 data: 0.
	asm rjmp: 5.
	asm cpiR: 18 data: 255.
	asm breq: 3.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm out: 63 r: 19.
	asm movDest: 27 source: 26.
	asm movDest: 26 source: 25.
	asm movDest: 25 source: 24.
	asm eorDest: 24 source: 24.
	asm movwDest: 22 source: 24.
	asm movwDest: 24 source: 26.
	asm addDest: 22 source: 18.
	asm adcDest: 23 source: 1.
	asm adcDest: 24 source: 1.
	asm adcDest: 25 source: 1.
	asm ldiR: 20 data: 2.
	asm addDest: 22 source: 22.
	asm adcDest: 23 source: 23.
	asm adcDest: 24 source: 24.
	asm adcDest: 25 source: 25.
	asm dec: 20.
	asm brne: -6.
	asm ret.
	asm push: 8.
	asm push: 9.
	asm push: 10.
	asm push: 11.
	asm push: 12.
	asm push: 13.
	asm push: 14.
	asm push: 15.
	asm call: 184.
	asm movwDest: 8 source: 22.
	asm movwDest: 10 source: 24.
	asm ldiR: 24 data: 232.
	asm movDest: 12 source: 24.
	asm ldiR: 24 data: 3.
	asm movDest: 13 source: 24.
	asm movDest: 14 source: 1.
	asm movDest: 15 source: 1.
	asm call: 184.
	asm subDest: 22 source: 8.
	asm sbcDest: 23 source: 9.
	asm sbcDest: 24 source: 10.
	asm sbcDest: 25 source: 11.
	asm cpiR: 22 data: 232.
	asm sbciR: 23 data: 3.
	asm cpcDest: 24 source: 1.
	asm cpcDest: 25 source: 1.
	asm brcs: -11.
	asm ldiR: 18 data: 1.
	asm subDest: 12 source: 18.
	asm sbcDest: 13 source: 1.
	asm sbcDest: 14 source: 1.
	asm sbcDest: 15 source: 1.
	asm ldiR: 24 data: 232.
	asm addDest: 8 source: 24.
	asm ldiR: 24 data: 3.
	asm adcDest: 9 source: 24.
	asm adcDest: 10 source: 1.
	asm adcDest: 11 source: 1.
	asm cpDest: 12 source: 1.
	asm cpcDest: 13 source: 1.
	asm cpcDest: 14 source: 1.
	asm cpcDest: 15 source: 1.
	asm brne: -27.
	asm pop: 15.
	asm pop: 14.
	asm pop: 13.
	asm pop: 12.
	asm pop: 11.
	asm pop: 10.
	asm pop: 9.
	asm pop: 8.
	asm ret.
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
	asm ldsR: 24 address: 257.
	asm ldsR: 25 address: 258.
	asm ldsR: 26 address: 259.
	asm ldsR: 27 address: 260.
	asm ldsR: 19 address: 256.
	asm ldiR: 18 data: 3.
	asm addDest: 18 source: 19.
	asm cpiR: 18 data: 125.
	asm brcc: 43.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm stsR: 18 data: 256.
	asm stsR: 24 data: 257.
	asm stsR: 25 data: 258.
	asm stsR: 26 data: 259.
	asm stsR: 27 data: 260.
	asm ldsR: 24 address: 261.
	asm ldsR: 25 address: 262.
	asm ldsR: 26 address: 263.
	asm ldsR: 27 address: 264.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm stsR: 24 data: 261.
	asm stsR: 25 data: 262.
	asm stsR: 26 data: 263.
	asm stsR: 27 data: 264.
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
	asm ldiR: 18 data: 134.
	asm addDest: 18 source: 19.
	asm adiwR: 24 data: 2.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm rjmp: -46.
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
	asm ldsR: 24 address: 110.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 110.
	asm stsR: 1 data: 129.
	asm ldsR: 24 address: 129.
	asm oriR: 24 data: 2.
	asm stsR: 24 data: 129.
	asm ldsR: 24 address: 129.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 129.
	asm ldsR: 24 address: 128.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 128.
	asm ldsR: 24 address: 177.
	asm oriR: 24 data: 4.
	asm stsR: 24 data: 177.
	asm ldsR: 24 address: 176.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 176.
	asm ldsR: 24 address: 122.
	asm oriR: 24 data: 4.
	asm stsR: 24 data: 122.
	asm ldsR: 24 address: 122.
	asm oriR: 24 data: 2.
	asm stsR: 24 data: 122.
	asm ldsR: 24 address: 122.
	asm oriR: 24 data: 1.
	asm stsR: 24 data: 122.
	asm ldsR: 24 address: 122.
	asm oriR: 24 data: 128.
	asm stsR: 24 data: 122.
	asm stsR: 1 data: 193.
	asm ldiR: 30 data: 157.
	asm ldiR: 31 data: 0.
	asm lpmz: 18.
	asm ldiR: 30 data: 137.
	asm ldiR: 31 data: 0.
	asm lpmz: 24.
	asm andDest: 24 source: 24.
	asm breq: 19.
	asm ldiR: 25 data: 0.
	asm addDest: 24 source: 24.
	asm adcDest: 25 source: 25.
	asm movwDest: 30 source: 24.
	asm subiR: 30 data: 152.
	asm sbciR: 31 data: 255.
	asm lpmzInc: 26.
	asm lpmz: 27.
	asm movwDest: 30 source: 24.
	asm subiR: 30 data: 142.
	asm sbciR: 31 data: 255.
	asm lpmzInc: 24.
	asm lpmz: 25.
	asm inR: 24 address: 63.
	asm cli.
	asm ldx: 30.
	asm orDest: 30 source: 18.
	asm stx: 30.
	asm out: 63 r: 24.
	asm ldiR: 28 data: 0.
	asm ldiR: 29 data: 0.
	asm ldiR: 24 data: 1.
	asm call: 112.
	asm call: 221.
	asm ldiR: 24 data: 0.
	asm call: 112.
	asm call: 221.
	asm sbiwR: 28 data: 0.
	asm breq: -12.
	asm call: 0.
	asm rjmp: -15.
	asm cli.
	asm rjmp: -1
]

{ #category : 'as yet unclassified' }
AvrArduinoNanoDev >> sample4 [
	"Blink no optimization"

	asm jmp: 97.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 1089.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm jmp: 126.
	asm nop.
	asm nop.
	asm word: 36.
	asm word: 39.
	asm word: 42.
	asm nop.
	asm nop.
	asm word: 37.
	asm word: 40.
	asm word: 43.
	asm nop.
	asm nop.
	asm word: 35.
	asm word: 38.
	asm word: 41.
	asm cpcDest: 0 source: 4.
	asm cpcDest: 0 source: 4.
	asm cpcDest: 0 source: 4.
	asm cpcDest: 0 source: 4.
	asm mulsDest: 16 source: 18.
	asm mulsDest: 16 source: 18.
	asm mulsDest: 16 source: 18.
	asm mulsuDest: 16 source: 19.
	asm mulsuDest: 16 source: 19.
	asm mulsuDest: 16 source: 19.
	asm mulsDest: 16 source: 17.
	asm sbcDest: 0 source: 4.
	asm andDest: 1 source: 0.
	asm ldz: 4.
	asm mulsDest: 16 source: 17.
	asm sbcDest: 0 source: 4.
	asm andDest: 1 source: 0.
	asm mulsDest: 16 source: 17.
	asm sbcDest: 0 source: 4.
	asm andDest: 1 source: 0.
	asm nop.
	asm sbcDest: 0 source: 0.
	asm mulsDest: 16 source: 16.
	asm word: 1.
	asm mulsuDest: 16 source: 16.
	asm cpcDest: 16 source: 20.
	asm nop.
	asm nop.
	asm nop.
	asm nop.
	asm eorDest: 1 source: 1.
	asm out: 63 r: 1.
	asm ldiR: 28 data: 255.
	asm ldiR: 29 data: 8.
	asm out: 62 r: 29.
	asm out: 61 r: 28.
	asm ldiR: 17 data: 1.
	asm ldiR: 26 data: 0.
	asm ldiR: 27 data: 1.
	asm ldiR: 30 data: 170.
	asm ldiR: 31 data: 9.
	asm rjmp: 2.
	asm lpmzInc: 0.
	asm stxInc: 0.
	asm cpiR: 26 data: 0.
	asm cpcDest: 27 source: 17.
	asm brne: -5.
	asm ldiR: 18 data: 1.
	asm ldiR: 26 data: 0.
	asm ldiR: 27 data: 1.
	asm rjmp: 1.
	asm stxInc: 1.
	asm cpiR: 26 data: 9.
	asm cpcDest: 27 source: 18.
	asm brne: -4.
	asm call: 1201.
	asm jmp: 1235.
	asm jmp: 0.
	asm push: 28.
	asm push: 29.
	asm inR: 28 address: 61.
	asm inR: 29 address: 62.
	asm pop: 29.
	asm pop: 28.
	asm ret.
	asm push: 28.
	asm push: 29.
	asm push: 1.
	asm inR: 28 address: 61.
	asm inR: 29 address: 62.
	asm stdY: 1 r: 24.
	asm lddR: 24 y: 1.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm cpiR: 24 data: 3.
	asm cpcDest: 25 source: 1.
	asm breq: 18.
	asm cpiR: 24 data: 4.
	asm cpcDest: 25 source: 1.
	asm brge: 6.
	asm cpiR: 24 data: 1.
	asm cpcDest: 25 source: 1.
	asm breq: 32.
	asm sbiwR: 24 data: 2.
	asm breq: 40.
	asm rjmp: 68.
	asm cpiR: 24 data: 7.
	asm cpcDest: 25 source: 1.
	asm breq: 46.
	asm cpiR: 24 data: 8.
	asm cpcDest: 25 source: 1.
	asm breq: 53.
	asm sbiwR: 24 data: 4.
	asm breq: 11.
	asm rjmp: 59.
	asm ldiR: 24 data: 128.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 128.
	asm ldiR: 25 data: 0.
	asm andiR: 18 data: 127.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm rjmp: 49.
	asm ldiR: 24 data: 128.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 128.
	asm ldiR: 25 data: 0.
	asm andiR: 18 data: 223.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm rjmp: 39.
	asm ldiR: 24 data: 68.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 68.
	asm ldiR: 25 data: 0.
	asm andiR: 18 data: 127.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm rjmp: 29.
	asm ldiR: 24 data: 68.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 68.
	asm ldiR: 25 data: 0.
	asm andiR: 18 data: 223.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm rjmp: 19.
	asm ldiR: 24 data: 176.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 176.
	asm ldiR: 25 data: 0.
	asm andiR: 18 data: 127.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm rjmp: 9.
	asm ldiR: 24 data: 176.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 176.
	asm ldiR: 25 data: 0.
	asm andiR: 18 data: 223.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm pop: 0.
	asm pop: 29.
	asm pop: 28.
	asm ret.
	asm push: 28.
	asm push: 29.
	asm inR: 28 address: 61.
	asm inR: 29 address: 62.
	asm sbiwR: 28 data: 17.
	asm inR: 0 address: 63.
	asm cli.
	asm out: 62 r: 29.
	asm out: 63 r: 0.
	asm out: 61 r: 28.
	asm stdY: 17 r: 24.
	asm lddR: 24 y: 17.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm subiR: 24 data: 82.
	asm sbciR: 25 data: 255.
	asm stdY: 2 r: 25.
	asm stdY: 1 r: 24.
	asm lddR: 24 y: 1.
	asm lddR: 25 y: 2.
	asm movwDest: 30 source: 24.
	asm lpmz: 24.
	asm stdY: 3 r: 24.
	asm lddR: 24 y: 3.
	asm stdY: 4 r: 24.
	asm lddR: 24 y: 17.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm subiR: 24 data: 102.
	asm sbciR: 25 data: 255.
	asm stdY: 6 r: 25.
	asm stdY: 5 r: 24.
	asm lddR: 24 y: 5.
	asm lddR: 25 y: 6.
	asm movwDest: 30 source: 24.
	asm lpmz: 24.
	asm stdY: 7 r: 24.
	asm lddR: 24 y: 7.
	asm stdY: 8 r: 24.
	asm lddR: 24 y: 17.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm subiR: 24 data: 122.
	asm sbciR: 25 data: 255.
	asm stdY: 10 r: 25.
	asm stdY: 9 r: 24.
	asm lddR: 24 y: 9.
	asm lddR: 25 y: 10.
	asm movwDest: 30 source: 24.
	asm lpmz: 24.
	asm stdY: 11 r: 24.
	asm lddR: 24 y: 11.
	asm stdY: 12 r: 24.
	asm lddR: 24 y: 12.
	asm andDest: 24 source: 24.
	asm brne: 3.
	asm ldiR: 24 data: 0.
	asm ldiR: 25 data: 0.
	asm rjmp: 38.
	asm lddR: 24 y: 4.
	asm andDest: 24 source: 24.
	asm breq: 3.
	asm lddR: 24 y: 4.
	asm call: 135.
	asm lddR: 24 y: 12.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm addDest: 24 source: 24.
	asm adcDest: 25 source: 25.
	asm subiR: 24 data: 132.
	asm sbciR: 25 data: 255.
	asm stdY: 14 r: 25.
	asm stdY: 13 r: 24.
	asm lddR: 24 y: 13.
	asm lddR: 25 y: 14.
	asm movwDest: 30 source: 24.
	asm lpmzInc: 18.
	asm lpmz: 19.
	asm movwDest: 24 source: 30.
	asm stdY: 16 r: 19.
	asm stdY: 15 r: 18.
	asm stdY: 14 r: 25.
	asm stdY: 13 r: 24.
	asm lddR: 24 y: 15.
	asm lddR: 25 y: 16.
	asm movwDest: 30 source: 24.
	asm ldz: 25.
	asm lddR: 24 y: 8.
	asm andDest: 24 source: 25.
	asm andDest: 24 source: 24.
	asm breq: 3.
	asm ldiR: 24 data: 1.
	asm ldiR: 25 data: 0.
	asm rjmp: 2.
	asm ldiR: 24 data: 0.
	asm ldiR: 25 data: 0.
	asm adiwR: 28 data: 17.
	asm inR: 0 address: 63.
	asm cli.
	asm out: 62 r: 29.
	asm out: 63 r: 0.
	asm out: 61 r: 28.
	asm pop: 29.
	asm pop: 28.
	asm ret.
	asm push: 28.
	asm push: 29.
	asm inR: 28 address: 61.
	asm inR: 29 address: 62.
	asm sbiwR: 28 data: 21.
	asm inR: 0 address: 63.
	asm cli.
	asm out: 62 r: 29.
	asm out: 63 r: 0.
	asm out: 61 r: 28.
	asm stdY: 20 r: 24.
	asm stdY: 21 r: 22.
	asm lddR: 24 y: 20.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm subiR: 24 data: 82.
	asm sbciR: 25 data: 255.
	asm stdY: 2 r: 25.
	asm stdY: 1 r: 24.
	asm lddR: 24 y: 1.
	asm lddR: 25 y: 2.
	asm movwDest: 30 source: 24.
	asm lpmz: 24.
	asm stdY: 3 r: 24.
	asm lddR: 24 y: 3.
	asm stdY: 4 r: 24.
	asm lddR: 24 y: 20.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm subiR: 24 data: 102.
	asm sbciR: 25 data: 255.
	asm stdY: 6 r: 25.
	asm stdY: 5 r: 24.
	asm lddR: 24 y: 5.
	asm lddR: 25 y: 6.
	asm movwDest: 30 source: 24.
	asm lpmz: 24.
	asm stdY: 7 r: 24.
	asm lddR: 24 y: 7.
	asm stdY: 8 r: 24.
	asm lddR: 24 y: 20.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm subiR: 24 data: 122.
	asm sbciR: 25 data: 255.
	asm stdY: 10 r: 25.
	asm stdY: 9 r: 24.
	asm lddR: 24 y: 9.
	asm lddR: 25 y: 10.
	asm movwDest: 30 source: 24.
	asm lpmz: 24.
	asm stdY: 11 r: 24.
	asm lddR: 24 y: 11.
	asm stdY: 12 r: 24.
	asm lddR: 24 y: 12.
	asm andDest: 24 source: 24.
	asm brne: 1.
	asm rjmp: 68.
	asm lddR: 24 y: 4.
	asm andDest: 24 source: 24.
	asm breq: 3.
	asm lddR: 24 y: 4.
	asm call: 135.
	asm lddR: 24 y: 12.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm addDest: 24 source: 24.
	asm adcDest: 25 source: 25.
	asm subiR: 24 data: 142.
	asm sbciR: 25 data: 255.
	asm stdY: 14 r: 25.
	asm stdY: 13 r: 24.
	asm lddR: 24 y: 13.
	asm lddR: 25 y: 14.
	asm movwDest: 30 source: 24.
	asm lpmzInc: 18.
	asm lpmz: 19.
	asm movwDest: 24 source: 30.
	asm stdY: 16 r: 19.
	asm stdY: 15 r: 18.
	asm stdY: 14 r: 25.
	asm stdY: 13 r: 24.
	asm lddR: 24 y: 15.
	asm lddR: 25 y: 16.
	asm stdY: 18 r: 25.
	asm stdY: 17 r: 24.
	asm ldiR: 24 data: 95.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 24.
	asm stdY: 19 r: 24.
	asm cli.
	asm lddR: 24 y: 21.
	asm andDest: 24 source: 24.
	asm brne: 14.
	asm lddR: 24 y: 17.
	asm lddR: 25 y: 18.
	asm movwDest: 30 source: 24.
	asm ldz: 24.
	asm movDest: 25 source: 24.
	asm lddR: 24 y: 8.
	asm com: 24.
	asm andDest: 24 source: 25.
	asm movDest: 18 source: 24.
	asm lddR: 24 y: 17.
	asm lddR: 25 y: 18.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm rjmp: 11.
	asm lddR: 24 y: 17.
	asm lddR: 25 y: 18.
	asm movwDest: 30 source: 24.
	asm ldz: 25.
	asm lddR: 24 y: 8.
	asm movDest: 18 source: 25.
	asm orDest: 18 source: 24.
	asm lddR: 24 y: 17.
	asm lddR: 25 y: 18.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 95.
	asm ldiR: 25 data: 0.
	asm lddR: 18 y: 19.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm adiwR: 28 data: 21.
	asm inR: 0 address: 63.
	asm cli.
	asm out: 62 r: 29.
	asm out: 63 r: 0.
	asm out: 61 r: 28.
	asm pop: 29.
	asm pop: 28.
	asm ret.
	asm push: 28.
	asm push: 29.
	asm inR: 28 address: 61.
	asm inR: 29 address: 62.
	asm sbiwR: 28 data: 25.
	asm inR: 0 address: 63.
	asm cli.
	asm out: 62 r: 29.
	asm out: 63 r: 0.
	asm out: 61 r: 28.
	asm stdY: 24 r: 24.
	asm stdY: 25 r: 22.
	asm lddR: 24 y: 24.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm subiR: 24 data: 102.
	asm sbciR: 25 data: 255.
	asm stdY: 2 r: 25.
	asm stdY: 1 r: 24.
	asm lddR: 24 y: 1.
	asm lddR: 25 y: 2.
	asm movwDest: 30 source: 24.
	asm lpmz: 24.
	asm stdY: 3 r: 24.
	asm lddR: 24 y: 3.
	asm stdY: 4 r: 24.
	asm lddR: 24 y: 24.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm subiR: 24 data: 122.
	asm sbciR: 25 data: 255.
	asm stdY: 6 r: 25.
	asm stdY: 5 r: 24.
	asm lddR: 24 y: 5.
	asm lddR: 25 y: 6.
	asm movwDest: 30 source: 24.
	asm lpmz: 24.
	asm stdY: 7 r: 24.
	asm lddR: 24 y: 7.
	asm stdY: 8 r: 24.
	asm lddR: 24 y: 8.
	asm andDest: 24 source: 24.
	asm brne: 1.
	asm rjmp: 148.
	asm lddR: 24 y: 8.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm addDest: 24 source: 24.
	asm adcDest: 25 source: 25.
	asm subiR: 24 data: 152.
	asm sbciR: 25 data: 255.
	asm stdY: 10 r: 25.
	asm stdY: 9 r: 24.
	asm lddR: 24 y: 9.
	asm lddR: 25 y: 10.
	asm movwDest: 30 source: 24.
	asm lpmzInc: 18.
	asm lpmz: 19.
	asm movwDest: 24 source: 30.
	asm stdY: 12 r: 19.
	asm stdY: 11 r: 18.
	asm stdY: 10 r: 25.
	asm stdY: 9 r: 24.
	asm lddR: 24 y: 11.
	asm lddR: 25 y: 12.
	asm stdY: 14 r: 25.
	asm stdY: 13 r: 24.
	asm lddR: 24 y: 8.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm addDest: 24 source: 24.
	asm adcDest: 25 source: 25.
	asm subiR: 24 data: 142.
	asm sbciR: 25 data: 255.
	asm stdY: 16 r: 25.
	asm stdY: 15 r: 24.
	asm lddR: 24 y: 15.
	asm lddR: 25 y: 16.
	asm movwDest: 30 source: 24.
	asm lpmzInc: 18.
	asm lpmz: 19.
	asm movwDest: 24 source: 30.
	asm stdY: 18 r: 19.
	asm stdY: 17 r: 18.
	asm stdY: 16 r: 25.
	asm stdY: 15 r: 24.
	asm lddR: 24 y: 17.
	asm lddR: 25 y: 18.
	asm stdY: 20 r: 25.
	asm stdY: 19 r: 24.
	asm lddR: 24 y: 25.
	asm andDest: 24 source: 24.
	asm brne: 38.
	asm ldiR: 24 data: 95.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 24.
	asm stdY: 23 r: 24.
	asm cli.
	asm lddR: 24 y: 13.
	asm lddR: 25 y: 14.
	asm movwDest: 30 source: 24.
	asm ldz: 24.
	asm movDest: 25 source: 24.
	asm lddR: 24 y: 4.
	asm com: 24.
	asm andDest: 24 source: 25.
	asm movDest: 18 source: 24.
	asm lddR: 24 y: 13.
	asm lddR: 25 y: 14.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm lddR: 24 y: 19.
	asm lddR: 25 y: 20.
	asm movwDest: 30 source: 24.
	asm ldz: 24.
	asm movDest: 25 source: 24.
	asm lddR: 24 y: 4.
	asm com: 24.
	asm andDest: 24 source: 25.
	asm movDest: 18 source: 24.
	asm lddR: 24 y: 19.
	asm lddR: 25 y: 20.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 95.
	asm ldiR: 25 data: 0.
	asm lddR: 18 y: 23.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm rjmp: 61.
	asm lddR: 24 y: 25.
	asm cpiR: 24 data: 2.
	asm brne: 36.
	asm ldiR: 24 data: 95.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 24.
	asm stdY: 22 r: 24.
	asm cli.
	asm lddR: 24 y: 13.
	asm lddR: 25 y: 14.
	asm movwDest: 30 source: 24.
	asm ldz: 24.
	asm movDest: 25 source: 24.
	asm lddR: 24 y: 4.
	asm com: 24.
	asm andDest: 24 source: 25.
	asm movDest: 18 source: 24.
	asm lddR: 24 y: 13.
	asm lddR: 25 y: 14.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm lddR: 24 y: 19.
	asm lddR: 25 y: 20.
	asm movwDest: 30 source: 24.
	asm ldz: 25.
	asm lddR: 24 y: 4.
	asm movDest: 18 source: 25.
	asm orDest: 18 source: 24.
	asm lddR: 24 y: 19.
	asm lddR: 25 y: 20.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 95.
	asm ldiR: 25 data: 0.
	asm lddR: 18 y: 22.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm rjmp: 22.
	asm ldiR: 24 data: 95.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 24.
	asm stdY: 21 r: 24.
	asm cli.
	asm lddR: 24 y: 13.
	asm lddR: 25 y: 14.
	asm movwDest: 30 source: 24.
	asm ldz: 25.
	asm lddR: 24 y: 4.
	asm movDest: 18 source: 25.
	asm orDest: 18 source: 24.
	asm lddR: 24 y: 13.
	asm lddR: 25 y: 14.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 95.
	asm ldiR: 25 data: 0.
	asm lddR: 18 y: 21.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm adiwR: 28 data: 25.
	asm inR: 0 address: 63.
	asm cli.
	asm out: 62 r: 29.
	asm out: 63 r: 0.
	asm out: 61 r: 28.
	asm pop: 29.
	asm pop: 28.
	asm ret.
	asm push: 28.
	asm push: 29.
	asm inR: 28 address: 61.
	asm inR: 29 address: 62.
	asm sei.
	asm ldiR: 24 data: 68.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 68.
	asm ldiR: 25 data: 0.
	asm oriR: 18 data: 2.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 68.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 68.
	asm ldiR: 25 data: 0.
	asm oriR: 18 data: 1.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 69.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 69.
	asm ldiR: 25 data: 0.
	asm oriR: 18 data: 2.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 69.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 69.
	asm ldiR: 25 data: 0.
	asm oriR: 18 data: 1.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 110.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 110.
	asm ldiR: 25 data: 0.
	asm oriR: 18 data: 1.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 129.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm stz: 1.
	asm ldiR: 24 data: 129.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 129.
	asm ldiR: 25 data: 0.
	asm oriR: 18 data: 2.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 129.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 129.
	asm ldiR: 25 data: 0.
	asm oriR: 18 data: 1.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 128.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 128.
	asm ldiR: 25 data: 0.
	asm oriR: 18 data: 1.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 177.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 177.
	asm ldiR: 25 data: 0.
	asm oriR: 18 data: 4.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 176.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 176.
	asm ldiR: 25 data: 0.
	asm oriR: 18 data: 1.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 122.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 122.
	asm ldiR: 25 data: 0.
	asm oriR: 18 data: 4.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 122.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 122.
	asm ldiR: 25 data: 0.
	asm oriR: 18 data: 2.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 122.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 122.
	asm ldiR: 25 data: 0.
	asm oriR: 18 data: 1.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 122.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 18.
	asm ldiR: 24 data: 122.
	asm ldiR: 25 data: 0.
	asm oriR: 18 data: 128.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm ldiR: 24 data: 193.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm stz: 1.
	asm pop: 29.
	asm pop: 28.
	asm ret.
	asm push: 28.
	asm push: 29.
	asm rcall: 0.
	asm inR: 28 address: 61.
	asm inR: 29 address: 62.
	asm stdY: 2 r: 25.
	asm stdY: 1 r: 24.
	asm lddR: 24 y: 1.
	asm lddR: 25 y: 2.
	asm sbiwR: 24 data: 2.
	asm brcs: 19.
	asm lddR: 24 y: 1.
	asm lddR: 25 y: 2.
	asm addDest: 24 source: 24.
	asm adcDest: 25 source: 25.
	asm addDest: 24 source: 24.
	asm adcDest: 25 source: 25.
	asm stdY: 2 r: 25.
	asm stdY: 1 r: 24.
	asm lddR: 24 y: 1.
	asm lddR: 25 y: 2.
	asm sbiwR: 24 data: 5.
	asm stdY: 2 r: 25.
	asm stdY: 1 r: 24.
	asm lddR: 24 y: 1.
	asm lddR: 25 y: 2.
	asm sbiwR: 24 data: 1.
	asm brne: -2.
	asm stdY: 2 r: 25.
	asm stdY: 1 r: 24.
	asm pop: 0.
	asm pop: 0.
	asm pop: 29.
	asm pop: 28.
	asm ret.
	asm push: 28.
	asm push: 29.
	asm rcall: 0.
	asm rcall: 0.
	asm rcall: 0.
	asm inR: 28 address: 61.
	asm inR: 29 address: 62.
	asm ldiR: 24 data: 95.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 24.
	asm stdY: 5 r: 24.
	asm cli.
	asm ldsR: 24 address: 261.
	asm ldsR: 25 address: 262.
	asm ldsR: 26 address: 263.
	asm ldsR: 27 address: 264.
	asm stdY: 1 r: 24.
	asm stdY: 2 r: 25.
	asm stdY: 3 r: 26.
	asm stdY: 4 r: 27.
	asm ldiR: 24 data: 70.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 24.
	asm stdY: 6 r: 24.
	asm ldiR: 24 data: 53.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 24.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm andiR: 24 data: 1.
	asm eorDest: 25 source: 25.
	asm orDest: 24 source: 25.
	asm breq: 14.
	asm lddR: 24 y: 6.
	asm cpiR: 24 data: 255.
	asm breq: 11.
	asm lddR: 24 y: 1.
	asm lddR: 25 y: 2.
	asm lddR: 26 y: 3.
	asm lddR: 27 y: 4.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm stdY: 1 r: 24.
	asm stdY: 2 r: 25.
	asm stdY: 3 r: 26.
	asm stdY: 4 r: 27.
	asm ldiR: 24 data: 95.
	asm ldiR: 25 data: 0.
	asm lddR: 18 y: 5.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm lddR: 24 y: 1.
	asm lddR: 25 y: 2.
	asm lddR: 26 y: 3.
	asm lddR: 27 y: 4.
	asm eorDest: 18 source: 18.
	asm movDest: 19 source: 24.
	asm movDest: 20 source: 25.
	asm movDest: 21 source: 26.
	asm lddR: 24 y: 6.
	asm movDest: 24 source: 24.
	asm ldiR: 25 data: 0.
	asm ldiR: 26 data: 0.
	asm ldiR: 27 data: 0.
	asm addDest: 24 source: 18.
	asm adcDest: 25 source: 19.
	asm adcDest: 26 source: 20.
	asm adcDest: 27 source: 21.
	asm addDest: 24 source: 24.
	asm adcDest: 25 source: 25.
	asm adcDest: 26 source: 26.
	asm adcDest: 27 source: 27.
	asm addDest: 24 source: 24.
	asm adcDest: 25 source: 25.
	asm adcDest: 26 source: 26.
	asm adcDest: 27 source: 27.
	asm movwDest: 22 source: 24.
	asm movwDest: 24 source: 26.
	asm adiwR: 28 data: 6.
	asm inR: 0 address: 63.
	asm cli.
	asm out: 62 r: 29.
	asm out: 63 r: 0.
	asm out: 61 r: 28.
	asm pop: 29.
	asm pop: 28.
	asm ret.
	asm push: 14.
	asm push: 15.
	asm push: 16.
	asm push: 17.
	asm push: 28.
	asm push: 29.
	asm inR: 28 address: 61.
	asm inR: 29 address: 62.
	asm sbiwR: 28 data: 8.
	asm inR: 0 address: 63.
	asm cli.
	asm out: 62 r: 29.
	asm out: 63 r: 0.
	asm out: 61 r: 28.
	asm stdY: 5 r: 22.
	asm stdY: 6 r: 23.
	asm stdY: 7 r: 24.
	asm stdY: 8 r: 25.
	asm call: 847.
	asm movwDest: 26 source: 24.
	asm movwDest: 24 source: 22.
	asm stdY: 1 r: 24.
	asm stdY: 2 r: 25.
	asm stdY: 3 r: 26.
	asm stdY: 4 r: 27.
	asm rjmp: 55.
	asm call: 128.
	asm rjmp: 23.
	asm lddR: 24 y: 5.
	asm lddR: 25 y: 6.
	asm lddR: 26 y: 7.
	asm lddR: 27 y: 8.
	asm sbiwR: 24 data: 1.
	asm sbcDest: 26 source: 1.
	asm sbcDest: 27 source: 1.
	asm stdY: 5 r: 24.
	asm stdY: 6 r: 25.
	asm stdY: 7 r: 26.
	asm stdY: 8 r: 27.
	asm lddR: 24 y: 1.
	asm lddR: 25 y: 2.
	asm lddR: 26 y: 3.
	asm lddR: 27 y: 4.
	asm subiR: 24 data: 24.
	asm sbciR: 25 data: 252.
	asm sbciR: 26 data: 255.
	asm sbciR: 27 data: 255.
	asm stdY: 1 r: 24.
	asm stdY: 2 r: 25.
	asm stdY: 3 r: 26.
	asm stdY: 4 r: 27.
	asm lddR: 24 y: 5.
	asm lddR: 25 y: 6.
	asm lddR: 26 y: 7.
	asm lddR: 27 y: 8.
	asm orDest: 24 source: 25.
	asm orDest: 24 source: 26.
	asm orDest: 24 source: 27.
	asm breq: 21.
	asm call: 847.
	asm movwDest: 18 source: 22.
	asm movwDest: 20 source: 24.
	asm lddR: 24 y: 1.
	asm lddR: 25 y: 2.
	asm lddR: 26 y: 3.
	asm lddR: 27 y: 4.
	asm movwDest: 14 source: 18.
	asm movwDest: 16 source: 20.
	asm subDest: 14 source: 24.
	asm sbcDest: 15 source: 25.
	asm sbcDest: 16 source: 26.
	asm sbcDest: 17 source: 27.
	asm movwDest: 26 source: 16.
	asm movwDest: 24 source: 14.
	asm cpiR: 24 data: 232.
	asm sbciR: 25 data: 3.
	asm cpcDest: 26 source: 1.
	asm cpcDest: 27 source: 1.
	asm brcc: -52.
	asm lddR: 24 y: 5.
	asm lddR: 25 y: 6.
	asm lddR: 26 y: 7.
	asm lddR: 27 y: 8.
	asm orDest: 24 source: 25.
	asm orDest: 24 source: 26.
	asm orDest: 24 source: 27.
	asm brne: -63.
	asm adiwR: 28 data: 8.
	asm inR: 0 address: 63.
	asm cli.
	asm out: 62 r: 29.
	asm out: 63 r: 0.
	asm out: 61 r: 28.
	asm pop: 29.
	asm pop: 28.
	asm pop: 17.
	asm pop: 16.
	asm pop: 15.
	asm pop: 14.
	asm ret.
	asm push: 28.
	asm push: 29.
	asm rcall: 0.
	asm rcall: 0.
	asm push: 1.
	asm inR: 28 address: 61.
	asm inR: 29 address: 62.
	asm ldiR: 24 data: 95.
	asm ldiR: 25 data: 0.
	asm movwDest: 30 source: 24.
	asm ldz: 24.
	asm stdY: 1 r: 24.
	asm cli.
	asm ldsR: 24 address: 257.
	asm ldsR: 25 address: 258.
	asm ldsR: 26 address: 259.
	asm ldsR: 27 address: 260.
	asm stdY: 2 r: 24.
	asm stdY: 3 r: 25.
	asm stdY: 4 r: 26.
	asm stdY: 5 r: 27.
	asm ldiR: 24 data: 95.
	asm ldiR: 25 data: 0.
	asm lddR: 18 y: 1.
	asm movwDest: 30 source: 24.
	asm stz: 18.
	asm lddR: 24 y: 2.
	asm lddR: 25 y: 3.
	asm lddR: 26 y: 4.
	asm lddR: 27 y: 5.
	asm movwDest: 22 source: 24.
	asm movwDest: 24 source: 26.
	asm pop: 0.
	asm pop: 0.
	asm pop: 0.
	asm pop: 0.
	asm pop: 0.
	asm pop: 29.
	asm pop: 28.
	asm ret.
	asm push: 1.
	asm push: 0.
	asm inR: 0 address: 63.
	asm push: 0.
	asm eorDest: 1 source: 1.
	asm push: 24.
	asm push: 25.
	asm push: 26.
	asm push: 27.
	asm push: 28.
	asm push: 29.
	asm inR: 28 address: 61.
	asm inR: 29 address: 62.
	asm sbiwR: 28 data: 5.
	asm out: 62 r: 29.
	asm out: 61 r: 28.
	asm ldsR: 24 address: 257.
	asm ldsR: 25 address: 258.
	asm ldsR: 26 address: 259.
	asm ldsR: 27 address: 260.
	asm stdY: 1 r: 24.
	asm stdY: 2 r: 25.
	asm stdY: 3 r: 26.
	asm stdY: 4 r: 27.
	asm ldsR: 24 address: 256.
	asm stdY: 5 r: 24.
	asm lddR: 24 y: 1.
	asm lddR: 25 y: 2.
	asm lddR: 26 y: 3.
	asm lddR: 27 y: 4.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm stdY: 1 r: 24.
	asm stdY: 2 r: 25.
	asm stdY: 3 r: 26.
	asm stdY: 4 r: 27.
	asm lddR: 24 y: 5.
	asm subiR: 24 data: 253.
	asm stdY: 5 r: 24.
	asm lddR: 24 y: 5.
	asm cpiR: 24 data: 125.
	asm brcs: 14.
	asm lddR: 24 y: 5.
	asm subiR: 24 data: 125.
	asm stdY: 5 r: 24.
	asm lddR: 24 y: 1.
	asm lddR: 25 y: 2.
	asm lddR: 26 y: 3.
	asm lddR: 27 y: 4.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm stdY: 1 r: 24.
	asm stdY: 2 r: 25.
	asm stdY: 3 r: 26.
	asm stdY: 4 r: 27.
	asm lddR: 24 y: 5.
	asm stsR: 24 data: 256.
	asm lddR: 24 y: 1.
	asm lddR: 25 y: 2.
	asm lddR: 26 y: 3.
	asm lddR: 27 y: 4.
	asm stsR: 24 data: 257.
	asm stsR: 25 data: 258.
	asm stsR: 26 data: 259.
	asm stsR: 27 data: 260.
	asm ldsR: 24 address: 261.
	asm ldsR: 25 address: 262.
	asm ldsR: 26 address: 263.
	asm ldsR: 27 address: 264.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm stsR: 24 data: 261.
	asm stsR: 25 data: 262.
	asm stsR: 26 data: 263.
	asm stsR: 27 data: 264.
	asm pop: 0.
	asm pop: 0.
	asm pop: 0.
	asm pop: 0.
	asm pop: 0.
	asm pop: 29.
	asm pop: 28.
	asm pop: 27.
	asm pop: 26.
	asm pop: 25.
	asm pop: 24.
	asm pop: 0.
	asm out: 63 r: 0.
	asm pop: 0.
	asm pop: 1.
	asm reti.
	asm call: 670.
	asm ldiR: 22 data: 1.
	asm ldiR: 24 data: 13.
	asm call: 469.
	asm ldiR: 16 data: 0.
	asm ldiR: 17 data: 0.
	asm ldiR: 22 data: 1.
	asm ldiR: 24 data: 13.
	asm call: 334.
	asm ldiR: 22 data: 232.
	asm ldiR: 23 data: 3.
	asm ldiR: 24 data: 0.
	asm ldiR: 25 data: 0.
	asm call: 942.
	asm ldiR: 22 data: 0.
	asm ldiR: 24 data: 13.
	asm call: 334.
	asm ldiR: 22 data: 232.
	asm ldiR: 23 data: 3.
	asm ldiR: 24 data: 0.
	asm ldiR: 25 data: 0.
	asm call: 942.
	asm cpDest: 16 source: 1.
	asm cpcDest: 17 source: 1.
	asm breq: -23.
	asm call: 0.
	asm rjmp: -26.
	asm cli.
	asm rjmp: -1
]

{ #category : 'programs' }
AvrArduinoNanoDev >> setVectors [

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
	asm jmp: #timer1Int.
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
AvrArduinoNanoDev >> timer1Int [

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
	asm ldsR: 24 address: 261.
	asm ldsR: 25 address: 262.
	asm ldsR: 26 address: 263.
	asm ldsR: 27 address: 264.
	asm ldsR: 19 address: 260.
	asm ldiR: 18 data: 3.
	asm addDest: 18 source: 19.
	asm cpiR: 18 data: 125.
	asm brcc: 'timer1IntLabel2'.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm label: 'timer1IntLabel1'.
	asm stsR: 18 data: 260.
	asm stsR: 24 data: 261.
	asm stsR: 25 data: 262.
	asm stsR: 26 data: 263.
	asm stsR: 27 data: 264.
	asm ldsR: 24 address: 256.
	asm ldsR: 25 address: 257.
	asm ldsR: 26 address: 258.
	asm ldsR: 27 address: 259.
	asm adiwR: 24 data: 1.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm stsR: 24 data: 256.
	asm stsR: 25 data: 257.
	asm stsR: 26 data: 258.
	asm stsR: 27 data: 259.
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
	asm label: 'timer1IntLabel2'.
	asm ldiR: 18 data: 134.
	asm addDest: 18 source: 19.
	asm adiwR: 24 data: 2.
	asm adcDest: 26 source: 1.
	asm adcDest: 27 source: 1.
	asm rjmp: 'timer1IntLabel1'
]
