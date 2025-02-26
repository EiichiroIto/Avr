Class {
	#name : 'AvrOpBRBC',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp5',
	#classTraits : 'TAvrRegisterAndImmediateOp5 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpBRBC >> description [

	^ 'branch if bit in SREG is cleared'
]

{ #category : 'accessing' }
AvrOpBRBC >> mnemonic [

	^ #BRBC
]

{ #category : 'accessing' }
AvrOpBRBC >> opcode [

	^ 16rF400
]
