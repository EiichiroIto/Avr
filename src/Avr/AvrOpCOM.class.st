Class {
	#name : 'AvrOpCOM',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpCOM >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpCOM >> description [

	^ 'one''s complement'
]

{ #category : 'accessing' }
AvrOpCOM >> mnemonic [

	^ #COM
]

{ #category : 'accessing' }
AvrOpCOM >> opcode [

	^ 16r9400
]

{ #category : 'accessing' }
AvrOpCOM >> selector [

	^ #com:
]
