Class {
	#name : 'AvrSubFrame',
	#superclass : 'AvrRegisterFrame',
	#instVars : [
		'inputs',
		'outputs',
		'pushed'
	],
	#category : 'Avr-Assembly',
	#package : 'Avr',
	#tag : 'Assembly'
}

{ #category : 'checking' }
AvrSubFrame >> checkReadRegister: anInteger [

	inputs ifNotNil: [ (inputs includes: anInteger) ifTrue: [ ^ self ] ].
	outputs ifNotNil: [ (outputs includes: anInteger) ifTrue: [ ^ self ] ].
	(pushed includes: anInteger) ifTrue: [ ^ self ].
	self error: 'Can''t read register=' , anInteger asString
]

{ #category : 'checking' }
AvrSubFrame >> checkWriteRegister: anInteger [

	outputs ifNotNil: [ (outputs includes: anInteger) ifTrue: [ ^ self ] ].
	(pushed includes: anInteger) ifTrue: [ ^ self ].
	self error: 'Can''t write register=' , anInteger asString
]

{ #category : 'initialization' }
AvrSubFrame >> initialize [

	super initialize.
	pushed := Set new.
	unusedRegisters := OrderedCollection new
]

{ #category : 'accessing' }
AvrSubFrame >> inputs [

	^ inputs
]

{ #category : 'accessing' }
AvrSubFrame >> inputs: anObject [

	inputs := anObject
]

{ #category : 'accessing' }
AvrSubFrame >> outputs [

	^ outputs
]

{ #category : 'accessing' }
AvrSubFrame >> outputs: anObject [

	outputs := anObject
]

{ #category : 'api' }
AvrSubFrame >> pushRegister: anInteger [

	pushed add: anInteger
]
