Class {
	#name : 'AvrOpSWAP',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSWAP >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpSWAP >> description [

	^ 'swap nibbles'
]

{ #category : 'accessing' }
AvrOpSWAP >> mnemonic [

	^ #SWAP
]

{ #category : 'accessing' }
AvrOpSWAP >> opcode [

	^ 16r9402
]

{ #category : 'accessing' }
AvrOpSWAP >> selector [

	^ #swap:
]
