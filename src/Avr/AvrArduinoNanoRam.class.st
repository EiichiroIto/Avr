Class {
	#name : 'AvrArduinoNanoRam',
	#superclass : 'AvrArduinoRam',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> adch [

	^ self label: #adch address: 16r79
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> adcl [

	^ self label: #adcl address: 16r78
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> adcsra [

	^ self label: #adcsra address: 16r7A
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> adcsrb [

	^ self label: #adcsrb address: 16r7B
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> admux [

	^ self label: #admux address: 16r7C
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> prr [

	^ self label: #prr address: 16r64
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> ramEnd [

	^ self label: #ramEnd address: 16r8FF
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> ramEndHigh [

	^ self label: #ramEndHigh address: 16r08
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> ramEndLow [

	^ self label: #ramEndLow address: 16rFF
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> timsk0 [

	^ self label: #timsk0 address: 16r6E
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> ubrr0h [

	^ self label: #ubrr0h address: 16rC5
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> ubrr0l [

	^ self label: #ubrr0l address: 16rC4
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> ucsr0a [

	^ self label: #ucsr0a address: 16rC0
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> ucsr0b [

	^ self label: #ucsr0b address: 16rC1
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> ucsr0c [

	^ self label: #ucsr0c address: 16rC2
]

{ #category : 'instance creation' }
AvrArduinoNanoRam class >> udr0 [

	^ self label: #udr0 address: 16rC6
]
