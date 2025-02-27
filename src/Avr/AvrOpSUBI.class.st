Class {
	#name : 'AvrOpSUBI',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp1',
	#classTraits : 'TAvrRegisterAndImmediateOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSUBI >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpSUBI >> description [

	^ 'subtract immediate'
]

{ #category : 'accessing' }
AvrOpSUBI >> mnemonic [

	^ #SUBI
]

{ #category : 'accessing' }
AvrOpSUBI >> opcode [

	^ 16r5000
]
