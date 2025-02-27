Class {
	#name : 'AvrOpLPM1',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpLPM1 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLPM1 >> description [

	^ 'load program memory'
]

{ #category : 'accessing' }
AvrOpLPM1 >> mnemonic [

	^ #LPM
]

{ #category : 'accessing' }
AvrOpLPM1 >> opcode [

	^ 16r95C8
]

{ #category : 'accessing' }
AvrOpLPM1 >> selector [

	^ #lpm
]
