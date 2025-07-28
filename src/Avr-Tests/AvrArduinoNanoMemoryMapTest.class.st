"
An AvrArduinoNanoRamTest is a test class for testing the behavior of AvrArduinoNanoRam
"
Class {
	#name : 'AvrArduinoNanoMemoryMapTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrArduinoNanoMemoryMapTest >> newObj [

	^ AvrArduinoNanoMemoryMap new
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testAdch [

	| obj |
	obj := self newObj adch.
	self assert: obj label equals: #adch.
	self assert: obj address equals: self newObj adcl address + 1
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testAdcl [

	| obj |
	obj := self newObj adcl.
	self assert: obj label equals: #adcl.
	self assert: obj address equals: 16r78
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testAdcsra [

	| obj |
	obj := self newObj adcsra.
	self assert: obj label equals: #adcsra.
	self assert: obj address equals: 16r7A
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testAdcsrb [

	| obj |
	obj := self newObj adcsrb.
	self assert: obj label equals: #adcsrb.
	self assert: obj address equals: 16r7B
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testAdmux [

	| obj |
	obj := self newObj admux.
	self assert: obj label equals: #admux.
	self assert: obj address equals: 16r7C
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testPrr [

	| obj |
	obj := self newObj prr.
	self assert: obj label equals: #prr.
	self assert: obj address equals: 16r64
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testRamEnd [

	| mmap obj |
	mmap := self newObj.
	mmap setSize: 16r900.
	obj := mmap ramEnd.
	self assert: obj label equals: #ramEnd.
	self assert: obj address equals: 16r8FF
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testRamTop [

	| mmap obj |
	mmap := self newObj.
	mmap setSize: 16r900.
	obj := mmap ramTop.
	self assert: obj label equals: #ramTop.
	self assert: obj address equals: 16r100
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testTimsk0 [

	| obj |
	obj := self newObj timsk0.
	self assert: obj label equals: #timsk0.
	self assert: obj address equals: 16r6E
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testUbrr0h [

	| obj |
	obj := self newObj ubrr0h.
	self assert: obj label equals: #ubrr0h.
	self assert: obj address equals: 16rC5
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testUbrr0l [

	| obj |
	obj := self newObj ubrr0l.
	self assert: obj label equals: #ubrr0l.
	self assert: obj address equals: 16rC4
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testUcsr0a [

	| obj |
	obj := self newObj ucsr0a.
	self assert: obj label equals: #ucsr0a.
	self assert: obj address equals: 16rC0
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testUcsr0b [

	| obj |
	obj := self newObj ucsr0b.
	self assert: obj label equals: #ucsr0b.
	self assert: obj address equals: 16rC1
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testUcsr0c [

	| obj |
	obj := self newObj ucsr0c.
	self assert: obj label equals: #ucsr0c.
	self assert: obj address equals: 16rC2
]

{ #category : 'tests' }
AvrArduinoNanoMemoryMapTest >> testUdr0 [

	| obj |
	obj := self newObj udr0.
	self assert: obj label equals: #udr0.
	self assert: obj address equals: 16rC6
]
