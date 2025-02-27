Class {
	#name : 'AvrOpFMULSU',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp4',
	#classTraits : 'TAvrTwoRegistersOp4 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpFMULSU >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpFMULSU >> description [

	^ 'fractional multiply signed with unsigned'
]

{ #category : 'accessing' }
AvrOpFMULSU >> mnemonic [

	^ #FMULSU
]

{ #category : 'accessing' }
AvrOpFMULSU >> opcode [

	^ 16r0388
]
