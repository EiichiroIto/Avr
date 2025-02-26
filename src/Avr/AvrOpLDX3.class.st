Class {
	#name : 'AvrOpLDX3',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpLDX3 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLDX3 >> description [

	^ 'load indirect from data space to register using index Y pre decrement'
]

{ #category : 'accessing' }
AvrOpLDX3 >> mnemonic [

	^ #LD
]

{ #category : 'accessing' }
AvrOpLDX3 >> opcode [

	^ 16r900E
]

{ #category : 'accessing' }
AvrOpLDX3 >> operandText [

	^ self registerString , ', -X'
]

{ #category : 'accessing' }
AvrOpLDX3 >> selector [

	^ #ldxDec:
]
