Class {
	#name : 'AvrOpORI',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp1',
	#classTraits : 'TAvrRegisterAndImmediateOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpORI >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpORI >> description [

	^ 'logical OR with immediate'
]

{ #category : 'accessing' }
AvrOpORI >> mnemonic [

	^ #ORI
]

{ #category : 'accessing' }
AvrOpORI >> opcode [

	^ 16r6000
]
