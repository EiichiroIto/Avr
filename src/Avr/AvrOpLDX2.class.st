Class {
	#name : 'AvrOpLDX2',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpLDX2 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLDX2 >> description [

	^ 'load indirect from data space to register using index Y post increment'
]

{ #category : 'accessing' }
AvrOpLDX2 >> mnemonic [

	^ #LD
]

{ #category : 'accessing' }
AvrOpLDX2 >> opcode [

	^ 16r900D
]

{ #category : 'accessing' }
AvrOpLDX2 >> operandText [

	^ self registerString , ', X+'
]

{ #category : 'accessing' }
AvrOpLDX2 >> selector [

	^ #ldxInc:
]
