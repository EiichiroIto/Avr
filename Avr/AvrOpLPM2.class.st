Class {
	#name : 'AvrOpLPM2',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpLPM2 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLPM2 >> description [

	^ 'load program memory using index Z'
]

{ #category : 'accessing' }
AvrOpLPM2 >> mnemonic [

	^ #LPM
]

{ #category : 'accessing' }
AvrOpLPM2 >> opcode [

	^ 16r9004
]

{ #category : 'accessing' }
AvrOpLPM2 >> operandText [

	^ self registerString , ', Z'
]

{ #category : 'accessing' }
AvrOpLPM2 >> selector [

	^ #lpmz:
]
