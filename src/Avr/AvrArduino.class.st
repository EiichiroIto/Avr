Class {
	#name : 'AvrArduino',
	#superclass : 'Object',
	#instVars : [
		'asm',
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

	self reset.
	self all.
	^ asm assembledCodesFor: self
]

{ #category : 'initialization' }
AvrArduino >> initialize [

	io := self newIO.
	ram := self newRam.
	self reset
]

{ #category : 'macros' }
AvrArduino >> intHandlerNamed: aSymbol [

	asm label: aSymbol.
	self perform: aSymbol.
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

{ #category : 'api' }
AvrArduino >> labelNameAt: aSymbol [

	^ asm labelNameAt: aSymbol
]

{ #category : 'instance creation' }
AvrArduino >> newAssembler [

	^ AvrAssembler new
]

{ #category : 'instance creation' }
AvrArduino >> newIO [

	^ AvrIOMap new
]

{ #category : 'instance creation' }
AvrArduino >> newProgram [

	^ AvrProgram new
]

{ #category : 'instance creation' }
AvrArduino >> newRam [

	^ AvrMemoryMap new
]

{ #category : 'accessing' }
AvrArduino >> nextLabel [

	^ asm labeler nextLabel
]

{ #category : 'programs' }
AvrArduino >> nop [

	asm nop
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

{ #category : 'initialization' }
AvrArduino >> reset [

	asm := self newAssembler.
	asm program: self newProgram.
	asm setupRegisterFrames
]

{ #category : 'macros' }
AvrArduino >> subroutineNamed: aSymbol [

	| tmp |
	tmp := asm registerFrames unusedRegisters.
	asm label: aSymbol.
	asm registerFrames unusedRegisters: OrderedCollection new.
	self perform: aSymbol.
	asm registerFrames unusedRegisters: tmp.
	asm ret
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

{ #category : 'constants' }
AvrArduino >> writerFormat [

	self subclassResponsibility
]
