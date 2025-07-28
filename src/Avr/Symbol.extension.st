Extension { #name : 'Symbol' }

{ #category : '*Avr' }
Symbol >> asLiteral [

	^ AvrLiteral label: self address: self
]
