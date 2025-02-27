Class {
	#name : 'AvrOpSBIS',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrIORegAndBitOp',
	#classTraits : 'TAvrIORegAndBitOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSBIS >> description [

	^ 'skip if bit in I/O register is set'
]

{ #category : 'accessing' }
AvrOpSBIS >> mnemonic [

	^ #SBIS
]

{ #category : 'accessing' }
AvrOpSBIS >> opcode [

	^ 16r9B00
]
