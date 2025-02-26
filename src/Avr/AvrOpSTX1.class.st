Class {
	#name : 'AvrOpSTX1',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSTX1 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpSTX1 >> description [

	^ 'store indirect from register to data space using index X'
]

{ #category : 'accessing' }
AvrOpSTX1 >> mnemonic [

	^ #ST
]

{ #category : 'accessing' }
AvrOpSTX1 >> opcode [

	^ 16r920C
]

{ #category : 'accessing' }
AvrOpSTX1 >> operandText [

	^ 'X, ' , self registerString
]

{ #category : 'accessing' }
AvrOpSTX1 >> selector [

	^ #stx:
]
