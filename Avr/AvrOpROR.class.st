Class {
	#name : 'AvrOpROR',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpROR >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpROR >> description [

	^ 'rotate right through carry'
]

{ #category : 'accessing' }
AvrOpROR >> mnemonic [

	^ #ROR
]

{ #category : 'accessing' }
AvrOpROR >> opcode [

	^ 16r9407
]

{ #category : 'accessing' }
AvrOpROR >> selector [

	^ #ror:
]
