Class {
	#name : 'AvrOpLDDY',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp4',
	#classTraits : 'TAvrRegisterAndImmediateOp4 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpLDDY >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLDDY >> description [

	^ 'load indirect from data space to register using index Y with displacement'
]

{ #category : 'accessing' }
AvrOpLDDY >> mnemonic [

	^ #LDD
]

{ #category : 'accessing' }
AvrOpLDDY >> opcode [

	^ 16r8008
]

{ #category : 'accessing' }
AvrOpLDDY >> operandText [

	^ self registerString , ', Y+' , (self printDecImmediate: immediate)
]

{ #category : 'accessing' }
AvrOpLDDY >> selector [

	^ #lddR:y:
]
