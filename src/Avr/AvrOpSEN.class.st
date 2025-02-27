Class {
	#name : 'AvrOpSEN',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSEN >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpSEN >> description [

	^ 'set negative flag'
]

{ #category : 'accessing' }
AvrOpSEN >> mnemonic [

	^ #SEN
]

{ #category : 'accessing' }
AvrOpSEN >> opcode [

	^ 16r9428
]

{ #category : 'accessing' }
AvrOpSEN >> selector [

	^ #sen
]
