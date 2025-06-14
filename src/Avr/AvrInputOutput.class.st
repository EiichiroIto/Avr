Class {
	#name : 'AvrInputOutput',
	#superclass : 'AvrInstruction',
	#instVars : [
		'io',
		'bit'
	],
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrInputOutput >> arguments [

	^ Array with: io with: bit
]

{ #category : 'accessing' }
AvrInputOutput >> bit [

	^ bit
]

{ #category : 'accessing' }
AvrInputOutput >> bit: anObject [

	bit := anObject
]

{ #category : 'accessing' }
AvrInputOutput >> bitRange [

	^ 0 to: 7
]

{ #category : 'accessing' }
AvrInputOutput >> fromWord: anInteger [

	self bit: (anInteger bitAnd: 2r111).
	self io: (anInteger >> 3 bitAnd: 2r11111)
]

{ #category : 'testing' }
AvrInputOutput >> hasIO [

	^ true
]

{ #category : 'accessing' }
AvrInputOutput >> io [

	^ io
]

{ #category : 'accessing' }
AvrInputOutput >> io: anObject [

	io := anObject
]

{ #category : 'accessing' }
AvrInputOutput >> ioRange [

	^ 0 to: 31
]

{ #category : 'testing' }
AvrInputOutput >> isValid [

	io isInteger ifFalse: [ ^ false ].
	bit isInteger ifFalse: [ ^ false ].
	^ (self ioRange includes: io) and: [ self bitRange includes: bit ]
]

{ #category : 'accessing' }
AvrInputOutput >> opcodeMask [

	^ 16rFF00
]

{ #category : 'accessing' }
AvrInputOutput >> operand [

	^ (bit bitAnd: 2r111) bitOr: (io bitAnd: 2r11111) << 3
]

{ #category : 'accessing' }
AvrInputOutput >> operandText [

	^ (self printHexImmediate: io) , ', ' , bit asString
]
