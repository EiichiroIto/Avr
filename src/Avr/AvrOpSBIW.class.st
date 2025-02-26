Class {
	#name : 'AvrOpSBIW',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp2',
	#classTraits : 'TAvrRegisterAndImmediateOp2 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSBIW >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpSBIW >> description [

	^ 'subtract immediate from word'
]

{ #category : 'accessing' }
AvrOpSBIW >> mnemonic [

	^ #SBIW
]

{ #category : 'accessing' }
AvrOpSBIW >> opcode [

	^ 16r9700
]
