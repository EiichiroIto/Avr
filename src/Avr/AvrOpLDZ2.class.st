Class {
	#name : 'AvrOpLDZ2',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpLDZ2 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLDZ2 >> description [

	^ 'load indirect from data space to register using index Z post increment'
]

{ #category : 'accessing' }
AvrOpLDZ2 >> mnemonic [

	^ #LD
]

{ #category : 'accessing' }
AvrOpLDZ2 >> opcode [

	^ 16r9001
]

{ #category : 'accessing' }
AvrOpLDZ2 >> operandText [

	^ self registerString , ', Z+'
]

{ #category : 'accessing' }
AvrOpLDZ2 >> selector [

	^ #ldzInc:
]
