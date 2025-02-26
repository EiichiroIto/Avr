Class {
	#name : 'AvrCodeGenerator',
	#superclass : 'Object',
	#instVars : [
		'output'
	],
	#category : 'Avr-CodeGenerator',
	#package : 'Avr',
	#tag : 'CodeGenerator'
}

{ #category : 'accessing' }
AvrCodeGenerator >> generateCodes: aCollection [

	output := self newByteStream.
	aCollection do: [ :each | self privGenerateOp: each ].
	^ output contents
]

{ #category : 'accessing' }
AvrCodeGenerator >> generateOp: op [

	output := self newByteStream.
	self privGenerateOp: op.
	^ output contents
]

{ #category : 'instance creation' }
AvrCodeGenerator >> newByteStream [

	^ ByteArray new writeStream
]

{ #category : 'accessing' }
AvrCodeGenerator >> output [

	^ output
]

{ #category : 'accessing' }
AvrCodeGenerator >> output: anObject [

	output := anObject
]

{ #category : 'private' }
AvrCodeGenerator >> privGenerateOp: op [

	output nextPutAll: op binaryCodes
]
