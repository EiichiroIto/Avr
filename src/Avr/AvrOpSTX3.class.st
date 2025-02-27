Class {
	#name : 'AvrOpSTX3',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSTX3 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpSTX3 >> description [

	^ 'store indirect from register to data space using index X pre decrement'
]

{ #category : 'accessing' }
AvrOpSTX3 >> mnemonic [

	^ #ST
]

{ #category : 'accessing' }
AvrOpSTX3 >> opcode [

	^ 16r920E
]

{ #category : 'accessing' }
AvrOpSTX3 >> operandText [

	^ '-X, ' , self registerString
]

{ #category : 'accessing' }
AvrOpSTX3 >> selector [

	^ #stxDec:
]
