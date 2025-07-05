Extension { #name : 'SequenceableCollection' }

{ #category : '*Avr' }
SequenceableCollection >> concatNonDuplicatedWith: other [

	^ self copy asOrderedCollection
		  addAll: (other reject: [ :each | self includes: each ]);
		  yourself
]
