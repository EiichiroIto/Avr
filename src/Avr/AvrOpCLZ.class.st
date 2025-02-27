Class {
	#name : 'AvrOpCLZ',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpCLZ >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpCLZ >> description [

	^ 'clear zero flag'
]

{ #category : 'accessing' }
AvrOpCLZ >> mnemonic [

	^ #CLZ
]

{ #category : 'accessing' }
AvrOpCLZ >> opcode [

	^ 16r9498
]

{ #category : 'accessing' }
AvrOpCLZ >> selector [

	^ #clz
]
