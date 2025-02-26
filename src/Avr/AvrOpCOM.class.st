Class {
	#name : 'AvrOpCOM',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
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
