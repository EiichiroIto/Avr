Class {
	#name : 'AvrArduinoIO',
	#superclass : 'Object',
	#instVars : [
		'label',
		'port'
	],
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrArduinoIO class >> label: aSymbol port: anInteger [

	^ self new
		  label: aSymbol;
		  port: anInteger;
		  yourself
]

{ #category : 'arithmetic' }
AvrArduinoIO >> + anInteger [

	^ self copy
		  port: port + anInteger;
		  yourself
]

{ #category : 'arithmetic' }
AvrArduinoIO >> - anInteger [

	^ self copy
		  port: port - anInteger;
		  yourself
]

{ #category : 'accessing' }
AvrArduinoIO >> label [

	^ label
]

{ #category : 'accessing' }
AvrArduinoIO >> label: anObject [

	label := anObject
]

{ #category : 'accessing' }
AvrArduinoIO >> port [

	^ port
]

{ #category : 'accessing' }
AvrArduinoIO >> port: anObject [

	port := anObject
]

{ #category : 'printing' }
AvrArduinoIO >> printOn: aStream [

	aStream
		nextPutAll: 'IO(';
		nextPutAll: label asString.
	port ifNotNil: [
		aStream
			nextPutAll: '=';
			nextPutAll: (port printStringBase: 16 length: 2 padded: true) ].
	aStream nextPutAll: ')'
]

{ #category : 'evaluating' }
AvrArduinoIO >> value [

	^ port
]
