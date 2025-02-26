Class {
	#name : 'AvrOpSLEEP',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
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
