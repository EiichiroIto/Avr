Class {
	#name : 'AvrOpLDY3',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpLDY3 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLDY3 >> description [

	^ 'load indirect from data space to register using index Y pre decrement'
]

{ #category : 'accessing' }
AvrOpLDY3 >> mnemonic [

	^ #LD
]

{ #category : 'accessing' }
AvrOpLDY3 >> opcode [

	^ 16r900A
]

{ #category : 'accessing' }
AvrOpLDY3 >> operandText [

	^ self registerString , ', -Y'
]

{ #category : 'accessing' }
AvrOpLDY3 >> selector [

	^ #ldyDec:
]
