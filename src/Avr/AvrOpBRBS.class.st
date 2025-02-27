Class {
	#name : 'AvrOpBRBS',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp5',
	#classTraits : 'TAvrRegisterAndImmediateOp5 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpBRBS >> description [

	^ 'branch if bit in SREG is set'
]

{ #category : 'accessing' }
AvrOpBRBS >> mnemonic [

	^ #BRBS
]

{ #category : 'accessing' }
AvrOpBRBS >> opcode [

	^ 16rF000
]
