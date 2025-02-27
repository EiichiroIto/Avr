Class {
	#name : 'AvrOpADD',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpADD >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpADD >> description [

	^ 'add without carry'
]

{ #category : 'accessing' }
AvrOpADD >> mnemonic [

	^ #ADD
]

{ #category : 'accessing' }
AvrOpADD >> opcode [

	^ 16r0c00
]
