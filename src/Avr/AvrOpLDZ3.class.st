Class {
	#name : 'AvrOpLDZ3',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpLDZ3 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLDZ3 >> description [

	^ 'load indirect from data space to register using index Z pre decrement'
]

{ #category : 'accessing' }
AvrOpLDZ3 >> mnemonic [

	^ #LD
]

{ #category : 'accessing' }
AvrOpLDZ3 >> opcode [

	^ 16r9002
]

{ #category : 'accessing' }
AvrOpLDZ3 >> operandText [

	^ self registerString , ', -Z'
]

{ #category : 'accessing' }
AvrOpLDZ3 >> selector [

	^ #ldzDec:
]
