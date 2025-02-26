Class {
	#name : 'AvrOpLDX1',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpLDX1 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLDX1 >> description [

	^ 'load indirect from data space to register using index Y'
]

{ #category : 'accessing' }
AvrOpLDX1 >> mnemonic [

	^ #LD
]

{ #category : 'accessing' }
AvrOpLDX1 >> opcode [

	^ 16r900C
]

{ #category : 'accessing' }
AvrOpLDX1 >> operandText [

	^ self registerString , ', X'
]

{ #category : 'accessing' }
AvrOpLDX1 >> selector [

	^ #ldx:
]
