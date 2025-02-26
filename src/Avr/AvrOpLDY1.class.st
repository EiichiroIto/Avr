Class {
	#name : 'AvrOpLDY1',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpLDY1 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLDY1 >> description [

	^ 'load indirect from data space to register using index Y'
]

{ #category : 'accessing' }
AvrOpLDY1 >> mnemonic [

	^ #LD
]

{ #category : 'accessing' }
AvrOpLDY1 >> opcode [

	^ 16r8008
]

{ #category : 'accessing' }
AvrOpLDY1 >> operandText [

	^ self registerString , ', Y'
]

{ #category : 'accessing' }
AvrOpLDY1 >> selector [

	^ #ldy:
]
