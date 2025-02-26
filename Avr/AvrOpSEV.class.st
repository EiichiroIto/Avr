Class {
	#name : 'AvrOpSEV',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSEV >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpSEV >> description [

	^ 'set overflow flag'
]

{ #category : 'accessing' }
AvrOpSEV >> mnemonic [

	^ #SEV
]

{ #category : 'accessing' }
AvrOpSEV >> opcode [

	^ 16r9438
]

{ #category : 'accessing' }
AvrOpSEV >> selector [

	^ #sev
]
