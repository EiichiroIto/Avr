Class {
	#name : 'AvrLiteralModifier',
	#superclass : 'Object',
	#instVars : [
		'literal',
		'list'
	],
	#category : 'Avr-Assembly',
	#package : 'Avr',
	#tag : 'Assembly'
}

{ #category : 'arithmetic' }
AvrLiteralModifier >> + other [

	list add: other
]

{ #category : 'arithmetic' }
AvrLiteralModifier >> - other [

	list add: other negated
]

{ #category : 'accessing' }
AvrLiteralModifier >> address [

	^ literal address
]

{ #category : 'private' }
AvrLiteralModifier >> applyListOn: aNumber [

	| value |
	value := aNumber.
	list do: [ :each |
		each isNumber ifTrue: [ value := value + each ].
		each isSymbol ifTrue: [ value := value perform: each ] ].
	^ value
]

{ #category : 'converting' }
AvrLiteralModifier >> asModifier [

	^ self
]

{ #category : 'converting' }
AvrLiteralModifier >> highByte [

	list add: #highByte
]

{ #category : 'initialization' }
AvrLiteralModifier >> initialize [

	list := OrderedCollection new
]

{ #category : 'accessing' }
AvrLiteralModifier >> label [

	^ literal label
]

{ #category : 'accessing' }
AvrLiteralModifier >> list [

	^ list
]

{ #category : 'accessing' }
AvrLiteralModifier >> list: anObject [

	list := anObject
]

{ #category : 'accessing' }
AvrLiteralModifier >> literal [

	^ literal
]

{ #category : 'accessing' }
AvrLiteralModifier >> literal: anObject [

	literal := anObject
]

{ #category : 'converting' }
AvrLiteralModifier >> lowByte [

	list add: #lowByte
]

{ #category : 'accessing' }
AvrLiteralModifier >> port [

	^ literal port
]

{ #category : 'printing' }
AvrLiteralModifier >> printOn: aStream [

	aStream nextPutAll: 'Mod(['.
	literal
		ifNotNil: [ literal printOn: aStream ]
		ifNil: [ aStream nextPutAll: 'nil' ].
	aStream nextPutAll: '],list='.
	list printElementsOn: aStream.
	aStream nextPut: $)
]

{ #category : 'accessing' }
AvrLiteralModifier >> type [

	^ literal type
]

{ #category : 'evaluating' }
AvrLiteralModifier >> value [

	^ self applyListOn: literal value
]

{ #category : 'evaluating' }
AvrLiteralModifier >> valueWithLabeler: aLabeler [

	^ self applyListOn: (literal valueWithLabeler: aLabeler)
]
