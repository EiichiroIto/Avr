Class {
	#name : 'AvrArduino',
	#superclass : 'Object',
	#instVars : [
		'asm',
		'registerPool',
		'io',
		'ram',
		'subroutines'
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
	binary := AvrCodeGenerator new generate: obj.
	(I8HEX fromByteArray: binary) writeTo:
		(self name , '.hex') asFileReference writeStream
]

{ #category : 'writing' }
AvrArduino class >> toI8HEX: aFileReference [

	| binary i8hex |
	binary := AvrCodeGenerator new generate: self new.
	i8hex := I8HEX fromByteArray: binary.
	i8hex writeTo: aFileReference asFileReference writeStream
]

{ #category : 'programs' }
AvrArduino >> all [

	"self subclassResponsibility"
]

{ #category : 'accessing' }
AvrArduino >> asm [

	^ asm
]

{ #category : 'accessing' }
AvrArduino >> asm: anObject [

	asm := anObject
]

{ #category : 'api' }
AvrArduino >> assembledCodes [

	self all.
	self resolveUndefinedSubroutines.
	^ asm program validatedCodes
]

{ #category : 'macros' }
AvrArduino >> callSubroutine: aSymbol [

	subroutines add: aSymbol.
	asm rcall: aSymbol
]

{ #category : 'initialization' }
AvrArduino >> initialize [

	asm := self newAssembler.
	asm program: self newProgram.
	registerPool := OrderedCollection new.
	subroutines := Set new
]

{ #category : 'macros' }
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
AvrArduino >> resolveUndefinedSubroutines [

	subroutines do: [ :each |
		(asm labeler hasAddressNameAt: each) ifFalse: [
			(self class canPerform: each asSymbol)
				ifTrue: [
				self subroutine: [ self perform: each asSymbol ] named: each ]
				ifFalse: [ self error ] ] ]
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

{ #category : 'macros' }
AvrArduino >> subroutine: aBlock named: aString [

	asm label: aString.
	aBlock value.
	asm ret
]

{ #category : 'accessing' }
AvrArduino >> subroutines [

	^ subroutines
]

{ #category : 'accessing' }
AvrArduino >> subroutines: anObject [

	subroutines := anObject
]

{ #category : 'api' }
AvrArduino >> uploadTo: aString [

	| binary i8hex filename |
	filename := self class name , '.hex'.
	binary := AvrCodeGenerator new generate: self.
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
AvrArduino >> useRegister: anInteger during: aBlock [

	registerPool remove: anInteger.
	aBlock value: anInteger.
	self returnRegisters: { anInteger }
]

{ #category : 'private' }
AvrArduino >> useRegisterDuring: aBlock [

	| register |
	register := registerPool removeFirst.
	aBlock value: register.
	self returnRegisters: { register }
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
