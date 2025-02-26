Class {
	#name : 'AvrOpMOV',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpMOV >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpMOV >> description [

	^ 'copy register'
]

{ #category : 'accessing' }
AvrOpMOV >> mnemonic [

	^ #MOV
]

{ #category : 'accessing' }
AvrOpMOV >> opcode [

	^ 16r2c00
]
