Class {
	#name : 'AvrOpCLN',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpCLN >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpCLN >> description [

	^ 'clear negative flag'
]

{ #category : 'accessing' }
AvrOpCLN >> mnemonic [

	^ #CLN
]

{ #category : 'accessing' }
AvrOpCLN >> opcode [

	^ 16r94A8
]

{ #category : 'accessing' }
AvrOpCLN >> selector [

	^ #cln
]
