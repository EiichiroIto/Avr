Class {
	#name : 'AvrOpBCLR',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp2',
	#classTraits : 'TAvrRegisterOp2 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpBCLR >> description [

	^ 'bit clear in SREG'
]

{ #category : 'accessing' }
AvrOpBCLR >> mnemonic [

	^ #BCLR
]

{ #category : 'accessing' }
AvrOpBCLR >> opcode [

	^ 16r9488
]

{ #category : 'accessing' }
AvrOpBCLR >> selector [

	^ #bclr:
]
