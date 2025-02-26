Class {
	#name : 'AvrOpSTZ1',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSTZ1 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpSTZ1 >> description [

	^ 'store indirect from register to data space using index Z'
]

{ #category : 'accessing' }
AvrOpSTZ1 >> mnemonic [

	^ #ST
]

{ #category : 'accessing' }
AvrOpSTZ1 >> opcode [

	^ 16r8200
]

{ #category : 'accessing' }
AvrOpSTZ1 >> operandText [

	^ 'Z, ' , self registerString
]

{ #category : 'accessing' }
AvrOpSTZ1 >> selector [

	^ #stz:
]
