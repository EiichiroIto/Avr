Class {
	#name : 'AvrAsm2Code',
	#superclass : 'Object',
	#instVars : [
		'program',
		'labelNo'
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

	program := self newProgram.
	labelNo := 0
]

{ #category : 'instance creation' }
AvrAsm2Code >> newParser [

	^ AvrAsmParser new
]

{ #category : 'instance creation' }
AvrAsm2Code >> newProgram [

	^ AvrProgram new
]

{ #category : 'private' }
AvrAsm2Code >> nextLabel [

	labelNo := labelNo + 1.
	^ 'label' , labelNo asString
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
	program add: tuples third.
	self updateAbsoluteLabel: tuples third.
	self updateRelativeLabel: tuples third address: tuples first
]

{ #category : 'private' }
AvrAsm2Code >> updateAbsoluteLabel: op [

	| address |
	op isAbsolute ifFalse: [ ^ self ].
	address := op immediate * 2.
	(program labelAddressAt: address) ifNotNil: [ ^ self ].
	program labelName: self nextLabel address: address
]

{ #category : 'private' }
AvrAsm2Code >> updateRelativeLabel: op address: currentAddress [

	| address |
	op isRelative ifFalse: [ ^ self ].
	address := currentAddress + op codeSize + (op immediate * 2).
	(program labelAddressAt: address) ifNotNil: [ ^ self ].
	program labelName: self nextLabel address: address
]
