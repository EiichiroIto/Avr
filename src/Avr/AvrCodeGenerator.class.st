Class {
	#name : 'AvrCodeGenerator',
	#superclass : 'Object',
	#instVars : [
		'output'
	],
	#category : 'Avr-Utils',
	#package : 'Avr',
	#tag : 'Utils'
}

{ #category : 'api' }
AvrCodeGenerator >> generateCollection: aCollection [

	output := self newByteStream.
	aCollection do: [ :each | self privGenerateOp: each ].
	^ output contents
]

{ #category : 'api' }
AvrCodeGenerator >> generateOp: op [

	output := self newByteStream.
	self privGenerateOp: op.
	^ output contents
]

{ #category : 'api' }
AvrCodeGenerator >> generateProgram: aProgram [

	| offset addr op |
	offset := 0.
	output := self newByteStream.
	aProgram codes do: [ :each |
		addr := each first.
		op := each second.
		addr < offset ifTrue: [ self error: 'Invalid Address' ].
		addr > offset ifTrue: [
			addr - offset timesRepeat: [ output nextPut: 0 ] ].
		output nextPutAll:
			(op copyUsingLabeler: aProgram labeler address: addr) binaryCodes.
		offset := addr + op codeSize ].
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
