Class {
	#name : 'AvrArduinoNanoIOMap',
	#superclass : 'AvrIOMap',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> ddrB [

	^ self label: #ddrB port: 16r04
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> ddrC [

	^ self label: #ddrC port: 16r07
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> ddrD [

	^ self label: #ddrD port: 16r0A
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> mcucr [

	^ self label: #mcucr port: 16r35
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> ocr0a [

	^ self label: #ocr0a port: 16r27
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> ocr0b [

	^ self label: #ocr0b port: 16r28
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> pinB [

	^ self label: #pinB port: 16r03
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> pinC [

	^ self label: #pinC port: 16r06
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> pinD [

	^ self label: #pinD port: 16r09
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> portB [

	^ self label: #portB port: 16r05
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> portC [

	^ self label: #portC port: 16r08
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> portD [

	^ self label: #portD port: 16r0B
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> sph [

	^ self label: #sph port: 16r3E
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> spl [

	^ self label: #spl port: 16r3D
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> sreg [

	^ self label: #sreg port: 16r3F
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> tccr0a [

	^ self label: #tccr0a port: 16r24
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> tccr0b [

	^ self label: #tccr0b port: 16r25
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> tcnt0 [

	^ self label: #tcnt0 port: 16r26
]

{ #category : 'instance creation' }
AvrArduinoNanoIOMap >> tifr0 [

	^ self label: #tifr0 port: 16r15
]
