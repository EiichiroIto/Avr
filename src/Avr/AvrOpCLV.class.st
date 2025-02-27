Class {
	#name : 'AvrOpCLV',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpCLV >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpCLV >> description [

	^ 'clear overflow flag'
]

{ #category : 'accessing' }
AvrOpCLV >> mnemonic [

	^ #CLV
]

{ #category : 'accessing' }
AvrOpCLV >> opcode [

	^ 16r94B8
]

{ #category : 'accessing' }
AvrOpCLV >> selector [

	^ #clv
]
