Class {
	#name : 'AvrOpPOP',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpPOP >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpPOP >> description [

	^ 'pop register from stack'
]

{ #category : 'accessing' }
AvrOpPOP >> mnemonic [

	^ #POP
]

{ #category : 'accessing' }
AvrOpPOP >> opcode [

	^ 16r900F
]

{ #category : 'accessing' }
AvrOpPOP >> selector [

	^ #pop:
]
