Class {
	#name : 'AvrOpDEC',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpDEC >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpDEC >> description [

	^ 'decrement'
]

{ #category : 'accessing' }
AvrOpDEC >> mnemonic [

	^ #DEC
]

{ #category : 'accessing' }
AvrOpDEC >> opcode [

	^ 16r940A
]

{ #category : 'accessing' }
AvrOpDEC >> selector [

	^ #dec:
]
