Class {
	#name : 'AvrOpSET',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSET >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpSET >> description [

	^ 'set temporary flag'
]

{ #category : 'accessing' }
AvrOpSET >> mnemonic [

	^ #SET
]

{ #category : 'accessing' }
AvrOpSET >> opcode [

	^ 16r9468
]

{ #category : 'accessing' }
AvrOpSET >> selector [

	^ #set
]
