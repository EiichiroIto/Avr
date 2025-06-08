Class {
	#name : 'AvrArduinoNano',
	#superclass : 'AvrArduino',
	#instVars : [
		'digitalPins'
	],
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'api' }
AvrArduinoNano >> all [

	self subclassResponsibility
]

{ #category : 'programs' }
AvrArduinoNano >> boot [

	self subclassResponsibility
]

{ #category : 'constants' }
AvrArduinoNano >> ddrB [

	^ 16r04
]

{ #category : 'constants' }
AvrArduinoNano >> ddrC [

	^ 16r07
]

{ #category : 'constants' }
AvrArduinoNano >> ddrD [

	^ 16r0A
]

{ #category : 'macros' }
AvrArduinoNano >> digitalPin: anInteger mode: anInteger2 [

	| pair pin bit |
	pair := digitalPins at: anInteger + 1.
	pin := pair first.
	bit := pair second.
	anInteger2 = 1 ifTrue: [
		asm sbi: pin + 1 bit: bit.
		asm cbi: pin + 2 bit: bit.
		^ self ].
	anInteger2 = 2 ifTrue: [
		asm cbi: pin + 1 bit: bit.
		asm sbi: pin + 2 bit: bit.
		^ self ].
	asm cbi: pin + 1 bit: bit.
	asm cbi: pin + 2 bit: bit
]

{ #category : 'accessing' }
AvrArduinoNano >> digitalPins [

	^ digitalPins
]

{ #category : 'accessing' }
AvrArduinoNano >> digitalPins: anObject [

	digitalPins := anObject
]

{ #category : 'macros' }
AvrArduinoNano >> digitalRead: anInteger register: anInteger2 [

	| pair pin bit |
	pair := digitalPins at: anInteger + 1.
	pin := pair first.
	bit := pair second.
	asm inR: anInteger2 address: pin.
	asm andiR: anInteger2 data: 1 << bit
]

{ #category : 'macros' }
AvrArduinoNano >> digitalWrite: anInteger boolean: aBoolean [

	| pair pin bit |
	pair := digitalPins at: anInteger + 1.
	pin := pair first.
	bit := pair second.
	aBoolean ifTrue: [
		asm sbi: pin + 2 bit: bit.
		^ self ].
	asm cbi: pin + 2 bit: bit
]

{ #category : 'macros' }
AvrArduinoNano >> digitalWrite: anInteger register: anInteger2 [

	| pair pin bit label1 label2 |
	pair := digitalPins at: anInteger + 1.
	pin := pair first.
	bit := pair second.
	asm andDest: anInteger2 source: anInteger2.
	label1 := self nextLabel.
	asm breq: label1.
	asm sbi: pin + 2 bit: bit.
	label2 := self nextLabel.
	asm rjmp: label2.
	asm label: label1.
	asm cbi: pin + 2 bit: bit.
	asm label: label2
]

{ #category : 'macros' }
AvrArduinoNano >> endlessLoop [

	asm cli.
	asm rjmp: -1
]

{ #category : 'initialization' }
AvrArduinoNano >> initialize [

	super initialize.
	self setupDigitalPins
]

{ #category : 'macros' }
AvrArduinoNano >> label: aString [

	asm label: aString
]

{ #category : 'programs' }
AvrArduinoNano >> loop [

	self subclassResponsibility
]

{ #category : 'constants' }
AvrArduinoNano >> mcucr [

	^ 16r35
]

{ #category : 'accessing' }
AvrArduinoNano >> nextLabel [

	^ asm labeler nextLabel
]

{ #category : 'constants' }
AvrArduinoNano >> pinB [

	^ 16r03
]

{ #category : 'constants' }
AvrArduinoNano >> pinC [

	^ 16r06
]

{ #category : 'constants' }
AvrArduinoNano >> pinD [

	^ 16r09
]

{ #category : 'constants' }
AvrArduinoNano >> portB [

	^ 16r05
]

{ #category : 'constants' }
AvrArduinoNano >> portC [

	^ 16r08
]

{ #category : 'constants' }
AvrArduinoNano >> portD [

	^ 16r0B
]

{ #category : 'programs' }
AvrArduinoNano >> setVectors [

	self subclassResponsibility
]

{ #category : 'programs' }
AvrArduinoNano >> setup [

	self subclassResponsibility
]

{ #category : 'private' }
AvrArduinoNano >> setupDigitalPins [

	digitalPins := Array new: 14.
	digitalPins at: 1 put: (Array with: self pinD with: 0).
	digitalPins at: 2 put: (Array with: self pinD with: 1).
	digitalPins at: 3 put: (Array with: self pinD with: 2).
	digitalPins at: 4 put: (Array with: self pinD with: 3).
	digitalPins at: 5 put: (Array with: self pinD with: 4).
	digitalPins at: 6 put: (Array with: self pinD with: 5).
	digitalPins at: 7 put: (Array with: self pinD with: 6).
	digitalPins at: 8 put: (Array with: self pinD with: 7).
	digitalPins at: 9 put: (Array with: self pinB with: 0).
	digitalPins at: 10 put: (Array with: self pinB with: 1).
	digitalPins at: 11 put: (Array with: self pinB with: 2).
	digitalPins at: 12 put: (Array with: self pinB with: 3).
	digitalPins at: 13 put: (Array with: self pinB with: 4).
	digitalPins at: 14 put: (Array with: self pinB with: 5)
]

{ #category : 'macros' }
AvrArduinoNano >> softReset [

	asm jmp: 0
]

{ #category : 'constants' }
AvrArduinoNano >> sph [

	^ 16r3E
]

{ #category : 'constants' }
AvrArduinoNano >> spl [

	^ 16r3D
]

{ #category : 'constants' }
AvrArduinoNano >> sreg [

	^ 16r3F
]

{ #category : 'macros' }
AvrArduinoNano >> togglePin: anInteger [

	| pair pin bit |
	pair := digitalPins at: anInteger + 1.
	pin := pair first.
	bit := pair second.
	asm sbi: pin bit: bit
]

{ #category : 'constants' }
AvrArduinoNano >> xh [

	^ 27
]

{ #category : 'constants' }
AvrArduinoNano >> xl [

	^ 26
]

{ #category : 'constants' }
AvrArduinoNano >> yh [

	^ 29
]

{ #category : 'constants' }
AvrArduinoNano >> yl [

	^ 28
]

{ #category : 'constants' }
AvrArduinoNano >> zh [

	^ 31
]

{ #category : 'constants' }
AvrArduinoNano >> zl [

	^ 30
]
