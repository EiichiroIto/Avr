Class {
	#name : 'AvrOpSEZ',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSEZ >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpSEZ >> description [

	^ 'set zero flag'
]

{ #category : 'accessing' }
AvrOpSEZ >> mnemonic [

	^ #SEZ
]

{ #category : 'accessing' }
AvrOpSEZ >> opcode [

	^ 16r9418
]

{ #category : 'accessing' }
AvrOpSEZ >> selector [

	^ #sez
]
