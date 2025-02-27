Class {
	#name : 'AvrOpMUL',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpMUL >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpMUL >> description [

	^ 'multiply unsigned'
]

{ #category : 'accessing' }
AvrOpMUL >> mnemonic [

	^ #MUL
]

{ #category : 'accessing' }
AvrOpMUL >> opcode [

	^ 16r9C00
]
