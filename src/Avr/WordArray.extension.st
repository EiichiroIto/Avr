Extension { #name : 'WordArray' }

{ #category : '*Avr' }
WordArray >> addLiteralCodesFor: anAssembler [

	self do: [ :each | anAssembler word: each ]
]
