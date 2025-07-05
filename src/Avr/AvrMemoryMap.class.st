Class {
	#name : 'AvrMemoryMap',
	#superclass : 'AvrMap',
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'adding' }
AvrMemoryMap >> add: anObject [

	| obj |
	obj := map at: anObject address + 1.
	obj ifNotNil: [
		obj = anObject ifTrue: [ ^ self ].
		self error ].
	map at: anObject address + 1 put: anObject
]

{ #category : 'initialization' }
AvrMemoryMap >> initialize [

	super initialize.
	map := Array new: 256
]

{ #category : 'private' }
AvrMemoryMap >> label: aSymbol address: anInteger [

	| obj |
	obj := AvrLiteral label: aSymbol address: anInteger.
	self add: obj.
	^ obj
]
