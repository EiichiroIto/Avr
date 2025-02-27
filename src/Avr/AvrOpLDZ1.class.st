Class {
	#name : 'AvrOpLDZ1',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpLDZ1 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLDZ1 >> description [

	^ 'load indirect from data space to register using index Z'
]

{ #category : 'accessing' }
AvrOpLDZ1 >> mnemonic [

	^ #LD
]

{ #category : 'accessing' }
AvrOpLDZ1 >> opcode [

	^ 16r8000
]

{ #category : 'accessing' }
AvrOpLDZ1 >> operandText [

	^ self registerString , ', Z'
]

{ #category : 'accessing' }
AvrOpLDZ1 >> selector [

	^ #ldz:
]
