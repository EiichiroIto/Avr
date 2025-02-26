Class {
	#name : 'AvrOpSTY1',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSTY1 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpSTY1 >> description [

	^ 'store indirect from register to data space using index Y'
]

{ #category : 'accessing' }
AvrOpSTY1 >> mnemonic [

	^ #ST
]

{ #category : 'accessing' }
AvrOpSTY1 >> opcode [

	^ 16r8208
]

{ #category : 'accessing' }
AvrOpSTY1 >> operandText [

	^ 'Y, ' , self registerString
]

{ #category : 'accessing' }
AvrOpSTY1 >> selector [

	^ #sty:
]
