"
An AvrArduinoNanoIOTest is a test class for testing the behavior of AvrArduinoNanoIO
"
Class {
	#name : 'AvrArduinoNanoIOTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'accessing' }
AvrArduinoNanoIOTest >> targetClass [

	^ AvrArduinoNanoIO
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testDdrB [

	| obj |
	obj := self targetClass ddrB.
	self assert: obj label equals: #ddrB.
	self assert: obj port equals: self targetClass pinB port + 1
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testDdrC [

	| obj |
	obj := self targetClass ddrC.
	self assert: obj label equals: #ddrC.
	self assert: obj port equals: self targetClass pinC port + 1
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testDdrD [

	| obj |
	obj := self targetClass ddrD.
	self assert: obj label equals: #ddrD.
	self assert: obj port equals: self targetClass pinD port + 1
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testMcucr [

	| obj |
	obj := self targetClass mcucr.
	self assert: obj label equals: #mcucr.
	self assert: obj port equals: 16r35
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testOcr0a [

	| obj |
	obj := self targetClass ocr0a.
	self assert: obj label equals: #ocr0a.
	self assert: obj port equals: 16r27
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testOcr0b [


	| obj |
	obj := self targetClass ocr0b.
	self assert: obj label equals: #ocr0b.
	self assert: obj port equals: 16r28
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testPinB [


	| obj |
	obj := self targetClass pinB.
	self assert: obj label equals: #pinB.
	self assert: obj port equals: 3
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testPinC [

	| obj |
	obj := self targetClass pinC.
	self assert: obj label equals: #pinC.
	self assert: obj port equals: 6
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testPinD [

	| obj |
	obj := self targetClass pinD.
	self assert: obj label equals: #pinD.
	self assert: obj port equals: 9
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testPortB [

	| obj |
	obj := self targetClass portB.
	self assert: obj label equals: #portB.
	self assert: obj port equals: self targetClass pinB port + 2
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testPortC [

	| obj |
	obj := self targetClass portC.
	self assert: obj label equals: #portC.
	self assert: obj port equals: self targetClass pinC port + 2
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testPortD [

	| obj |
	obj := self targetClass portD.
	self assert: obj label equals: #portD.
	self assert: obj port equals: self targetClass pinD port + 2
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testSph [

	| obj |
	obj := self targetClass sph.
	self assert: obj label equals: #sph.
	self assert: obj port equals: 16r3E
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testSpl [

	| obj |
	obj := self targetClass spl.
	self assert: obj label equals: #spl.
	self assert: obj port equals: 16r3D
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testSreg [

	| obj |
	obj := self targetClass sreg.
	self assert: obj label equals: #sreg.
	self assert: obj port equals: 16r3F
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testTccr0a [

	| obj |
	obj := self targetClass tccr0a.
	self assert: obj label equals: #tccr0a.
	self assert: obj port equals: 16r24
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testTccr0b [

	| obj |
	obj := self targetClass tccr0b.
	self assert: obj label equals: #tccr0b.
	self assert: obj port equals: 16r25
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testTcnt0 [

	| obj |
	obj := self targetClass tcnt0.
	self assert: obj label equals: #tcnt0.
	self assert: obj port equals: 16r26
]

{ #category : 'tests' }
AvrArduinoNanoIOTest >> testTifr0 [

	| obj |
	obj := self targetClass tifr0.
	self assert: obj label equals: #tifr0.
	self assert: obj port equals: 16r15
]
