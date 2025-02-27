Class {
	#name : 'AvrOpLPM3',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpLPM3 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLPM3 >> description [

	^ 'load program memory using index Z post increment'
]

{ #category : 'accessing' }
AvrOpLPM3 >> mnemonic [

	^ #LPM
]

{ #category : 'accessing' }
AvrOpLPM3 >> opcode [

	^ 16r9005
]

{ #category : 'accessing' }
AvrOpLPM3 >> operandText [

	^ self registerString , ', Z+'
]

{ #category : 'accessing' }
AvrOpLPM3 >> selector [

	^ #lpmzInc:
]
