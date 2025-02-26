Class {
	#name : 'AvrOpRETI',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpRETI >> category [

	^ #mcuControl
]

{ #category : 'accessing' }
AvrOpRETI >> description [

	^ 'return from interrupt'
]

{ #category : 'accessing' }
AvrOpRETI >> mnemonic [

	^ #RETI
]

{ #category : 'accessing' }
AvrOpRETI >> opcode [

	^ 16r9518
]

{ #category : 'accessing' }
AvrOpRETI >> selector [

	^ #reti
]
