Class {
	#name : 'AvrArduino',
	#superclass : 'Object',
	#instVars : [
		'asm'
	],
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'accessing' }
AvrArduino >> asm [

	^ asm
]

{ #category : 'accessing' }
AvrArduino >> asm: anObject [

	asm := anObject
]

{ #category : 'initialization' }
AvrArduino >> initialize [

	asm := self newAssembler.
	asm program: self newProgram
]

{ #category : 'private' }
AvrArduino >> label: aString [

	asm label: aString
]

{ #category : 'instance creation' }
AvrArduino >> newAssembler [

	^ AvrAssembler new
]

{ #category : 'instance creation' }
AvrArduino >> newProgram [

	^ AvrProgram new
]

{ #category : 'accessing' }
AvrArduino >> program [

	^ asm program
]

{ #category : 'accessing' }
AvrArduino >> program: anObject [

	asm program: anObject
]
