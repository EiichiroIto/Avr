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

	self all.
	^ asm assembledCodesFor: self
]

{ #category : 'initialization' }
AvrArduino >> initialize [

	asm := self newAssembler.
	asm program: self newProgram.
	io := self newIO.
	ram := self newRam
]

{ #category : 'macros' }
AvrArduino >> intHandlerNamed: aSymbol [

	| tmp |
	asm label: aSymbol.
	tmp := asm availableRegisters.
	asm clearAvailableRegisters.
	self perform: aSymbol.
	asm availableRegisters: tmp.
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

{ #category : 'private' }
AvrArduino >> setupRegisterPool [

	self subclassResponsibility
]

{ #category : 'macros' }
AvrArduino >> subroutineNamed: aSymbol [

	| tmp |
	asm label: aSymbol.
	tmp := asm availableRegisters.
	asm clearAvailableRegisters.
	self perform: aSymbol.
	asm availableRegisters: tmp.
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

{ #category : 'private' }
AvrArduino >> use: anInteger registersIn: aBlock [

	| registers |
	registers := asm getRegistersCount: anInteger.
	aBlock value: registers.
	asm releaseRegisters: registers
]

{ #category : 'private' }
AvrArduino >> useInputs: aCollection outputs: aCollection2 in: aBlock [

	| registers |
	registers := (aCollection ifNil: [ #(  ) ]) copy asOrderedCollection.
	registers addAll: ((aCollection2 ifNil: [ #(  ) ]) reject: [ :each |
			 registers includes: each ]).
	(asm checkAnyRegistersAvailable: registers) ifTrue: [ self error ].
	aBlock numArgs = 0
		ifTrue: [ aBlock value ]
		ifFalse: [ aBlock valueWithArguments: registers ]
]

{ #category : 'private' }
AvrArduino >> useRegister: anInteger in: aBlock [

	asm getRegisters: { anInteger }.
	aBlock cull: anInteger.
	asm releaseRegisters: { anInteger }
]

{ #category : 'private' }
AvrArduino >> useRegisterIn: aBlock [

	| register |
	register := (asm getRegistersCount: 1) first.
	aBlock value: register.
	asm releaseRegisters: { register }
]

{ #category : 'private' }
AvrArduino >> useRegisters: aCollection in: aBlock [

	asm getRegisters: aCollection.
	aBlock numArgs = 0
		ifTrue: [ aBlock value ]
		ifFalse: [ aBlock valueWithArguments: aCollection ].
	asm releaseRegisters: aCollection
]

{ #category : 'constants' }
AvrArduino >> writerFormat [

	self subclassResponsibility
]
