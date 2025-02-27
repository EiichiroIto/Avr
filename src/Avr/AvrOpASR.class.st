Class {
	#name : 'AvrOpASR',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpASR >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpASR >> description [

	^ 'arithmetic shift right'
]

{ #category : 'accessing' }
AvrOpASR >> mnemonic [

	^ #ASR
]

{ #category : 'accessing' }
AvrOpASR >> opcode [

	^ 16r9405
]

{ #category : 'accessing' }
AvrOpASR >> selector [

	^ #asr:
]
