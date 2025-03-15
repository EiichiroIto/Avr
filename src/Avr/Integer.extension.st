Extension { #name : 'Integer' }

{ #category : '*Avr' }
Integer >> expandSignWith: anInteger [

	(self bitAnd: anInteger + 1 >> 1) = 0 ifTrue: [
		^ self bitAnd: anInteger ].
	^ -1 - ((self bitAnd: anInteger) bitXor: anInteger)
]
