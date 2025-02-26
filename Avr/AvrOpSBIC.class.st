Class {
	#name : 'AvrOpSBIC',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrIORegAndBitOp',
	#classTraits : 'TAvrIORegAndBitOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSBIC >> description [

	^ 'skip if bit in I/O register is cleared'
]

{ #category : 'accessing' }
AvrOpSBIC >> mnemonic [

	^ #SBIC
]

{ #category : 'accessing' }
AvrOpSBIC >> opcode [

	^ 16r9900
]
