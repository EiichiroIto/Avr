Class {
	#name : 'AvrOpFMULS',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp4',
	#classTraits : 'TAvrTwoRegistersOp4 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpFMULS >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpFMULS >> description [

	^ 'fractional multiply signed'
]

{ #category : 'accessing' }
AvrOpFMULS >> mnemonic [

	^ #FMULS
]

{ #category : 'accessing' }
AvrOpFMULS >> opcode [

	^ 16r0380
]
