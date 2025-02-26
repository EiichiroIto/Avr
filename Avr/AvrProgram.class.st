Class {
	#name : 'AvrProgram',
	#superclass : 'Object',
	#instVars : [
		'codes',
		'address',
		'labels'
	],
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'adding' }
AvrProgram >> add: op [

	| code |
	code := self newItem
		        address: address;
		        op: op.
	codes add: code.
	address := address + op codeSize
]

{ #category : 'accessing' }
AvrProgram >> address [

	^ address
]

{ #category : 'accessing' }
AvrProgram >> address: anObject [

	address := anObject
]

{ #category : 'accessing' }
AvrProgram >> codeCount [

	^ codes size
]

{ #category : 'accessing' }
AvrProgram >> codes [

	^ codes
]

{ #category : 'accessing' }
AvrProgram >> codes: anObject [

	codes := anObject
]

{ #category : 'initialization' }
AvrProgram >> initialize [

	address := 0.
	codes := OrderedCollection new.
	labels := Dictionary new
]

{ #category : 'accessing' }
AvrProgram >> label: aString [

	labels at: address put: aString
]

{ #category : 'accessing' }
AvrProgram >> labelAddressAt: anInteger [

	^ labels at: anInteger ifAbsent: nil
]

{ #category : 'accessing' }
AvrProgram >> labelName: aString address: anInteger [

	labels at: anInteger put: aString
]

{ #category : 'accessing' }
AvrProgram >> labelNameAt: aString [

	^ labels keyAtValue: aString ifAbsent: nil
]

{ #category : 'accessing' }
AvrProgram >> labels [

	^ labels
]

{ #category : 'accessing' }
AvrProgram >> labels: anObject [

	labels := anObject
]

{ #category : 'instance creation' }
AvrProgram >> newItem [

	^ AvrCode new
]

{ #category : 'printing' }
AvrProgram >> printMethodString [

	| stream |
	stream := String new writeStream.
	codes do: [ :each |
		stream
			nextPutAll: 'self ';
			nextPutAll: each op messageText;
			nextPut: $.;
			nextPut: Character cr ].
	^ stream contents
]

{ #category : 'printing' }
AvrProgram >> printWithLabel [

	| stream |
	stream := String new writeStream.
	codes do: [ :each |
		(self labelAddressAt: each address) ifNotNil: [ :label |
			stream
				nextPutAll: label;
				nextPut: $:;
				nextPut: Character cr ].
		each printOpOn: stream using: labels.
		stream nextPut: Character cr ].
	^ stream contents
]

{ #category : 'printing' }
AvrProgram >> printWithoutLabel [

	| stream |
	stream := String new writeStream.
	codes do: [ :each |
		each printOpOn: stream.
		stream nextPut: Character cr ].
	^ stream contents
]
