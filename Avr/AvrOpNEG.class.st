Class {
	#name : 'AvrOpNEG',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpNEG >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpNEG >> description [

	^ 'two''s complement'
]

{ #category : 'accessing' }
AvrOpNEG >> mnemonic [

	^ #NEG
]

{ #category : 'accessing' }
AvrOpNEG >> opcode [

	^ 16r9401
]

{ #category : 'accessing' }
AvrOpNEG >> selector [

	^ #neg:
]
