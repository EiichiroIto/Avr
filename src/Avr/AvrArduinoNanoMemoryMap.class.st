Class {
	#name : 'AvrArduinoNanoMemoryMap',
	#superclass : 'AvrMemoryMap',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> adch [

	^ self label: #adch address: 16r79
]

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> adcl [

	^ self label: #adcl address: 16r78
]

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> adcsra [

	^ self label: #adcsra address: 16r7A
]

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> adcsrb [

	^ self label: #adcsrb address: 16r7B
]

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> admux [

	^ self label: #admux address: 16r7C
]

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> prr [

	^ self label: #prr address: 16r64
]

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> ramEnd [

	^ self label: #ramEnd address: 16r08FF
]

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> ramTop [

	^ self label: #ramTop address: 16r0100
]

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> timsk0 [

	^ self label: #timsk0 address: 16r6E
]

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> ubrr0h [

	^ self label: #ubrr0h address: 16rC5
]

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> ubrr0l [

	^ self label: #ubrr0l address: 16rC4
]

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> ucsr0a [

	^ self label: #ucsr0a address: 16rC0
]

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> ucsr0b [

	^ self label: #ucsr0b address: 16rC1
]

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> ucsr0c [

	^ self label: #ucsr0c address: 16rC2
]

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMap >> udr0 [

	^ self label: #udr0 address: 16rC6
]
