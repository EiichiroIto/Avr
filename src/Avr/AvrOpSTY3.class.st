Class {
	#name : 'AvrOpSTY3',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSTY3 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpSTY3 >> description [

	^ 'store indirect from register to data space using index Y pre decrement'
]

{ #category : 'accessing' }
AvrOpSTY3 >> mnemonic [

	^ #ST
]

{ #category : 'accessing' }
AvrOpSTY3 >> opcode [

	^ 16r920A
]

{ #category : 'accessing' }
AvrOpSTY3 >> operandText [

	^ '-Y, ' , self registerString
]

{ #category : 'accessing' }
AvrOpSTY3 >> selector [

	^ #styDec:
]
