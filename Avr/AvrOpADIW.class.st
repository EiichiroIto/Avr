Class {
	#name : 'AvrOpADIW',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp2',
	#classTraits : 'TAvrRegisterAndImmediateOp2 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpADIW >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpADIW >> description [

	^ 'add immediate to word'
]

{ #category : 'accessing' }
AvrOpADIW >> mnemonic [

	^ #ADIW
]

{ #category : 'accessing' }
AvrOpADIW >> opcode [

	^ 16r9600
]
