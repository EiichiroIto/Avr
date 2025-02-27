Class {
	#name : 'AvrOpSEI',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSEI >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpSEI >> description [

	^ 'enable all interrupts'
]

{ #category : 'accessing' }
AvrOpSEI >> mnemonic [

	^ #SEI
]

{ #category : 'accessing' }
AvrOpSEI >> opcode [

	^ 16r9478
]

{ #category : 'accessing' }
AvrOpSEI >> selector [

	^ #sei
]
