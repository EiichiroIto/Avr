Extension { #name : 'Integer' }

{ #category : '*Avr' }
Integer >> expandSignWith: anInteger [

	(self bitAnd: anInteger + 1 >> 1) = 0 ifTrue: [
		^ self bitAnd: anInteger ].
	^ -1 - ((self bitAnd: anInteger) bitXor: anInteger)
]

{ #category : '*Avr' }
Integer >> half [

	^ self // 2
]

{ #category : '*Avr' }
Integer >> highByte [

	^ (self >> 8) bitAnd: 16rFF
]

{ #category : '*Avr' }
Integer >> lowByte [

	^ self bitAnd: 16rFF
]
