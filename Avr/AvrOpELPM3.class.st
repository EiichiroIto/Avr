Class {
	#name : 'AvrOpELPM3',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpELPM3 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpELPM3 >> description [

	^ 'extended load program memory using index Z post increment'
]

{ #category : 'accessing' }
AvrOpELPM3 >> mnemonic [

	^ #ELPM
]

{ #category : 'accessing' }
AvrOpELPM3 >> opcode [

	^ 16r9007
]

{ #category : 'accessing' }
AvrOpELPM3 >> operandText [

	^ self registerString , ', Z+'
]

{ #category : 'accessing' }
AvrOpELPM3 >> selector [

	^ #elpmzInc:
]
