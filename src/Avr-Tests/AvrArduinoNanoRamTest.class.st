"
An AvrArduinoNanoRamTest is a test class for testing the behavior of AvrArduinoNanoRam
"
Class {
	#name : 'AvrArduinoNanoRamTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'accessing' }
AvrArduinoNanoRamTest >> targetClass [

	^ AvrArduinoNanoRam
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testAdch [

	| obj |
	obj := self targetClass adch.
	self assert: obj label equals: #adch.
	self assert: obj address equals: self targetClass adcl address + 1
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testAdcl [

	| obj |
	obj := self targetClass adcl.
	self assert: obj label equals: #adcl.
	self assert: obj address equals: 16r78
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testAdcsra [

	| obj |
	obj := self targetClass adcsra.
	self assert: obj label equals: #adcsra.
	self assert: obj address equals: 16r7A
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testAdmux [

	| obj |
	obj := self targetClass admux.
	self assert: obj label equals: #admux.
	self assert: obj address equals: 16r7C
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testAdmuxHigh [

	| obj |
	obj := self targetClass admuxHigh.
	self assert: obj label equals: #admuxHigh .
	self assert: obj address equals: 16r40
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testAdmuxMask [

	| obj |
	obj := self targetClass admuxMask.
	self assert: obj label equals: #admuxMask.
	self assert: obj address equals: 16r0F
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testPrr [

	| obj |
	obj := self targetClass prr.
	self assert: obj label equals: #prr.
	self assert: obj address equals: 16r64
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testRamEnd [

	| obj |
	obj := self targetClass ramEnd.
	self assert: obj label equals: #ramEnd.
	self assert: obj address equals: 16r8FF
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testRamEndHigh [

	| obj |
	obj := self targetClass ramEndHigh.
	self assert: obj label equals: #ramEndHigh.
	self assert: obj address equals: 16r08
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testRamEndLow [

	| obj |
	obj := self targetClass ramEndLow.
	self assert: obj label equals: #ramEndLow.
	self assert: obj address equals: 16rFF
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testTimsk0 [

	| obj |
	obj := self targetClass timsk0.
	self assert: obj label equals: #timsk0.
	self assert: obj address equals: 16r6E
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testUbrr0h [

	| obj |
	obj := self targetClass ubrr0h.
	self assert: obj label equals: #ubrr0h.
	self assert: obj address equals: 16rC5
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testUbrr0l [

	| obj |
	obj := self targetClass ubrr0l.
	self assert: obj label equals: #ubrr0l.
	self assert: obj address equals: 16rC4
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testUcsr0a [

	| obj |
	obj := self targetClass ucsr0a.
	self assert: obj label equals: #ucsr0a.
	self assert: obj address equals: 16rC0
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testUcsr0b [

	| obj |
	obj := self targetClass ucsr0b.
	self assert: obj label equals: #ucsr0b.
	self assert: obj address equals: 16rC1
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testUcsr0c [

	| obj |
	obj := self targetClass ucsr0c.
	self assert: obj label equals: #ucsr0c.
	self assert: obj address equals: 16rC2
]

{ #category : 'tests' }
AvrArduinoNanoRamTest >> testUdr0 [

	| obj |
	obj := self targetClass udr0.
	self assert: obj label equals: #udr0.
	self assert: obj address equals: 16rC6
]
