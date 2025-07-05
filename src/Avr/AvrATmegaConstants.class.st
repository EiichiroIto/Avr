Class {
	#name : 'AvrATmegaConstants',
	#superclass : 'Object',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'adc' }
AvrATmegaConstants >> adcStartConversion [

	^ 2r01000000
]

{ #category : 'adc' }
AvrATmegaConstants >> adcsraDefault [

	^ 2r10000111
]

{ #category : 'adc' }
AvrATmegaConstants >> admuxDefault [

	^ 16r40
]

{ #category : 'defaults' }
AvrATmegaConstants >> defaultCounterAddress [

	^ 16r0100
]

{ #category : 'serial' }
AvrATmegaConstants >> fosc [

	^ 16000000
]

{ #category : 'defaults' }
AvrATmegaConstants >> ramSize [

	^ 16r900
]

{ #category : 'serial' }
AvrATmegaConstants >> serialData8 [

	^ 16r06
]

{ #category : 'serial' }
AvrATmegaConstants >> serialDataRegisterEmpty [

	^ 16r20
]

{ #category : 'serial' }
AvrATmegaConstants >> serialReceiveComplete [

	^ 16r80
]

{ #category : 'serial' }
AvrATmegaConstants >> serialTransmitComplete [

	^ 16r40
]

{ #category : 'serial' }
AvrATmegaConstants >> serialTxRxEnable [

	^ 16r18
]

{ #category : 'register' }
AvrATmegaConstants >> xRegisters [

	^ {
		  self xl.
		  self xh }
]

{ #category : 'register' }
AvrATmegaConstants >> xh [

	^ 27
]

{ #category : 'register' }
AvrATmegaConstants >> xl [

	^ 26
]

{ #category : 'register' }
AvrATmegaConstants >> yRegisters [

	^ {
		  self yl.
		  self yh }
]

{ #category : 'register' }
AvrATmegaConstants >> yh [

	^ 29
]

{ #category : 'register' }
AvrATmegaConstants >> yl [

	^ 28
]

{ #category : 'register' }
AvrATmegaConstants >> zRegisters [

	^ {
		  self zl.
		  self zh }
]

{ #category : 'register' }
AvrATmegaConstants >> zh [

	^ 31
]

{ #category : 'register' }
AvrATmegaConstants >> zl [

	^ 30
]
