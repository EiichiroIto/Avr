Class {
	#name : 'AvrOpNOP',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpNOP >> category [

	^ #mcuControl
]

{ #category : 'accessing' }
AvrOpNOP >> description [

	^ 'no operation'
]

{ #category : 'accessing' }
AvrOpNOP >> mnemonic [

	^ #NOP
]

{ #category : 'accessing' }
AvrOpNOP >> opcode [

	^ 16r0000
]

{ #category : 'accessing' }
AvrOpNOP >> selector [

	^ #nop
]
