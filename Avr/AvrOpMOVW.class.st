Class {
	#name : 'AvrOpMOVW',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp2',
	#classTraits : 'TAvrTwoRegistersOp2 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpMOVW >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpMOVW >> description [

	^ 'copy register word'
]

{ #category : 'accessing' }
AvrOpMOVW >> mnemonic [

	^ #MOVW
]

{ #category : 'accessing' }
AvrOpMOVW >> opcode [

	^ 16r0100
]
