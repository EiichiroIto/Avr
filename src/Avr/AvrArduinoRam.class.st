Class {
	#name : 'AvrArduinoRam',
	#superclass : 'Object',
	#instVars : [
		'label',
		'address'
	],
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrArduinoRam class >> label: aSymbol address: anInteger [

	^ self new
		  label: aSymbol;
		  address: anInteger;
		  yourself
]

{ #category : 'arithmetic' }
AvrArduinoRam >> + anInteger [

	^ self copy
		  address: address + anInteger;
		  yourself
]

{ #category : 'arithmetic' }
AvrArduinoRam >> - anInteger [

	^ self copy
		  address: address - anInteger;
		  yourself
]

{ #category : 'accessing' }
AvrArduinoRam >> address [

	^ address
]

{ #category : 'accessing' }
AvrArduinoRam >> address: anObject [

	address := anObject
]

{ #category : 'accessing' }
AvrArduinoRam >> label [

	^ label
]

{ #category : 'accessing' }
AvrArduinoRam >> label: anObject [

	label := anObject
]

{ #category : 'printing' }
AvrArduinoRam >> printOn: aStream [

	aStream
		nextPutAll: 'MEM(';
		nextPutAll: label asString.
	address ifNotNil: [
		aStream
			nextPutAll: '=';
			nextPutAll: (address printStringBase: 16 length: 4 padded: true) ].
	aStream nextPutAll: ')'
]

{ #category : 'evaluating' }
AvrArduinoRam >> value [

	^ address
]
