Class {
	#name : 'AvrOpMULS',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp3',
	#classTraits : 'TAvrTwoRegistersOp3 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpMULS >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpMULS >> description [

	^ 'multiply signed'
]

{ #category : 'accessing' }
AvrOpMULS >> mnemonic [

	^ #MULS
]

{ #category : 'accessing' }
AvrOpMULS >> opcode [

	^ 16r0200
]
