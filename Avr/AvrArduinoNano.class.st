Class {
	#name : 'AvrArduinoNano',
	#superclass : 'AvrArduino',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'private' }
AvrArduinoNano >> boot [

	self eorDest: 1 source: 1.
	self out: 16r3F r: 1.
	self ldiR: 28 data: 16rFF.
	self ldiR: 29 data: 16r8.
	self out: 16r3e r: 29.
	self out: 16r3d r: 28.
	self ldiR: 18 data: 1.
	self ldiR: 26 data: 0.
	self ldiR: 27 data: 1.
	self rjmp: 1.
	self stxInc: 1.
	self cpiR: 26 data: 9.
	self cpcDest: 27 source: 18.
	self brne: -4.
	self call: 146.
	self jmp: #endlessLoop
]

{ #category : 'private' }
AvrArduinoNano >> endlessLoop [

	self cli.
	self rjmp: -1
]

{ #category : 'samples' }
AvrArduinoNano >> sample1 [

	self jmp: 52.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 72.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self eorDest: 1 source: 1.
	self out: 63 r: 1.
	self ldiR: 28 data: 255.
	self ldiR: 29 data: 8.
	self out: 62 r: 29.
	self out: 61 r: 28.
	self ldiR: 18 data: 1.
	self ldiR: 26 data: 0.
	self ldiR: 27 data: 1.
	self rjmp: 1.
	self stxInc: 1.
	self cpiR: 26 data: 9.
	self cpcDest: 27 source: 18.
	self brne: -4.
	self call: 146.
	self jmp: 220.
	self jmp: 0.
	self push: 1.
	self push: 0.
	self inR: 0 address: 63.
	self push: 0.
	self eorDest: 1 source: 1.
	self push: 18.
	self push: 19.
	self push: 24.
	self push: 25.
	self push: 26.
	self push: 27.
	self ldsR: 24 address: 261.
	self ldsR: 25 address: 262.
	self ldsR: 26 address: 263.
	self ldsR: 27 address: 264.
	self ldsR: 19 address: 260.
	self ldiR: 18 data: 3.
	self addDest: 18 source: 19.
	self cpiR: 18 data: 125.
	self brcc: 43.
	self adiwR: 24 data: 1.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self stsR: 18 data: 260.
	self stsR: 24 data: 261.
	self stsR: 25 data: 262.
	self stsR: 26 data: 263.
	self stsR: 27 data: 264.
	self ldsR: 24 address: 256.
	self ldsR: 25 address: 257.
	self ldsR: 26 address: 258.
	self ldsR: 27 address: 259.
	self adiwR: 24 data: 1.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self stsR: 24 data: 256.
	self stsR: 25 data: 257.
	self stsR: 26 data: 258.
	self stsR: 27 data: 259.
	self pop: 27.
	self pop: 26.
	self pop: 25.
	self pop: 24.
	self pop: 19.
	self pop: 18.
	self pop: 0.
	self out: 63 r: 0.
	self pop: 0.
	self pop: 1.
	self reti.
	self ldiR: 18 data: 134.
	self addDest: 18 source: 19.
	self adiwR: 24 data: 2.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self rjmp: -46.
	self sei.
	self inR: 24 address: 36.
	self oriR: 24 data: 2.
	self out: 36 r: 24.
	self inR: 24 address: 36.
	self oriR: 24 data: 1.
	self out: 36 r: 24.
	self inR: 24 address: 37.
	self oriR: 24 data: 2.
	self out: 37 r: 24.
	self inR: 24 address: 37.
	self oriR: 24 data: 1.
	self out: 37 r: 24.
	self ldsR: 24 address: 110.
	self oriR: 24 data: 1.
	self stsR: 24 data: 110.
	self stsR: 1 data: 129.
	self ldsR: 24 address: 129.
	self oriR: 24 data: 2.
	self stsR: 24 data: 129.
	self ldsR: 24 address: 129.
	self oriR: 24 data: 1.
	self stsR: 24 data: 129.
	self ldsR: 24 address: 128.
	self oriR: 24 data: 1.
	self stsR: 24 data: 128.
	self ldsR: 24 address: 177.
	self oriR: 24 data: 4.
	self stsR: 24 data: 177.
	self ldsR: 24 address: 176.
	self oriR: 24 data: 1.
	self stsR: 24 data: 176.
	self ldsR: 24 address: 122.
	self oriR: 24 data: 4.
	self stsR: 24 data: 122.
	self ldsR: 24 address: 122.
	self oriR: 24 data: 2.
	self stsR: 24 data: 122.
	self ldsR: 24 address: 122.
	self oriR: 24 data: 1.
	self stsR: 24 data: 122.
	self ldsR: 24 address: 122.
	self oriR: 24 data: 128.
	self stsR: 24 data: 122.
	self stsR: 1 data: 193.
	self ldiR: 28 data: 0.
	self ldiR: 29 data: 0.
	self sbiwR: 28 data: 0.
	self breq: -2.
	self call: 0.
	self rjmp: -5.
	self cli.
	self rjmp: -1
]

{ #category : 'samples' }
AvrArduinoNano >> sample2 [

	self jmp: 52.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 159.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self jmp: 70.
	self eorDest: 1 source: 1.
	self out: 63 r: 1.
	self ldiR: 28 data: 255.
	self ldiR: 29 data: 8.
	self out: 62 r: 29.
	self out: 61 r: 28.
	self ldiR: 18 data: 1.
	self ldiR: 26 data: 0.
	self ldiR: 27 data: 1.
	self rjmp: 1.
	self stxInc: 1.
	self cpiR: 26 data: 9.
	self cpcDest: 27 source: 18.
	self brne: -4.
	self call: 233.
	self jmp: 319.
	self jmp: 0.
	self inR: 19 address: 63.
	self cli.
	self ldsR: 24 address: 261.
	self ldsR: 25 address: 262.
	self ldsR: 26 address: 263.
	self ldsR: 27 address: 264.
	self inR: 18 address: 38.
	self sbisR: 21 data: 0.
	self rjmp: 5.
	self cpiR: 18 data: 255.
	self breq: 3.
	self adiwR: 24 data: 1.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self out: 63 r: 19.
	self movDest: 27 source: 26.
	self movDest: 26 source: 25.
	self movDest: 25 source: 24.
	self eorDest: 24 source: 24.
	self movwDest: 22 source: 24.
	self movwDest: 24 source: 26.
	self addDest: 22 source: 18.
	self adcDest: 23 source: 1.
	self adcDest: 24 source: 1.
	self adcDest: 25 source: 1.
	self ldiR: 20 data: 2.
	self addDest: 22 source: 22.
	self adcDest: 23 source: 23.
	self adcDest: 24 source: 24.
	self adcDest: 25 source: 25.
	self dec: 20.
	self brne: -6.
	self ret.
	self push: 8.
	self push: 9.
	self push: 10.
	self push: 11.
	self push: 12.
	self push: 13.
	self push: 14.
	self push: 15.
	self movwDest: 8 source: 22.
	self movwDest: 10 source: 24.
	self call: 72.
	self movwDest: 12 source: 22.
	self movwDest: 14 source: 24.
	self call: 72.
	self subDest: 22 source: 12.
	self sbcDest: 23 source: 13.
	self sbcDest: 24 source: 14.
	self sbcDest: 25 source: 15.
	self cpiR: 22 data: 232.
	self sbciR: 23 data: 3.
	self cpcDest: 24 source: 1.
	self cpcDest: 25 source: 1.
	self brcs: -11.
	self ldiR: 18 data: 1.
	self subDest: 8 source: 18.
	self sbcDest: 9 source: 1.
	self sbcDest: 10 source: 1.
	self sbcDest: 11 source: 1.
	self ldiR: 24 data: 232.
	self addDest: 12 source: 24.
	self ldiR: 24 data: 3.
	self adcDest: 13 source: 24.
	self adcDest: 14 source: 1.
	self adcDest: 15 source: 1.
	self cpDest: 8 source: 1.
	self cpcDest: 9 source: 1.
	self cpcDest: 10 source: 1.
	self cpcDest: 11 source: 1.
	self brne: -27.
	self pop: 15.
	self pop: 14.
	self pop: 13.
	self pop: 12.
	self pop: 11.
	self pop: 10.
	self pop: 9.
	self pop: 8.
	self ret.
	self push: 1.
	self push: 0.
	self inR: 0 address: 63.
	self push: 0.
	self eorDest: 1 source: 1.
	self push: 18.
	self push: 19.
	self push: 24.
	self push: 25.
	self push: 26.
	self push: 27.
	self ldsR: 24 address: 257.
	self ldsR: 25 address: 258.
	self ldsR: 26 address: 259.
	self ldsR: 27 address: 260.
	self ldsR: 19 address: 256.
	self ldiR: 18 data: 3.
	self addDest: 18 source: 19.
	self cpiR: 18 data: 125.
	self brcc: 43.
	self adiwR: 24 data: 1.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self stsR: 18 data: 256.
	self stsR: 24 data: 257.
	self stsR: 25 data: 258.
	self stsR: 26 data: 259.
	self stsR: 27 data: 260.
	self ldsR: 24 address: 261.
	self ldsR: 25 address: 262.
	self ldsR: 26 address: 263.
	self ldsR: 27 address: 264.
	self adiwR: 24 data: 1.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self stsR: 24 data: 261.
	self stsR: 25 data: 262.
	self stsR: 26 data: 263.
	self stsR: 27 data: 264.
	self pop: 27.
	self pop: 26.
	self pop: 25.
	self pop: 24.
	self pop: 19.
	self pop: 18.
	self pop: 0.
	self out: 63 r: 0.
	self pop: 0.
	self pop: 1.
	self reti.
	self ldiR: 18 data: 134.
	self addDest: 18 source: 19.
	self adiwR: 24 data: 2.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self rjmp: -46.
	self sei.
	self inR: 24 address: 36.
	self oriR: 24 data: 2.
	self out: 36 r: 24.
	self inR: 24 address: 36.
	self oriR: 24 data: 1.
	self out: 36 r: 24.
	self inR: 24 address: 37.
	self oriR: 24 data: 2.
	self out: 37 r: 24.
	self inR: 24 address: 37.
	self oriR: 24 data: 1.
	self out: 37 r: 24.
	self ldsR: 24 address: 110.
	self oriR: 24 data: 1.
	self stsR: 24 data: 110.
	self stsR: 1 data: 129.
	self ldsR: 24 address: 129.
	self oriR: 24 data: 2.
	self stsR: 24 data: 129.
	self ldsR: 24 address: 129.
	self oriR: 24 data: 1.
	self stsR: 24 data: 129.
	self ldsR: 24 address: 128.
	self oriR: 24 data: 1.
	self stsR: 24 data: 128.
	self ldsR: 24 address: 177.
	self oriR: 24 data: 4.
	self stsR: 24 data: 177.
	self ldsR: 24 address: 176.
	self oriR: 24 data: 1.
	self stsR: 24 data: 176.
	self ldsR: 24 address: 122.
	self oriR: 24 data: 4.
	self stsR: 24 data: 122.
	self ldsR: 24 address: 122.
	self oriR: 24 data: 2.
	self stsR: 24 data: 122.
	self ldsR: 24 address: 122.
	self oriR: 24 data: 1.
	self stsR: 24 data: 122.
	self ldsR: 24 address: 122.
	self oriR: 24 data: 128.
	self stsR: 24 data: 122.
	self stsR: 1 data: 193.
	self ldiR: 22 data: 123.
	self ldiR: 23 data: 0.
	self ldiR: 24 data: 0.
	self ldiR: 25 data: 0.
	self call: 109.
	self ldiR: 28 data: 0.
	self ldiR: 29 data: 0.
	self ldiR: 22 data: 210.
	self ldiR: 23 data: 4.
	self ldiR: 24 data: 0.
	self ldiR: 25 data: 0.
	self call: 109.
	self sbiwR: 28 data: 0.
	self breq: -8.
	self call: 0.
	self rjmp: -11.
	self cli.
	self rjmp: -1
]

{ #category : 'samples' }
AvrArduinoNano >> sample3 [

	self jmp: 92.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 275.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self jmp: 110.
	self nop.
	self nop.
	self word: 36.
	self word: 39.
	self word: 42.
	self nop.
	self nop.
	self word: 37.
	self word: 40.
	self word: 43.
	self cpcDest: 0 source: 4.
	self cpcDest: 0 source: 4.
	self cpcDest: 0 source: 4.
	self cpcDest: 0 source: 4.
	self mulsDest: 16 source: 18.
	self mulsDest: 16 source: 18.
	self mulsDest: 16 source: 18.
	self mulsuDest: 16 source: 19.
	self mulsuDest: 16 source: 19.
	self mulsuDest: 16 source: 19.
	self mulsDest: 16 source: 17.
	self sbcDest: 0 source: 4.
	self andDest: 1 source: 0.
	self ldz: 4.
	self mulsDest: 16 source: 17.
	self sbcDest: 0 source: 4.
	self andDest: 1 source: 0.
	self mulsDest: 16 source: 17.
	self sbcDest: 0 source: 4.
	self andDest: 1 source: 0.
	self nop.
	self sbcDest: 0 source: 0.
	self mulsDest: 16 source: 16.
	self word: 1.
	self mulsuDest: 16 source: 16.
	self cpcDest: 16 source: 20.
	self nop.
	self nop.
	self nop.
	self nop.
	self eorDest: 1 source: 1.
	self out: 63 r: 1.
	self ldiR: 28 data: 255.
	self ldiR: 29 data: 8.
	self out: 62 r: 29.
	self out: 61 r: 28.
	self ldiR: 18 data: 1.
	self ldiR: 26 data: 0.
	self ldiR: 27 data: 1.
	self rjmp: 1.
	self stxInc: 1.
	self cpiR: 26 data: 9.
	self cpcDest: 27 source: 18.
	self brne: -4.
	self call: 349.
	self jmp: 460.
	self jmp: 0.
	self ldiR: 30 data: 177.
	self ldiR: 31 data: 0.
	self lpmz: 18.
	self ldiR: 30 data: 157.
	self ldiR: 31 data: 0.
	self lpmz: 25.
	self ldiR: 30 data: 137.
	self ldiR: 31 data: 0.
	self lpmz: 30.
	self andDest: 30 source: 30.
	self breq: 25.
	self andDest: 18 source: 18.
	self breq: 7.
	self cpiR: 18 data: 3.
	self breq: 32.
	self brcc: 21.
	self cpiR: 18 data: 1.
	self breq: 35.
	self cpiR: 18 data: 2.
	self breq: 37.
	self ldiR: 31 data: 0.
	self addDest: 30 source: 30.
	self adcDest: 31 source: 31.
	self subiR: 30 data: 142.
	self sbciR: 31 data: 255.
	self lpmzInc: 26.
	self lpmz: 27.
	self inR: 18 address: 63.
	self cli.
	self ldx: 30.
	self cpseDest: 24 source: 1.
	self rjmp: 38.
	self com: 25.
	self andDest: 25 source: 30.
	self stx: 25.
	self out: 63 r: 18.
	self ret.
	self cpiR: 18 data: 7.
	self breq: 21.
	self cpiR: 18 data: 8.
	self breq: 25.
	self cpiR: 18 data: 4.
	self brne: -23.
	self ldsR: 18 address: 128.
	self andiR: 18 data: 223.
	self rjmp: 3.
	self ldsR: 18 address: 128.
	self andiR: 18 data: 127.
	self stsR: 18 data: 128.
	self rjmp: -33.
	self inR: 18 address: 36.
	self andiR: 18 data: 127.
	self out: 36 r: 18.
	self rjmp: -37.
	self inR: 18 address: 36.
	self andiR: 18 data: 223.
	self rjmp: -5.
	self ldsR: 18 address: 176.
	self andiR: 18 data: 127.
	self stsR: 18 data: 176.
	self rjmp: -46.
	self ldsR: 18 address: 176.
	self andiR: 18 data: 223.
	self rjmp: -7.
	self orDest: 25 source: 30.
	self rjmp: -38.
	self inR: 19 address: 63.
	self cli.
	self ldsR: 24 address: 261.
	self ldsR: 25 address: 262.
	self ldsR: 26 address: 263.
	self ldsR: 27 address: 264.
	self inR: 18 address: 38.
	self sbisR: 21 data: 0.
	self rjmp: 5.
	self cpiR: 18 data: 255.
	self breq: 3.
	self adiwR: 24 data: 1.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self out: 63 r: 19.
	self movDest: 27 source: 26.
	self movDest: 26 source: 25.
	self movDest: 25 source: 24.
	self eorDest: 24 source: 24.
	self movwDest: 22 source: 24.
	self movwDest: 24 source: 26.
	self addDest: 22 source: 18.
	self adcDest: 23 source: 1.
	self adcDest: 24 source: 1.
	self adcDest: 25 source: 1.
	self ldiR: 20 data: 2.
	self addDest: 22 source: 22.
	self adcDest: 23 source: 23.
	self adcDest: 24 source: 24.
	self adcDest: 25 source: 25.
	self dec: 20.
	self brne: -6.
	self ret.
	self push: 8.
	self push: 9.
	self push: 10.
	self push: 11.
	self push: 12.
	self push: 13.
	self push: 14.
	self push: 15.
	self call: 184.
	self movwDest: 8 source: 22.
	self movwDest: 10 source: 24.
	self ldiR: 24 data: 232.
	self movDest: 12 source: 24.
	self ldiR: 24 data: 3.
	self movDest: 13 source: 24.
	self movDest: 14 source: 1.
	self movDest: 15 source: 1.
	self call: 184.
	self subDest: 22 source: 8.
	self sbcDest: 23 source: 9.
	self sbcDest: 24 source: 10.
	self sbcDest: 25 source: 11.
	self cpiR: 22 data: 232.
	self sbciR: 23 data: 3.
	self cpcDest: 24 source: 1.
	self cpcDest: 25 source: 1.
	self brcs: -11.
	self ldiR: 18 data: 1.
	self subDest: 12 source: 18.
	self sbcDest: 13 source: 1.
	self sbcDest: 14 source: 1.
	self sbcDest: 15 source: 1.
	self ldiR: 24 data: 232.
	self addDest: 8 source: 24.
	self ldiR: 24 data: 3.
	self adcDest: 9 source: 24.
	self adcDest: 10 source: 1.
	self adcDest: 11 source: 1.
	self cpDest: 12 source: 1.
	self cpcDest: 13 source: 1.
	self cpcDest: 14 source: 1.
	self cpcDest: 15 source: 1.
	self brne: -27.
	self pop: 15.
	self pop: 14.
	self pop: 13.
	self pop: 12.
	self pop: 11.
	self pop: 10.
	self pop: 9.
	self pop: 8.
	self ret.
	self push: 1.
	self push: 0.
	self inR: 0 address: 63.
	self push: 0.
	self eorDest: 1 source: 1.
	self push: 18.
	self push: 19.
	self push: 24.
	self push: 25.
	self push: 26.
	self push: 27.
	self ldsR: 24 address: 257.
	self ldsR: 25 address: 258.
	self ldsR: 26 address: 259.
	self ldsR: 27 address: 260.
	self ldsR: 19 address: 256.
	self ldiR: 18 data: 3.
	self addDest: 18 source: 19.
	self cpiR: 18 data: 125.
	self brcc: 43.
	self adiwR: 24 data: 1.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self stsR: 18 data: 256.
	self stsR: 24 data: 257.
	self stsR: 25 data: 258.
	self stsR: 26 data: 259.
	self stsR: 27 data: 260.
	self ldsR: 24 address: 261.
	self ldsR: 25 address: 262.
	self ldsR: 26 address: 263.
	self ldsR: 27 address: 264.
	self adiwR: 24 data: 1.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self stsR: 24 data: 261.
	self stsR: 25 data: 262.
	self stsR: 26 data: 263.
	self stsR: 27 data: 264.
	self pop: 27.
	self pop: 26.
	self pop: 25.
	self pop: 24.
	self pop: 19.
	self pop: 18.
	self pop: 0.
	self out: 63 r: 0.
	self pop: 0.
	self pop: 1.
	self reti.
	self ldiR: 18 data: 134.
	self addDest: 18 source: 19.
	self adiwR: 24 data: 2.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self rjmp: -46.
	self sei.
	self inR: 24 address: 36.
	self oriR: 24 data: 2.
	self out: 36 r: 24.
	self inR: 24 address: 36.
	self oriR: 24 data: 1.
	self out: 36 r: 24.
	self inR: 24 address: 37.
	self oriR: 24 data: 2.
	self out: 37 r: 24.
	self inR: 24 address: 37.
	self oriR: 24 data: 1.
	self out: 37 r: 24.
	self ldsR: 24 address: 110.
	self oriR: 24 data: 1.
	self stsR: 24 data: 110.
	self stsR: 1 data: 129.
	self ldsR: 24 address: 129.
	self oriR: 24 data: 2.
	self stsR: 24 data: 129.
	self ldsR: 24 address: 129.
	self oriR: 24 data: 1.
	self stsR: 24 data: 129.
	self ldsR: 24 address: 128.
	self oriR: 24 data: 1.
	self stsR: 24 data: 128.
	self ldsR: 24 address: 177.
	self oriR: 24 data: 4.
	self stsR: 24 data: 177.
	self ldsR: 24 address: 176.
	self oriR: 24 data: 1.
	self stsR: 24 data: 176.
	self ldsR: 24 address: 122.
	self oriR: 24 data: 4.
	self stsR: 24 data: 122.
	self ldsR: 24 address: 122.
	self oriR: 24 data: 2.
	self stsR: 24 data: 122.
	self ldsR: 24 address: 122.
	self oriR: 24 data: 1.
	self stsR: 24 data: 122.
	self ldsR: 24 address: 122.
	self oriR: 24 data: 128.
	self stsR: 24 data: 122.
	self stsR: 1 data: 193.
	self ldiR: 30 data: 157.
	self ldiR: 31 data: 0.
	self lpmz: 18.
	self ldiR: 30 data: 137.
	self ldiR: 31 data: 0.
	self lpmz: 24.
	self andDest: 24 source: 24.
	self breq: 19.
	self ldiR: 25 data: 0.
	self addDest: 24 source: 24.
	self adcDest: 25 source: 25.
	self movwDest: 30 source: 24.
	self subiR: 30 data: 152.
	self sbciR: 31 data: 255.
	self lpmzInc: 26.
	self lpmz: 27.
	self movwDest: 30 source: 24.
	self subiR: 30 data: 142.
	self sbciR: 31 data: 255.
	self lpmzInc: 24.
	self lpmz: 25.
	self inR: 24 address: 63.
	self cli.
	self ldx: 30.
	self orDest: 30 source: 18.
	self stx: 30.
	self out: 63 r: 24.
	self ldiR: 28 data: 0.
	self ldiR: 29 data: 0.
	self ldiR: 24 data: 1.
	self call: 112.
	self call: 221.
	self ldiR: 24 data: 0.
	self call: 112.
	self call: 221.
	self sbiwR: 28 data: 0.
	self breq: -12.
	self call: 0.
	self rjmp: -15.
	self cli.
	self rjmp: -1
]

{ #category : 'samples' }
AvrArduinoNano >> sample4 [
	"Blink no optimization"

	self jmp: 97.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 1089.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self jmp: 126.
	self nop.
	self nop.
	self word: 36.
	self word: 39.
	self word: 42.
	self nop.
	self nop.
	self word: 37.
	self word: 40.
	self word: 43.
	self nop.
	self nop.
	self word: 35.
	self word: 38.
	self word: 41.
	self cpcDest: 0 source: 4.
	self cpcDest: 0 source: 4.
	self cpcDest: 0 source: 4.
	self cpcDest: 0 source: 4.
	self mulsDest: 16 source: 18.
	self mulsDest: 16 source: 18.
	self mulsDest: 16 source: 18.
	self mulsuDest: 16 source: 19.
	self mulsuDest: 16 source: 19.
	self mulsuDest: 16 source: 19.
	self mulsDest: 16 source: 17.
	self sbcDest: 0 source: 4.
	self andDest: 1 source: 0.
	self ldz: 4.
	self mulsDest: 16 source: 17.
	self sbcDest: 0 source: 4.
	self andDest: 1 source: 0.
	self mulsDest: 16 source: 17.
	self sbcDest: 0 source: 4.
	self andDest: 1 source: 0.
	self nop.
	self sbcDest: 0 source: 0.
	self mulsDest: 16 source: 16.
	self word: 1.
	self mulsuDest: 16 source: 16.
	self cpcDest: 16 source: 20.
	self nop.
	self nop.
	self nop.
	self nop.
	self eorDest: 1 source: 1.
	self out: 63 r: 1.
	self ldiR: 28 data: 255.
	self ldiR: 29 data: 8.
	self out: 62 r: 29.
	self out: 61 r: 28.
	self ldiR: 17 data: 1.
	self ldiR: 26 data: 0.
	self ldiR: 27 data: 1.
	self ldiR: 30 data: 170.
	self ldiR: 31 data: 9.
	self rjmp: 2.
	self lpmzInc: 0.
	self stxInc: 0.
	self cpiR: 26 data: 0.
	self cpcDest: 27 source: 17.
	self brne: -5.
	self ldiR: 18 data: 1.
	self ldiR: 26 data: 0.
	self ldiR: 27 data: 1.
	self rjmp: 1.
	self stxInc: 1.
	self cpiR: 26 data: 9.
	self cpcDest: 27 source: 18.
	self brne: -4.
	self call: 1201.
	self jmp: 1235.
	self jmp: 0.
	self push: 28.
	self push: 29.
	self inR: 28 address: 61.
	self inR: 29 address: 62.
	self pop: 29.
	self pop: 28.
	self ret.
	self push: 28.
	self push: 29.
	self push: 1.
	self inR: 28 address: 61.
	self inR: 29 address: 62.
	self stdY: 1 r: 24.
	self lddR: 24 y: 1.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self cpiR: 24 data: 3.
	self cpcDest: 25 source: 1.
	self breq: 18.
	self cpiR: 24 data: 4.
	self cpcDest: 25 source: 1.
	self brge: 6.
	self cpiR: 24 data: 1.
	self cpcDest: 25 source: 1.
	self breq: 32.
	self sbiwR: 24 data: 2.
	self breq: 40.
	self rjmp: 68.
	self cpiR: 24 data: 7.
	self cpcDest: 25 source: 1.
	self breq: 46.
	self cpiR: 24 data: 8.
	self cpcDest: 25 source: 1.
	self breq: 53.
	self sbiwR: 24 data: 4.
	self breq: 11.
	self rjmp: 59.
	self ldiR: 24 data: 128.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 128.
	self ldiR: 25 data: 0.
	self andiR: 18 data: 127.
	self movwDest: 30 source: 24.
	self stz: 18.
	self rjmp: 49.
	self ldiR: 24 data: 128.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 128.
	self ldiR: 25 data: 0.
	self andiR: 18 data: 223.
	self movwDest: 30 source: 24.
	self stz: 18.
	self rjmp: 39.
	self ldiR: 24 data: 68.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 68.
	self ldiR: 25 data: 0.
	self andiR: 18 data: 127.
	self movwDest: 30 source: 24.
	self stz: 18.
	self rjmp: 29.
	self ldiR: 24 data: 68.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 68.
	self ldiR: 25 data: 0.
	self andiR: 18 data: 223.
	self movwDest: 30 source: 24.
	self stz: 18.
	self rjmp: 19.
	self ldiR: 24 data: 176.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 176.
	self ldiR: 25 data: 0.
	self andiR: 18 data: 127.
	self movwDest: 30 source: 24.
	self stz: 18.
	self rjmp: 9.
	self ldiR: 24 data: 176.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 176.
	self ldiR: 25 data: 0.
	self andiR: 18 data: 223.
	self movwDest: 30 source: 24.
	self stz: 18.
	self pop: 0.
	self pop: 29.
	self pop: 28.
	self ret.
	self push: 28.
	self push: 29.
	self inR: 28 address: 61.
	self inR: 29 address: 62.
	self sbiwR: 28 data: 17.
	self inR: 0 address: 63.
	self cli.
	self out: 62 r: 29.
	self out: 63 r: 0.
	self out: 61 r: 28.
	self stdY: 17 r: 24.
	self lddR: 24 y: 17.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self subiR: 24 data: 82.
	self sbciR: 25 data: 255.
	self stdY: 2 r: 25.
	self stdY: 1 r: 24.
	self lddR: 24 y: 1.
	self lddR: 25 y: 2.
	self movwDest: 30 source: 24.
	self lpmz: 24.
	self stdY: 3 r: 24.
	self lddR: 24 y: 3.
	self stdY: 4 r: 24.
	self lddR: 24 y: 17.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self subiR: 24 data: 102.
	self sbciR: 25 data: 255.
	self stdY: 6 r: 25.
	self stdY: 5 r: 24.
	self lddR: 24 y: 5.
	self lddR: 25 y: 6.
	self movwDest: 30 source: 24.
	self lpmz: 24.
	self stdY: 7 r: 24.
	self lddR: 24 y: 7.
	self stdY: 8 r: 24.
	self lddR: 24 y: 17.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self subiR: 24 data: 122.
	self sbciR: 25 data: 255.
	self stdY: 10 r: 25.
	self stdY: 9 r: 24.
	self lddR: 24 y: 9.
	self lddR: 25 y: 10.
	self movwDest: 30 source: 24.
	self lpmz: 24.
	self stdY: 11 r: 24.
	self lddR: 24 y: 11.
	self stdY: 12 r: 24.
	self lddR: 24 y: 12.
	self andDest: 24 source: 24.
	self brne: 3.
	self ldiR: 24 data: 0.
	self ldiR: 25 data: 0.
	self rjmp: 38.
	self lddR: 24 y: 4.
	self andDest: 24 source: 24.
	self breq: 3.
	self lddR: 24 y: 4.
	self call: 135.
	self lddR: 24 y: 12.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self addDest: 24 source: 24.
	self adcDest: 25 source: 25.
	self subiR: 24 data: 132.
	self sbciR: 25 data: 255.
	self stdY: 14 r: 25.
	self stdY: 13 r: 24.
	self lddR: 24 y: 13.
	self lddR: 25 y: 14.
	self movwDest: 30 source: 24.
	self lpmzInc: 18.
	self lpmz: 19.
	self movwDest: 24 source: 30.
	self stdY: 16 r: 19.
	self stdY: 15 r: 18.
	self stdY: 14 r: 25.
	self stdY: 13 r: 24.
	self lddR: 24 y: 15.
	self lddR: 25 y: 16.
	self movwDest: 30 source: 24.
	self ldz: 25.
	self lddR: 24 y: 8.
	self andDest: 24 source: 25.
	self andDest: 24 source: 24.
	self breq: 3.
	self ldiR: 24 data: 1.
	self ldiR: 25 data: 0.
	self rjmp: 2.
	self ldiR: 24 data: 0.
	self ldiR: 25 data: 0.
	self adiwR: 28 data: 17.
	self inR: 0 address: 63.
	self cli.
	self out: 62 r: 29.
	self out: 63 r: 0.
	self out: 61 r: 28.
	self pop: 29.
	self pop: 28.
	self ret.
	self push: 28.
	self push: 29.
	self inR: 28 address: 61.
	self inR: 29 address: 62.
	self sbiwR: 28 data: 21.
	self inR: 0 address: 63.
	self cli.
	self out: 62 r: 29.
	self out: 63 r: 0.
	self out: 61 r: 28.
	self stdY: 20 r: 24.
	self stdY: 21 r: 22.
	self lddR: 24 y: 20.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self subiR: 24 data: 82.
	self sbciR: 25 data: 255.
	self stdY: 2 r: 25.
	self stdY: 1 r: 24.
	self lddR: 24 y: 1.
	self lddR: 25 y: 2.
	self movwDest: 30 source: 24.
	self lpmz: 24.
	self stdY: 3 r: 24.
	self lddR: 24 y: 3.
	self stdY: 4 r: 24.
	self lddR: 24 y: 20.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self subiR: 24 data: 102.
	self sbciR: 25 data: 255.
	self stdY: 6 r: 25.
	self stdY: 5 r: 24.
	self lddR: 24 y: 5.
	self lddR: 25 y: 6.
	self movwDest: 30 source: 24.
	self lpmz: 24.
	self stdY: 7 r: 24.
	self lddR: 24 y: 7.
	self stdY: 8 r: 24.
	self lddR: 24 y: 20.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self subiR: 24 data: 122.
	self sbciR: 25 data: 255.
	self stdY: 10 r: 25.
	self stdY: 9 r: 24.
	self lddR: 24 y: 9.
	self lddR: 25 y: 10.
	self movwDest: 30 source: 24.
	self lpmz: 24.
	self stdY: 11 r: 24.
	self lddR: 24 y: 11.
	self stdY: 12 r: 24.
	self lddR: 24 y: 12.
	self andDest: 24 source: 24.
	self brne: 1.
	self rjmp: 68.
	self lddR: 24 y: 4.
	self andDest: 24 source: 24.
	self breq: 3.
	self lddR: 24 y: 4.
	self call: 135.
	self lddR: 24 y: 12.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self addDest: 24 source: 24.
	self adcDest: 25 source: 25.
	self subiR: 24 data: 142.
	self sbciR: 25 data: 255.
	self stdY: 14 r: 25.
	self stdY: 13 r: 24.
	self lddR: 24 y: 13.
	self lddR: 25 y: 14.
	self movwDest: 30 source: 24.
	self lpmzInc: 18.
	self lpmz: 19.
	self movwDest: 24 source: 30.
	self stdY: 16 r: 19.
	self stdY: 15 r: 18.
	self stdY: 14 r: 25.
	self stdY: 13 r: 24.
	self lddR: 24 y: 15.
	self lddR: 25 y: 16.
	self stdY: 18 r: 25.
	self stdY: 17 r: 24.
	self ldiR: 24 data: 95.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 24.
	self stdY: 19 r: 24.
	self cli.
	self lddR: 24 y: 21.
	self andDest: 24 source: 24.
	self brne: 14.
	self lddR: 24 y: 17.
	self lddR: 25 y: 18.
	self movwDest: 30 source: 24.
	self ldz: 24.
	self movDest: 25 source: 24.
	self lddR: 24 y: 8.
	self com: 24.
	self andDest: 24 source: 25.
	self movDest: 18 source: 24.
	self lddR: 24 y: 17.
	self lddR: 25 y: 18.
	self movwDest: 30 source: 24.
	self stz: 18.
	self rjmp: 11.
	self lddR: 24 y: 17.
	self lddR: 25 y: 18.
	self movwDest: 30 source: 24.
	self ldz: 25.
	self lddR: 24 y: 8.
	self movDest: 18 source: 25.
	self orDest: 18 source: 24.
	self lddR: 24 y: 17.
	self lddR: 25 y: 18.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 95.
	self ldiR: 25 data: 0.
	self lddR: 18 y: 19.
	self movwDest: 30 source: 24.
	self stz: 18.
	self adiwR: 28 data: 21.
	self inR: 0 address: 63.
	self cli.
	self out: 62 r: 29.
	self out: 63 r: 0.
	self out: 61 r: 28.
	self pop: 29.
	self pop: 28.
	self ret.
	self push: 28.
	self push: 29.
	self inR: 28 address: 61.
	self inR: 29 address: 62.
	self sbiwR: 28 data: 25.
	self inR: 0 address: 63.
	self cli.
	self out: 62 r: 29.
	self out: 63 r: 0.
	self out: 61 r: 28.
	self stdY: 24 r: 24.
	self stdY: 25 r: 22.
	self lddR: 24 y: 24.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self subiR: 24 data: 102.
	self sbciR: 25 data: 255.
	self stdY: 2 r: 25.
	self stdY: 1 r: 24.
	self lddR: 24 y: 1.
	self lddR: 25 y: 2.
	self movwDest: 30 source: 24.
	self lpmz: 24.
	self stdY: 3 r: 24.
	self lddR: 24 y: 3.
	self stdY: 4 r: 24.
	self lddR: 24 y: 24.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self subiR: 24 data: 122.
	self sbciR: 25 data: 255.
	self stdY: 6 r: 25.
	self stdY: 5 r: 24.
	self lddR: 24 y: 5.
	self lddR: 25 y: 6.
	self movwDest: 30 source: 24.
	self lpmz: 24.
	self stdY: 7 r: 24.
	self lddR: 24 y: 7.
	self stdY: 8 r: 24.
	self lddR: 24 y: 8.
	self andDest: 24 source: 24.
	self brne: 1.
	self rjmp: 148.
	self lddR: 24 y: 8.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self addDest: 24 source: 24.
	self adcDest: 25 source: 25.
	self subiR: 24 data: 152.
	self sbciR: 25 data: 255.
	self stdY: 10 r: 25.
	self stdY: 9 r: 24.
	self lddR: 24 y: 9.
	self lddR: 25 y: 10.
	self movwDest: 30 source: 24.
	self lpmzInc: 18.
	self lpmz: 19.
	self movwDest: 24 source: 30.
	self stdY: 12 r: 19.
	self stdY: 11 r: 18.
	self stdY: 10 r: 25.
	self stdY: 9 r: 24.
	self lddR: 24 y: 11.
	self lddR: 25 y: 12.
	self stdY: 14 r: 25.
	self stdY: 13 r: 24.
	self lddR: 24 y: 8.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self addDest: 24 source: 24.
	self adcDest: 25 source: 25.
	self subiR: 24 data: 142.
	self sbciR: 25 data: 255.
	self stdY: 16 r: 25.
	self stdY: 15 r: 24.
	self lddR: 24 y: 15.
	self lddR: 25 y: 16.
	self movwDest: 30 source: 24.
	self lpmzInc: 18.
	self lpmz: 19.
	self movwDest: 24 source: 30.
	self stdY: 18 r: 19.
	self stdY: 17 r: 18.
	self stdY: 16 r: 25.
	self stdY: 15 r: 24.
	self lddR: 24 y: 17.
	self lddR: 25 y: 18.
	self stdY: 20 r: 25.
	self stdY: 19 r: 24.
	self lddR: 24 y: 25.
	self andDest: 24 source: 24.
	self brne: 38.
	self ldiR: 24 data: 95.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 24.
	self stdY: 23 r: 24.
	self cli.
	self lddR: 24 y: 13.
	self lddR: 25 y: 14.
	self movwDest: 30 source: 24.
	self ldz: 24.
	self movDest: 25 source: 24.
	self lddR: 24 y: 4.
	self com: 24.
	self andDest: 24 source: 25.
	self movDest: 18 source: 24.
	self lddR: 24 y: 13.
	self lddR: 25 y: 14.
	self movwDest: 30 source: 24.
	self stz: 18.
	self lddR: 24 y: 19.
	self lddR: 25 y: 20.
	self movwDest: 30 source: 24.
	self ldz: 24.
	self movDest: 25 source: 24.
	self lddR: 24 y: 4.
	self com: 24.
	self andDest: 24 source: 25.
	self movDest: 18 source: 24.
	self lddR: 24 y: 19.
	self lddR: 25 y: 20.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 95.
	self ldiR: 25 data: 0.
	self lddR: 18 y: 23.
	self movwDest: 30 source: 24.
	self stz: 18.
	self rjmp: 61.
	self lddR: 24 y: 25.
	self cpiR: 24 data: 2.
	self brne: 36.
	self ldiR: 24 data: 95.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 24.
	self stdY: 22 r: 24.
	self cli.
	self lddR: 24 y: 13.
	self lddR: 25 y: 14.
	self movwDest: 30 source: 24.
	self ldz: 24.
	self movDest: 25 source: 24.
	self lddR: 24 y: 4.
	self com: 24.
	self andDest: 24 source: 25.
	self movDest: 18 source: 24.
	self lddR: 24 y: 13.
	self lddR: 25 y: 14.
	self movwDest: 30 source: 24.
	self stz: 18.
	self lddR: 24 y: 19.
	self lddR: 25 y: 20.
	self movwDest: 30 source: 24.
	self ldz: 25.
	self lddR: 24 y: 4.
	self movDest: 18 source: 25.
	self orDest: 18 source: 24.
	self lddR: 24 y: 19.
	self lddR: 25 y: 20.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 95.
	self ldiR: 25 data: 0.
	self lddR: 18 y: 22.
	self movwDest: 30 source: 24.
	self stz: 18.
	self rjmp: 22.
	self ldiR: 24 data: 95.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 24.
	self stdY: 21 r: 24.
	self cli.
	self lddR: 24 y: 13.
	self lddR: 25 y: 14.
	self movwDest: 30 source: 24.
	self ldz: 25.
	self lddR: 24 y: 4.
	self movDest: 18 source: 25.
	self orDest: 18 source: 24.
	self lddR: 24 y: 13.
	self lddR: 25 y: 14.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 95.
	self ldiR: 25 data: 0.
	self lddR: 18 y: 21.
	self movwDest: 30 source: 24.
	self stz: 18.
	self adiwR: 28 data: 25.
	self inR: 0 address: 63.
	self cli.
	self out: 62 r: 29.
	self out: 63 r: 0.
	self out: 61 r: 28.
	self pop: 29.
	self pop: 28.
	self ret.
	self push: 28.
	self push: 29.
	self inR: 28 address: 61.
	self inR: 29 address: 62.
	self sei.
	self ldiR: 24 data: 68.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 68.
	self ldiR: 25 data: 0.
	self oriR: 18 data: 2.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 68.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 68.
	self ldiR: 25 data: 0.
	self oriR: 18 data: 1.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 69.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 69.
	self ldiR: 25 data: 0.
	self oriR: 18 data: 2.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 69.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 69.
	self ldiR: 25 data: 0.
	self oriR: 18 data: 1.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 110.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 110.
	self ldiR: 25 data: 0.
	self oriR: 18 data: 1.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 129.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self stz: 1.
	self ldiR: 24 data: 129.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 129.
	self ldiR: 25 data: 0.
	self oriR: 18 data: 2.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 129.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 129.
	self ldiR: 25 data: 0.
	self oriR: 18 data: 1.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 128.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 128.
	self ldiR: 25 data: 0.
	self oriR: 18 data: 1.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 177.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 177.
	self ldiR: 25 data: 0.
	self oriR: 18 data: 4.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 176.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 176.
	self ldiR: 25 data: 0.
	self oriR: 18 data: 1.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 122.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 122.
	self ldiR: 25 data: 0.
	self oriR: 18 data: 4.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 122.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 122.
	self ldiR: 25 data: 0.
	self oriR: 18 data: 2.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 122.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 122.
	self ldiR: 25 data: 0.
	self oriR: 18 data: 1.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 122.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 18.
	self ldiR: 24 data: 122.
	self ldiR: 25 data: 0.
	self oriR: 18 data: 128.
	self movwDest: 30 source: 24.
	self stz: 18.
	self ldiR: 24 data: 193.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self stz: 1.
	self pop: 29.
	self pop: 28.
	self ret.
	self push: 28.
	self push: 29.
	self rcall: 0.
	self inR: 28 address: 61.
	self inR: 29 address: 62.
	self stdY: 2 r: 25.
	self stdY: 1 r: 24.
	self lddR: 24 y: 1.
	self lddR: 25 y: 2.
	self sbiwR: 24 data: 2.
	self brcs: 19.
	self lddR: 24 y: 1.
	self lddR: 25 y: 2.
	self addDest: 24 source: 24.
	self adcDest: 25 source: 25.
	self addDest: 24 source: 24.
	self adcDest: 25 source: 25.
	self stdY: 2 r: 25.
	self stdY: 1 r: 24.
	self lddR: 24 y: 1.
	self lddR: 25 y: 2.
	self sbiwR: 24 data: 5.
	self stdY: 2 r: 25.
	self stdY: 1 r: 24.
	self lddR: 24 y: 1.
	self lddR: 25 y: 2.
	self sbiwR: 24 data: 1.
	self brne: -2.
	self stdY: 2 r: 25.
	self stdY: 1 r: 24.
	self pop: 0.
	self pop: 0.
	self pop: 29.
	self pop: 28.
	self ret.
	self push: 28.
	self push: 29.
	self rcall: 0.
	self rcall: 0.
	self rcall: 0.
	self inR: 28 address: 61.
	self inR: 29 address: 62.
	self ldiR: 24 data: 95.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 24.
	self stdY: 5 r: 24.
	self cli.
	self ldsR: 24 address: 261.
	self ldsR: 25 address: 262.
	self ldsR: 26 address: 263.
	self ldsR: 27 address: 264.
	self stdY: 1 r: 24.
	self stdY: 2 r: 25.
	self stdY: 3 r: 26.
	self stdY: 4 r: 27.
	self ldiR: 24 data: 70.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 24.
	self stdY: 6 r: 24.
	self ldiR: 24 data: 53.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 24.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self andiR: 24 data: 1.
	self eorDest: 25 source: 25.
	self orDest: 24 source: 25.
	self breq: 14.
	self lddR: 24 y: 6.
	self cpiR: 24 data: 255.
	self breq: 11.
	self lddR: 24 y: 1.
	self lddR: 25 y: 2.
	self lddR: 26 y: 3.
	self lddR: 27 y: 4.
	self adiwR: 24 data: 1.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self stdY: 1 r: 24.
	self stdY: 2 r: 25.
	self stdY: 3 r: 26.
	self stdY: 4 r: 27.
	self ldiR: 24 data: 95.
	self ldiR: 25 data: 0.
	self lddR: 18 y: 5.
	self movwDest: 30 source: 24.
	self stz: 18.
	self lddR: 24 y: 1.
	self lddR: 25 y: 2.
	self lddR: 26 y: 3.
	self lddR: 27 y: 4.
	self eorDest: 18 source: 18.
	self movDest: 19 source: 24.
	self movDest: 20 source: 25.
	self movDest: 21 source: 26.
	self lddR: 24 y: 6.
	self movDest: 24 source: 24.
	self ldiR: 25 data: 0.
	self ldiR: 26 data: 0.
	self ldiR: 27 data: 0.
	self addDest: 24 source: 18.
	self adcDest: 25 source: 19.
	self adcDest: 26 source: 20.
	self adcDest: 27 source: 21.
	self addDest: 24 source: 24.
	self adcDest: 25 source: 25.
	self adcDest: 26 source: 26.
	self adcDest: 27 source: 27.
	self addDest: 24 source: 24.
	self adcDest: 25 source: 25.
	self adcDest: 26 source: 26.
	self adcDest: 27 source: 27.
	self movwDest: 22 source: 24.
	self movwDest: 24 source: 26.
	self adiwR: 28 data: 6.
	self inR: 0 address: 63.
	self cli.
	self out: 62 r: 29.
	self out: 63 r: 0.
	self out: 61 r: 28.
	self pop: 29.
	self pop: 28.
	self ret.
	self push: 14.
	self push: 15.
	self push: 16.
	self push: 17.
	self push: 28.
	self push: 29.
	self inR: 28 address: 61.
	self inR: 29 address: 62.
	self sbiwR: 28 data: 8.
	self inR: 0 address: 63.
	self cli.
	self out: 62 r: 29.
	self out: 63 r: 0.
	self out: 61 r: 28.
	self stdY: 5 r: 22.
	self stdY: 6 r: 23.
	self stdY: 7 r: 24.
	self stdY: 8 r: 25.
	self call: 847.
	self movwDest: 26 source: 24.
	self movwDest: 24 source: 22.
	self stdY: 1 r: 24.
	self stdY: 2 r: 25.
	self stdY: 3 r: 26.
	self stdY: 4 r: 27.
	self rjmp: 55.
	self call: 128.
	self rjmp: 23.
	self lddR: 24 y: 5.
	self lddR: 25 y: 6.
	self lddR: 26 y: 7.
	self lddR: 27 y: 8.
	self sbiwR: 24 data: 1.
	self sbcDest: 26 source: 1.
	self sbcDest: 27 source: 1.
	self stdY: 5 r: 24.
	self stdY: 6 r: 25.
	self stdY: 7 r: 26.
	self stdY: 8 r: 27.
	self lddR: 24 y: 1.
	self lddR: 25 y: 2.
	self lddR: 26 y: 3.
	self lddR: 27 y: 4.
	self subiR: 24 data: 24.
	self sbciR: 25 data: 252.
	self sbciR: 26 data: 255.
	self sbciR: 27 data: 255.
	self stdY: 1 r: 24.
	self stdY: 2 r: 25.
	self stdY: 3 r: 26.
	self stdY: 4 r: 27.
	self lddR: 24 y: 5.
	self lddR: 25 y: 6.
	self lddR: 26 y: 7.
	self lddR: 27 y: 8.
	self orDest: 24 source: 25.
	self orDest: 24 source: 26.
	self orDest: 24 source: 27.
	self breq: 21.
	self call: 847.
	self movwDest: 18 source: 22.
	self movwDest: 20 source: 24.
	self lddR: 24 y: 1.
	self lddR: 25 y: 2.
	self lddR: 26 y: 3.
	self lddR: 27 y: 4.
	self movwDest: 14 source: 18.
	self movwDest: 16 source: 20.
	self subDest: 14 source: 24.
	self sbcDest: 15 source: 25.
	self sbcDest: 16 source: 26.
	self sbcDest: 17 source: 27.
	self movwDest: 26 source: 16.
	self movwDest: 24 source: 14.
	self cpiR: 24 data: 232.
	self sbciR: 25 data: 3.
	self cpcDest: 26 source: 1.
	self cpcDest: 27 source: 1.
	self brcc: -52.
	self lddR: 24 y: 5.
	self lddR: 25 y: 6.
	self lddR: 26 y: 7.
	self lddR: 27 y: 8.
	self orDest: 24 source: 25.
	self orDest: 24 source: 26.
	self orDest: 24 source: 27.
	self brne: -63.
	self adiwR: 28 data: 8.
	self inR: 0 address: 63.
	self cli.
	self out: 62 r: 29.
	self out: 63 r: 0.
	self out: 61 r: 28.
	self pop: 29.
	self pop: 28.
	self pop: 17.
	self pop: 16.
	self pop: 15.
	self pop: 14.
	self ret.
	self push: 28.
	self push: 29.
	self rcall: 0.
	self rcall: 0.
	self push: 1.
	self inR: 28 address: 61.
	self inR: 29 address: 62.
	self ldiR: 24 data: 95.
	self ldiR: 25 data: 0.
	self movwDest: 30 source: 24.
	self ldz: 24.
	self stdY: 1 r: 24.
	self cli.
	self ldsR: 24 address: 257.
	self ldsR: 25 address: 258.
	self ldsR: 26 address: 259.
	self ldsR: 27 address: 260.
	self stdY: 2 r: 24.
	self stdY: 3 r: 25.
	self stdY: 4 r: 26.
	self stdY: 5 r: 27.
	self ldiR: 24 data: 95.
	self ldiR: 25 data: 0.
	self lddR: 18 y: 1.
	self movwDest: 30 source: 24.
	self stz: 18.
	self lddR: 24 y: 2.
	self lddR: 25 y: 3.
	self lddR: 26 y: 4.
	self lddR: 27 y: 5.
	self movwDest: 22 source: 24.
	self movwDest: 24 source: 26.
	self pop: 0.
	self pop: 0.
	self pop: 0.
	self pop: 0.
	self pop: 0.
	self pop: 29.
	self pop: 28.
	self ret.
	self push: 1.
	self push: 0.
	self inR: 0 address: 63.
	self push: 0.
	self eorDest: 1 source: 1.
	self push: 24.
	self push: 25.
	self push: 26.
	self push: 27.
	self push: 28.
	self push: 29.
	self inR: 28 address: 61.
	self inR: 29 address: 62.
	self sbiwR: 28 data: 5.
	self out: 62 r: 29.
	self out: 61 r: 28.
	self ldsR: 24 address: 257.
	self ldsR: 25 address: 258.
	self ldsR: 26 address: 259.
	self ldsR: 27 address: 260.
	self stdY: 1 r: 24.
	self stdY: 2 r: 25.
	self stdY: 3 r: 26.
	self stdY: 4 r: 27.
	self ldsR: 24 address: 256.
	self stdY: 5 r: 24.
	self lddR: 24 y: 1.
	self lddR: 25 y: 2.
	self lddR: 26 y: 3.
	self lddR: 27 y: 4.
	self adiwR: 24 data: 1.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self stdY: 1 r: 24.
	self stdY: 2 r: 25.
	self stdY: 3 r: 26.
	self stdY: 4 r: 27.
	self lddR: 24 y: 5.
	self subiR: 24 data: 253.
	self stdY: 5 r: 24.
	self lddR: 24 y: 5.
	self cpiR: 24 data: 125.
	self brcs: 14.
	self lddR: 24 y: 5.
	self subiR: 24 data: 125.
	self stdY: 5 r: 24.
	self lddR: 24 y: 1.
	self lddR: 25 y: 2.
	self lddR: 26 y: 3.
	self lddR: 27 y: 4.
	self adiwR: 24 data: 1.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self stdY: 1 r: 24.
	self stdY: 2 r: 25.
	self stdY: 3 r: 26.
	self stdY: 4 r: 27.
	self lddR: 24 y: 5.
	self stsR: 24 data: 256.
	self lddR: 24 y: 1.
	self lddR: 25 y: 2.
	self lddR: 26 y: 3.
	self lddR: 27 y: 4.
	self stsR: 24 data: 257.
	self stsR: 25 data: 258.
	self stsR: 26 data: 259.
	self stsR: 27 data: 260.
	self ldsR: 24 address: 261.
	self ldsR: 25 address: 262.
	self ldsR: 26 address: 263.
	self ldsR: 27 address: 264.
	self adiwR: 24 data: 1.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self stsR: 24 data: 261.
	self stsR: 25 data: 262.
	self stsR: 26 data: 263.
	self stsR: 27 data: 264.
	self pop: 0.
	self pop: 0.
	self pop: 0.
	self pop: 0.
	self pop: 0.
	self pop: 29.
	self pop: 28.
	self pop: 27.
	self pop: 26.
	self pop: 25.
	self pop: 24.
	self pop: 0.
	self out: 63 r: 0.
	self pop: 0.
	self pop: 1.
	self reti.
	self call: 670.
	self ldiR: 22 data: 1.
	self ldiR: 24 data: 13.
	self call: 469.
	self ldiR: 16 data: 0.
	self ldiR: 17 data: 0.
	self ldiR: 22 data: 1.
	self ldiR: 24 data: 13.
	self call: 334.
	self ldiR: 22 data: 232.
	self ldiR: 23 data: 3.
	self ldiR: 24 data: 0.
	self ldiR: 25 data: 0.
	self call: 942.
	self ldiR: 22 data: 0.
	self ldiR: 24 data: 13.
	self call: 334.
	self ldiR: 22 data: 232.
	self ldiR: 23 data: 3.
	self ldiR: 24 data: 0.
	self ldiR: 25 data: 0.
	self call: 942.
	self cpDest: 16 source: 1.
	self cpcDest: 17 source: 1.
	self breq: -23.
	self call: 0.
	self rjmp: -26.
	self cli.
	self rjmp: -1
]

{ #category : 'private' }
AvrArduinoNano >> setVectors [

	self jmp: #boot.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #timer1Int.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset.
	self jmp: #softReset
]

{ #category : 'private' }
AvrArduinoNano >> softReset [

	self jmp: 0
]

{ #category : 'private' }
AvrArduinoNano >> timer1Int [

	self push: 1.
	self push: 0.
	self inR: 0 address: 63.
	self push: 0.
	self eorDest: 1 source: 1.
	self push: 18.
	self push: 19.
	self push: 24.
	self push: 25.
	self push: 26.
	self push: 27.
	self ldsR: 24 address: 261.
	self ldsR: 25 address: 262.
	self ldsR: 26 address: 263.
	self ldsR: 27 address: 264.
	self ldsR: 19 address: 260.
	self ldiR: 18 data: 3.
	self addDest: 18 source: 19.
	self cpiR: 18 data: 125.
	self brcc: 'timer1IntLabel2'.
	self adiwR: 24 data: 1.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self label: 'timer1IntLabel1'.
	self stsR: 18 data: 260.
	self stsR: 24 data: 261.
	self stsR: 25 data: 262.
	self stsR: 26 data: 263.
	self stsR: 27 data: 264.
	self ldsR: 24 address: 256.
	self ldsR: 25 address: 257.
	self ldsR: 26 address: 258.
	self ldsR: 27 address: 259.
	self adiwR: 24 data: 1.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self stsR: 24 data: 256.
	self stsR: 25 data: 257.
	self stsR: 26 data: 258.
	self stsR: 27 data: 259.
	self pop: 27.
	self pop: 26.
	self pop: 25.
	self pop: 24.
	self pop: 19.
	self pop: 18.
	self pop: 0.
	self out: 63 r: 0.
	self pop: 0.
	self pop: 1.
	self reti.
	self label: 'timer1IntLabel2'.
	self ldiR: 18 data: 134.
	self addDest: 18 source: 19.
	self adiwR: 24 data: 2.
	self adcDest: 26 source: 1.
	self adcDest: 27 source: 1.
	self rjmp: 'timer1IntLabel1'
]
