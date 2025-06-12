Class {
	#name : 'AvrLabelResolver',
	#superclass : 'Object',
	#instVars : [
		'labeler'
	],
	#category : 'Avr-Assembly',
	#package : 'Avr',
	#tag : 'Assembly'
}

{ #category : 'accessing' }
AvrLabelResolver >> labeler [

	^ labeler
]

{ #category : 'accessing' }
AvrLabelResolver >> labeler: anObject [

	labeler := anObject
]

{ #category : 'private' }
AvrLabelResolver >> resolve: anArray [

	| address op newOp targetAddress |
	address := anArray first.
	op := anArray second.
	op hasImmediate ifFalse: [ ^ anArray ].
	op immediate isInteger ifTrue: [ ^ anArray ].
	newOp := op copy.
	targetAddress := labeler labelNameAt: newOp immediate.
	targetAddress ifNil: [
		self error: 'Unresolved label:' , newOp immediate ].
	newOp isRelative ifTrue: [
		targetAddress := targetAddress - address - newOp codeSize ].
	targetAddress := targetAddress // 2.
	newOp immediate: targetAddress.
	^ Array with: address with: newOp
]

{ #category : 'api' }
AvrLabelResolver >> resolveCollection: aCollection [

	^ aCollection collect: [ :each | self resolve: each ]
]
