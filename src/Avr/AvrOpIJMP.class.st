Class {
	#name : 'AvrOpIJMP',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpIJMP >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
AvrOpIJMP >> description [

	^ 'indirect jump'
]

{ #category : 'accessing' }
AvrOpIJMP >> mnemonic [

	^ #IJMP
]

{ #category : 'accessing' }
AvrOpIJMP >> opcode [

	^ 16r9409
]

{ #category : 'accessing' }
AvrOpIJMP >> selector [

	^ #ijmp
]
