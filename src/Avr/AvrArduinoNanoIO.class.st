Class {
	#name : 'AvrArduinoNanoIO',
	#superclass : 'AvrArduinoIO',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> ddrB [

	^ self label: #ddrB port: 16r04
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> ddrC [

	^ self label: #ddrC port: 16r07
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> ddrD [

	^ self label: #ddrD port: 16r0A
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> mcucr [

	^ self label: #mcucr port: 16r35
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> ocr0a [

	^ self label: #ocr0a port: 16r27
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> ocr0b [

	^ self label: #ocr0b port: 16r28
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> pinB [

	^ self label: #pinB port: 16r03
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> pinC [

	^ self label: #pinC port: 16r06
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> pinD [

	^ self label: #pinD port: 16r09
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> portB [

	^ self label: #portB port: 16r05
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> portC [

	^ self label: #portC port: 16r08
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> portD [

	^ self label: #portD port: 16r0B
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> sph [

	^ self label: #sph port: 16r3E
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> spl [

	^ self label: #spl port: 16r3D
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> sreg [

	^ self label: #sreg port: 16r3F
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> tccr0a [

	^ self label: #tccr0a port: 16r24
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> tccr0b [

	^ self label: #tccr0b port: 16r25
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> tcnt0 [

	^ self label: #tcnt0 port: 16r26
]

{ #category : 'instance creation' }
AvrArduinoNanoIO class >> tifr0 [

	^ self label: #tifr0 port: 16r15
]
