"
An AvrArduinoNanoIOTest is a test class for testing the behavior of AvrArduinoNanoIO
"
Class {
	#name : 'AvrArduinoNanoIOMapTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrArduinoNanoIOMapTest >> newObj [

	^ AvrArduinoNanoIOMap new
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testDdrB [

	| obj |
	obj := self newObj ddrB.
	self assert: obj label equals: #ddrB.
	self assert: obj port equals: self newObj pinB port + 1
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testDdrC [

	| obj |
	obj := self newObj ddrC.
	self assert: obj label equals: #ddrC.
	self assert: obj port equals: self newObj pinC port + 1
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testDdrD [

	| obj |
	obj := self newObj ddrD.
	self assert: obj label equals: #ddrD.
	self assert: obj port equals: self newObj pinD port + 1
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testMcucr [

	| obj |
	obj := self newObj mcucr.
	self assert: obj label equals: #mcucr.
	self assert: obj port equals: 16r35
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testOcr0a [

	| obj |
	obj := self newObj ocr0a.
	self assert: obj label equals: #ocr0a.
	self assert: obj port equals: 16r27
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testOcr0b [


	| obj |
	obj := self newObj ocr0b.
	self assert: obj label equals: #ocr0b.
	self assert: obj port equals: 16r28
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testPinB [


	| obj |
	obj := self newObj pinB.
	self assert: obj label equals: #pinB.
	self assert: obj port equals: 3
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testPinC [

	| obj |
	obj := self newObj pinC.
	self assert: obj label equals: #pinC.
	self assert: obj port equals: 6
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testPinD [

	| obj |
	obj := self newObj pinD.
	self assert: obj label equals: #pinD.
	self assert: obj port equals: 9
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testPortB [

	| obj |
	obj := self newObj portB.
	self assert: obj label equals: #portB.
	self assert: obj port equals: self newObj pinB port + 2
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testPortC [

	| obj |
	obj := self newObj portC.
	self assert: obj label equals: #portC.
	self assert: obj port equals: self newObj pinC port + 2
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testPortD [

	| obj |
	obj := self newObj portD.
	self assert: obj label equals: #portD.
	self assert: obj port equals: self newObj pinD port + 2
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testSph [

	| obj |
	obj := self newObj sph.
	self assert: obj label equals: #sph.
	self assert: obj port equals: 16r3E
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testSpl [

	| obj |
	obj := self newObj spl.
	self assert: obj label equals: #spl.
	self assert: obj port equals: 16r3D
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testSreg [

	| obj |
	obj := self newObj sreg.
	self assert: obj label equals: #sreg.
	self assert: obj port equals: 16r3F
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testTccr0a [

	| obj |
	obj := self newObj tccr0a.
	self assert: obj label equals: #tccr0a.
	self assert: obj port equals: 16r24
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testTccr0b [

	| obj |
	obj := self newObj tccr0b.
	self assert: obj label equals: #tccr0b.
	self assert: obj port equals: 16r25
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testTcnt0 [

	| obj |
	obj := self newObj tcnt0.
	self assert: obj label equals: #tcnt0.
	self assert: obj port equals: 16r26
]

{ #category : 'tests' }
AvrArduinoNanoIOMapTest >> testTifr0 [

	| obj |
	obj := self newObj tifr0.
	self assert: obj label equals: #tifr0.
	self assert: obj port equals: 16r15
]
