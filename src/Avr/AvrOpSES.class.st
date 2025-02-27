Class {
	#name : 'AvrOpSES',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSES >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpSES >> description [

	^ 'set sign flag'
]

{ #category : 'accessing' }
AvrOpSES >> mnemonic [

	^ #SES
]

{ #category : 'accessing' }
AvrOpSES >> opcode [

	^ 16r9448
]

{ #category : 'accessing' }
AvrOpSES >> selector [

	^ #ses
]
