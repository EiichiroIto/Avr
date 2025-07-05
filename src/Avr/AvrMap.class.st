Class {
	#name : 'AvrMap',
	#superclass : 'Object',
	#instVars : [
		'map'
	],
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'adding' }
AvrMap >> add: anObject [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrMap >> map [

	^ map
]

{ #category : 'accessing' }
AvrMap >> map: anObject [

	map := anObject
]

{ #category : 'accessing' }
AvrMap >> setSize: anInteger [

	map := Array new: anInteger
]
