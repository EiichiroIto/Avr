Class {
	#name : 'AvrOpCPC',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpCPC >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
AvrOpCPC >> description [

	^ 'compare with carry'
]

{ #category : 'accessing' }
AvrOpCPC >> mnemonic [

	^ #CPC
]

{ #category : 'accessing' }
AvrOpCPC >> opcode [

	^ 16r0400
]
