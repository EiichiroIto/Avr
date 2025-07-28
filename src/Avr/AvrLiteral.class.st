Class {
	#name : 'AvrLiteral',
	#superclass : 'Object',
	#instVars : [
		'type',
		'address',
		'label',
		'port'
	],
	#category : 'Avr-Assembly',
	#package : 'Avr',
	#tag : 'Assembly'
}

{ #category : 'instance creation' }
AvrLiteral class >> label: aSymbol address: anInteger [

	^ self new
		  type: #address;
		  label: aSymbol;
		  address: anInteger;
		  yourself
]

{ #category : 'instance creation' }
AvrLiteral class >> label: aSymbol port: anInteger [

	^ self new
		  type: #port;
		  label: aSymbol;
		  port: anInteger;
		  yourself
]

{ #category : 'arithmetic' }
AvrLiteral >> + anInteger [

	^ self asModifier + anInteger
]

{ #category : 'arithmetic' }
AvrLiteral >> - anInteger [

	^ self asModifier - anInteger
]

{ #category : 'comparing' }
AvrLiteral >> = anObject [

	(anObject isKindOf: AvrLiteral) ifFalse: [ ^ false ].
	^ label = anObject label and: [
		  (self perform: type) = (anObject perform: type) ]
]

{ #category : 'accessing' }
AvrLiteral >> address [

	^ address
]

{ #category : 'accessing' }
AvrLiteral >> address: anObject [

	address := anObject
]

{ #category : 'converting' }
AvrLiteral >> asModifier [

	^ AvrLiteralModifier new
		  literal: self;
		  yourself
]

{ #category : 'converting' }
AvrLiteral >> half [

	^ self asModifier half
]

{ #category : 'converting' }
AvrLiteral >> highByte [

	^ self asModifier highByte
]

{ #category : 'accessing' }
AvrLiteral >> label [

	^ label
]

{ #category : 'accessing' }
AvrLiteral >> label: anObject [

	label := anObject
]

{ #category : 'converting' }
AvrLiteral >> lowByte [

	^ self asModifier lowByte
]

{ #category : 'accessing' }
AvrLiteral >> port [

	^ port
]

{ #category : 'accessing' }
AvrLiteral >> port: anObject [

	port := anObject
]

{ #category : 'printing' }
AvrLiteral >> printOn: aStream [

	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: type asString;
		nextPut: $:;
		nextPutAll: label asString.
	(self perform: type) ifNotNil: [ :obj |
		aStream nextPutAll: '='.
		obj isNumber
			ifTrue: [
				aStream nextPutAll:
					(obj printStringBase: 16 length: 2 padded: true) ]
			ifFalse: [ aStream nextPutAll: obj asString ] ].
	aStream nextPutAll: ')'
]

{ #category : 'accessing' }
AvrLiteral >> type [

	^ type
]

{ #category : 'accessing' }
AvrLiteral >> type: anObject [

	type ifNotNil: [ self error ].
	type := anObject
]

{ #category : 'evaluating' }
AvrLiteral >> value [

	^ self perform: type
]

{ #category : 'evaluating' }
AvrLiteral >> valueWithLabeler: aLabeler [

	| value |
	value := self perform: type.
	value isNumber ifTrue: [ ^ value ].
	^ aLabeler labelNameAt: value
]
