Class {
	#name : 'AvrOpINC',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpINC >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpINC >> description [

	^ 'increment'
]

{ #category : 'accessing' }
AvrOpINC >> mnemonic [

	^ #INC
]

{ #category : 'accessing' }
AvrOpINC >> opcode [

	^ 16r9403
]

{ #category : 'accessing' }
AvrOpINC >> selector [

	^ #inc:
]
