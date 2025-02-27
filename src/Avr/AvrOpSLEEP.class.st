Class {
	#name : 'AvrOpSLEEP',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSLEEP >> category [

	^ #mcuControl
]

{ #category : 'accessing' }
AvrOpSLEEP >> description [

	^ 'sleep'
]

{ #category : 'accessing' }
AvrOpSLEEP >> mnemonic [

	^ #SLEEP
]

{ #category : 'accessing' }
AvrOpSLEEP >> opcode [

	^ 16r9588
]

{ #category : 'accessing' }
AvrOpSLEEP >> selector [

	^ #sleep
]
