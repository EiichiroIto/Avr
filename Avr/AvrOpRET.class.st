Class {
	#name : 'AvrOpRET',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpRET >> category [

	^ #mcuControl
]

{ #category : 'accessing' }
AvrOpRET >> description [

	^ 'return from subroutine'
]

{ #category : 'accessing' }
AvrOpRET >> mnemonic [

	^ #RET
]

{ #category : 'accessing' }
AvrOpRET >> opcode [

	^ 16r9508
]

{ #category : 'accessing' }
AvrOpRET >> selector [

	^ #ret
]
