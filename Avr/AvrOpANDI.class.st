Class {
	#name : 'AvrOpANDI',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp1',
	#classTraits : 'TAvrRegisterAndImmediateOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpANDI >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpANDI >> description [

	^ 'logical AND with immediate'
]

{ #category : 'accessing' }
AvrOpANDI >> mnemonic [

	^ #ANDI
]

{ #category : 'accessing' }
AvrOpANDI >> opcode [

	^ 16r7000
]
