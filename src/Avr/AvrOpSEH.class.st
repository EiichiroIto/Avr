Class {
	#name : 'AvrOpSEH',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSEH >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpSEH >> description [

	^ 'set half carry flag'
]

{ #category : 'accessing' }
AvrOpSEH >> mnemonic [

	^ #SEH
]

{ #category : 'accessing' }
AvrOpSEH >> opcode [

	^ 16r9458
]

{ #category : 'accessing' }
AvrOpSEH >> selector [

	^ #seh
]
