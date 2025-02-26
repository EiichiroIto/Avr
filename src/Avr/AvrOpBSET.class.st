Class {
	#name : 'AvrOpBSET',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp2',
	#classTraits : 'TAvrRegisterOp2 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpBSET >> description [

	^ 'bit set in SREG'
]

{ #category : 'accessing' }
AvrOpBSET >> mnemonic [

	^ #BSET
]

{ #category : 'accessing' }
AvrOpBSET >> opcode [

	^ 16r9408
]

{ #category : 'accessing' }
AvrOpBSET >> selector [

	^ #bset:
]
