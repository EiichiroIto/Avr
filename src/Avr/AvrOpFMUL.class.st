Class {
	#name : 'AvrOpFMUL',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp4',
	#classTraits : 'TAvrTwoRegistersOp4 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpFMUL >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpFMUL >> description [

	^ 'fractional multiply unsigned'
]

{ #category : 'accessing' }
AvrOpFMUL >> mnemonic [

	^ #FMUL
]

{ #category : 'accessing' }
AvrOpFMUL >> opcode [

	^ 16r0308
]
