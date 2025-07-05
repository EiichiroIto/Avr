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

	| address op newOp targetAddress immediate |
	address := anArray first.
	op := anArray second.
	newOp := self resolvedCopyOf: op.
	op hasImmediate ifFalse: [ ^ Array with: address with: newOp ].
	immediate := newOp immediate.
	immediate isInteger ifTrue: [ ^ Array with: address with: newOp ].
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

{ #category : 'private' }
AvrLabelResolver >> resolvedCopyOf: anInstruction [

	| op |
	op := anInstruction copy.
	op hasIO ifTrue: [ op io: op io value ].
	op hasImmediate ifTrue: [
		op immediate: (op immediate valueWithLabeler: labeler) ].
	^ op
]
