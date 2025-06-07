"
An AvrArduinoNanoTest is a test class for testing the behavior of AvrArduinoNano
"
Class {
	#name : 'AvrArduinoNanoTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrArduinoNanoTest >> newObj [

	^ AvrArduinoNano new
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testDdrB [

	| obj |
	obj := self newObj.
	self assert: obj ddrB equals: obj pinB + 1
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testDdrC [

	| obj |
	obj := self newObj.
	self assert: obj ddrC equals: obj pinC + 1
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testDdrD [

	| obj |
	obj := self newObj.
	self assert: obj ddrD equals: obj pinD + 1
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testDigitalPins [

	| obj a |
	obj := self newObj.
	self assert: obj digitalPins isArray.
	a := Array new.
	obj digitalPins: a.
	self assert: obj digitalPins identicalTo: a
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testInitialize [

	| obj |
	obj := AvrArduinoNano basicNew.
	self assert: obj digitalPins isNil.
	obj initialize.
	self assert: obj digitalPins isArray.
	self assert: obj digitalPins size equals: 14
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testMcucr [

	self assert: self newObj mcucr equals: 16r35
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testPinB [

	self assert: self newObj pinB equals: 3
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testPinC [

	self assert: self newObj pinC equals: 6
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testPinD [

	self assert: self newObj pinD equals: 9
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testPortB [

	| obj |
	obj := self newObj.
	self assert: obj portB equals: obj pinB + 2
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testPortC [

	| obj |
	obj := self newObj.
	self assert: obj portC equals: obj pinC + 2
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testPortD [

	| obj |
	obj := self newObj.
	self assert: obj portD equals: obj pinD + 2
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testSetupDigitalPins [

	| obj arr |
	obj := AvrArduinoNano basicNew.
	self assert: obj digitalPins isNil.
	obj setupDigitalPins.
	arr := obj digitalPins.
	self assert: arr isArray.
	self assert: arr size equals: 14.
	self assert: arr first first equals: obj pinD.
	self assert: arr first second equals: 0
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testSph [

	self assert: self newObj sph equals: 16r3E
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testSpl [

	self assert: self newObj spl equals: 16r3D
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testSreg [

	self assert: self newObj sreg equals: 16r3F
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testXh [

	self assert: self newObj xh equals: 16r1B
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testXl [

	self assert: self newObj xl equals: 16r1A
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testYh [

	self assert: self newObj yh equals: 16r1D
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testYl [

	self assert: self newObj yl equals: 16r1C
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testZh [

	self assert: self newObj zh equals: 16r1F
]

{ #category : 'tests' }
AvrArduinoNanoTest >> testZl [

	self assert: self newObj zl equals: 16r1E
]
