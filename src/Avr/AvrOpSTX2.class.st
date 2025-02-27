Class {
	#name : 'AvrOpSTX2',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSTX2 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpSTX2 >> description [

	^ 'store indirect from register to data space using index X post increment'
]

{ #category : 'accessing' }
AvrOpSTX2 >> mnemonic [

	^ #ST
]

{ #category : 'accessing' }
AvrOpSTX2 >> opcode [

	^ 16r920D
]

{ #category : 'accessing' }
AvrOpSTX2 >> operandText [

	^ 'X+, ' , self registerString
]

{ #category : 'accessing' }
AvrOpSTX2 >> selector [

	^ #stxInc:
]
