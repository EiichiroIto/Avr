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

{ #category : 'programs' }
AvrArduino >> chunk: aBlock named: aString [

	asm label: aString.
	aBlock value
]

{ #category : 'programs' }
AvrArduino >> forever: aBlock [

	| label |
	label := self nextLabel.
	asm label: label.
	aBlock value.
	asm rjmp: label
]

{ #category : 'initialization' }
AvrArduino >> initialize [

	asm := self newAssembler.
	asm program: self newProgram
]

{ #category : 'programs' }
AvrArduino >> intHandler: aBlock named: aString [

	asm label: aString.
	aBlock value.
	asm reti
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

{ #category : 'accessing' }
AvrArduino >> useRegister32: anInteger [

	^ anInteger
]

{ #category : 'accessing' }
AvrArduino >> useRegister: anInteger [

	^ anInteger
]

{ #category : 'accessing' }
AvrArduino >> writerFormat [

	self subclassResponsibility
]
