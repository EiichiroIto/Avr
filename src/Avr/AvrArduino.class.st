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

{ #category : 'examples' }
AvrArduino class >> example1 [

	| obj program binary |
	obj := self new.
	program := obj all program.
	binary := AvrCodeGenerator new generateProgram: program.
	(I8HEX fromByteArray: binary) writeTo:
		(self name , '.hex') asFileReference writeStream
]

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
