Class {
	#name : 'AvrOpLDI',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp1',
	#classTraits : 'TAvrRegisterAndImmediateOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpLDI >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLDI >> description [

	^ 'load immediate'
]

{ #category : 'accessing' }
AvrOpLDI >> mnemonic [

	^ #LDI
]

{ #category : 'accessing' }
AvrOpLDI >> opcode [

	^ 16re000
]
