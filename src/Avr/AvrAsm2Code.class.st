Class {
	#name : 'AvrAsm2Code',
	#superclass : 'Object',
	#instVars : [
		'program'
	],
	#category : 'Avr-Utils',
	#package : 'Avr',
	#tag : 'Utils'
}

{ #category : 'instance creation' }
AvrAsm2Code class >> fromFileNamed: aString [

	| obj |
	obj := self new.
	obj readFrom: aString asFileReference readStream.
	^ obj
]

{ #category : 'initialization' }
AvrAsm2Code >> initialize [

	program := self newProgram
]

{ #category : 'instance creation' }
AvrAsm2Code >> newParser [

	^ AvrAsmParser new
]

{ #category : 'instance creation' }
AvrAsm2Code >> newProgram [

	^ AvrProgram new
]

{ #category : 'accessing' }
AvrAsm2Code >> program [

	^ program
]

{ #category : 'accessing' }
AvrAsm2Code >> program: anObject [

	program := anObject
]

{ #category : 'instance creation' }
AvrAsm2Code >> readFrom: aStream [

	aStream contents lines doWithIndex: [ :each :index |
		self readString: each ]
]

{ #category : 'private' }
AvrAsm2Code >> readString: aString [

	| parser tuples |
	parser := self newParser.
	tuples := parser parse: aString.
	tuples isPetitFailure ifTrue: [ ^ self ].
	program add: tuples third
]
