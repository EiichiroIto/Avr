Class {
	#name : 'AvrDisAssembler',
	#superclass : 'Object',
	#instVars : [
		'program',
		'opClasses'
	],
	#category : 'Avr-Assembly',
	#package : 'Avr',
	#tag : 'Assembly'
}

{ #category : 'initialization' }
AvrDisAssembler >> initialize [

	opClasses := AvrInstruction allSubclasses difference: {
			             AvrImmediate.
			             AvrInputOutput.
			             AvrNoOperand.
			             AvrOneRegister.
			             AvrRegisterWithImmediate.
			             AvrTwoRegisters.
			             AvrSemiWord }
]

{ #category : 'accessing' }
AvrDisAssembler >> opClasses [

	^ opClasses
]

{ #category : 'accessing' }
AvrDisAssembler >> opClasses: anObject [

	opClasses := anObject
]

{ #category : 'accessing' }
AvrDisAssembler >> program [

	^ program
]

{ #category : 'accessing' }
AvrDisAssembler >> program: anObject [

	program := anObject
]

{ #category : 'reading' }
AvrDisAssembler >> readCodeFrom: aStream [

	| word list code |
	word := self readNextWordFrom: aStream.
	list := opClasses
		        collect: #new
		        thenSelect: [ :each | each matches: word ].
	list isEmpty ifTrue: [ ^ AvrSemiWord new immediate: word ].
	"list size > 1 ifTrue: [ self error ]."
	code := list first.
	code codeSize = 2
		ifTrue: [ code fromWord: word ]
		ifFalse: [
		code fromWord: word withExtended: (self readNextWordFrom: aStream) ].
	^ code
]

{ #category : 'reading' }
AvrDisAssembler >> readFrom: aStream [

	| code |
	[ aStream atEnd ] whileFalse: [
		code := self readCodeFrom: aStream.
		program add: code ]
]

{ #category : 'reading' }
AvrDisAssembler >> readNextWordFrom: aStream [

	| low high |
	low := aStream next.
	high := aStream next.
	^ low bitOr: (high << 8)
]
