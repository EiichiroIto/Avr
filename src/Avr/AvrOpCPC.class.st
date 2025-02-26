Class {
	#name : 'AvrOpCPC',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
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
