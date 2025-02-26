Class {
	#name : 'AvrOpELPM1',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpELPM1 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpELPM1 >> description [

	^ 'extended load program memory'
]

{ #category : 'accessing' }
AvrOpELPM1 >> mnemonic [

	^ #ELPM
]

{ #category : 'accessing' }
AvrOpELPM1 >> opcode [

	^ 16r95D8
]

{ #category : 'accessing' }
AvrOpELPM1 >> selector [

	^ #elpm
]
