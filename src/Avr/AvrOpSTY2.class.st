Class {
	#name : 'AvrOpSTY2',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSTY2 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpSTY2 >> description [

	^ 'store indirect from register to data space using index Y post increment'
]

{ #category : 'accessing' }
AvrOpSTY2 >> mnemonic [

	^ #ST
]

{ #category : 'accessing' }
AvrOpSTY2 >> opcode [

	^ 16r9209
]

{ #category : 'accessing' }
AvrOpSTY2 >> operandText [

	^ 'Y+, ' , self registerString
]

{ #category : 'accessing' }
AvrOpSTY2 >> selector [

	^ #styInc:
]
