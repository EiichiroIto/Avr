Class {
	#name : 'AvrOpCLT',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpCLT >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpCLT >> description [

	^ 'clear temporary flag'
]

{ #category : 'accessing' }
AvrOpCLT >> mnemonic [

	^ #CLT
]

{ #category : 'accessing' }
AvrOpCLT >> opcode [

	^ 16r94E8
]

{ #category : 'accessing' }
AvrOpCLT >> selector [

	^ #clt
]
