Extension { #name : 'SequenceableCollectionTest' }

{ #category : '*Avr-Tests' }
SequenceableCollectionTest >> testConcatNonDuplicatedWith [

	| a b |
	a := #( a b c ).
	b := a concatNonDuplicatedWith: #( c d e ).
	self assertCollection: b equals: #( a b c d e ) asOrderedCollection.
	a := #( a b c ).
	b := a concatNonDuplicatedWith: #( a b d e f ).
	self assertCollection: b equals: #( a b c d e f ) asOrderedCollection
]
