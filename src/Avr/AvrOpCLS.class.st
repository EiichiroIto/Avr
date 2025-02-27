Class {
	#name : 'AvrOpCLS',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpCLS >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpCLS >> description [

	^ 'clear sign flag'
]

{ #category : 'accessing' }
AvrOpCLS >> mnemonic [

	^ #CLS
]

{ #category : 'accessing' }
AvrOpCLS >> opcode [

	^ 16r94C8
]

{ #category : 'accessing' }
AvrOpCLS >> selector [

	^ #cls
]
