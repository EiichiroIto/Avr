Class {
	#name : 'AvrOpBLD',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndBitOp',
	#classTraits : 'TAvrRegisterAndBitOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpBLD >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpBLD >> description [

	^ 'bit load from T to register'
]

{ #category : 'accessing' }
AvrOpBLD >> mnemonic [

	^ #BLD
]

{ #category : 'accessing' }
AvrOpBLD >> opcode [

	^ 16rF800
]
