Class {
	#name : 'AvrArduino',
	#superclass : 'Object',
	#instVars : [
		'asm',
		'registerPool',
		'io',
		'ram'
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

{ #category : 'writing' }
AvrArduino class >> toI8HEX: aFileReference [

	| binary i8hex |
	binary := AvrCodeGenerator new generateProgram: self new all program.
	i8hex := I8HEX fromByteArray: binary.
	i8hex writeTo: aFileReference asFileReference writeStream
]

{ #category : 'programs' }
AvrArduino >> all [

	self subclassResponsibility
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
	asm program: self newProgram.
	registerPool := OrderedCollection new
]

{ #category : 'programs' }
AvrArduino >> intHandler: aBlock named: aString [

	asm label: aString.
	aBlock value.
	asm reti
]

{ #category : 'accessing' }
AvrArduino >> io [

	^ io
]

{ #category : 'accessing' }
AvrArduino >> io: anObject [

	io := anObject
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
AvrArduino >> nextLabel [

	^ asm labeler nextLabel
]

{ #category : 'accessing' }
AvrArduino >> program [

	^ asm program
]

{ #category : 'accessing' }
AvrArduino >> program: anObject [

	asm program: anObject
]

{ #category : 'accessing' }
AvrArduino >> ram [

	^ ram
]

{ #category : 'accessing' }
AvrArduino >> ram: anObject [

	ram := anObject
]

{ #category : 'accessing' }
AvrArduino >> registerPool [

	^ registerPool
]

{ #category : 'accessing' }
AvrArduino >> registerPool: anObject [

	registerPool := anObject
]

{ #category : 'private' }
AvrArduino >> returnRegisters: aCollection [

	(registerPool includesAny: aCollection) ifTrue: [ self error ].
	registerPool addAll: aCollection.
	registerPool sort
]

{ #category : 'private' }
AvrArduino >> setupRegisterPool [

	self subclassResponsibility
]

{ #category : 'programs' }
AvrArduino >> subroutine: aBlock named: aString [

	asm label: aString.
	aBlock value.
	asm ret
]

{ #category : 'api' }
AvrArduino >> uploadTo: aString [

	| binary i8hex filename |
	filename := self class name , '.hex'.
	binary := AvrCodeGenerator new generateProgram: self all program.
	i8hex := I8HEX fromByteArray: binary.
	i8hex writeTo: filename asFileReference writeStream.
	^ OSPlatform current runCommand: (self writerFormat format: {
				   aString.
				   filename })
]

{ #category : 'private' }
AvrArduino >> use: anInteger registersDuring: aBlock [

	| registers |
	registers := registerPool removeFirst: anInteger.
	aBlock value: registers.
	self returnRegisters: registers
]

{ #category : 'private' }
AvrArduino >> useRegisterDuring: aBlock [

	| register |
	register := registerPool removeFirst.
	aBlock value: register.
	(registerPool includes: register) ifTrue: [ self error ].
	registerPool addFirst: register.
	registerPool sort
]

{ #category : 'private' }
AvrArduino >> useRegisters: aCollection during: aBlock [

	aCollection do: [ :each | registerPool remove: each ].
	aBlock value: aCollection.
	self returnRegisters: aCollection
]

{ #category : 'constants' }
AvrArduino >> writerFormat [

	self subclassResponsibility
]
