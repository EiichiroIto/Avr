Class {
	#name : 'AvrOpBREAK',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpBREAK >> category [

	^ #mcuControl
]

{ #category : 'accessing' }
AvrOpBREAK >> description [

	^ 'break'
]

{ #category : 'accessing' }
AvrOpBREAK >> mnemonic [

	^ #BREAK
]

{ #category : 'accessing' }
AvrOpBREAK >> opcode [

	^ 16r9598
]

{ #category : 'accessing' }
AvrOpBREAK >> selector [

	^ #break
]
