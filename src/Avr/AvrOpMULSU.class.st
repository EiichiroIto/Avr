Class {
	#name : 'AvrOpMULSU',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp4',
	#classTraits : 'TAvrTwoRegistersOp4 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpMULSU >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpMULSU >> description [

	^ 'multiply signed with unsigned'
]

{ #category : 'accessing' }
AvrOpMULSU >> mnemonic [

	^ #MULSU
]

{ #category : 'accessing' }
AvrOpMULSU >> opcode [

	^ 16r0300
]
