Class {
	#name : 'AvrIOMap',
	#superclass : 'AvrMap',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'adding' }
AvrIOMap >> add: anObject [

	| obj |
	obj := map at: anObject port + 1.
	obj ifNotNil: [
		obj = anObject ifTrue: [ ^ self ].
		self error ].
	map at: anObject port + 1 put: anObject
]

{ #category : 'initialization' }
AvrIOMap >> initialize [

	super initialize.
	map := Array new: 256
]

{ #category : 'private' }
AvrIOMap >> label: aSymbol port: anInteger [

	| obj |
	obj := AvrLiteral label: aSymbol port: anInteger.
	self add: obj.
	^ obj
]
