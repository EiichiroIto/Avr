Class {
	#name : 'AvrOpEIJMP',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpEIJMP >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
AvrOpEIJMP >> description [

	^ 'extended indirect jump'
]

{ #category : 'accessing' }
AvrOpEIJMP >> mnemonic [

	^ #EIJMP
]

{ #category : 'accessing' }
AvrOpEIJMP >> opcode [

	^ 16r9419
]

{ #category : 'accessing' }
AvrOpEIJMP >> selector [

	^ #eijmp
]
