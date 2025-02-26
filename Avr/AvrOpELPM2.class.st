Class {
	#name : 'AvrOpELPM2',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpELPM2 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpELPM2 >> description [

	^ 'extended load program memory using index Z'
]

{ #category : 'accessing' }
AvrOpELPM2 >> mnemonic [

	^ #ELPM
]

{ #category : 'accessing' }
AvrOpELPM2 >> opcode [

	^ 16r9006
]

{ #category : 'accessing' }
AvrOpELPM2 >> operandText [

	^ self registerString , ', Z'
]

{ #category : 'accessing' }
AvrOpELPM2 >> selector [

	^ #elpmz:
]
