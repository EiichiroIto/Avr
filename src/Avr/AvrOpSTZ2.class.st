Class {
	#name : 'AvrOpSTZ2',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSTZ2 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpSTZ2 >> description [

	^ 'store indirect from register to data space using index Z post increment'
]

{ #category : 'accessing' }
AvrOpSTZ2 >> mnemonic [

	^ #ST
]

{ #category : 'accessing' }
AvrOpSTZ2 >> opcode [

	^ 16r9201
]

{ #category : 'accessing' }
AvrOpSTZ2 >> operandText [

	^ 'Z+, ' , self registerString
]

{ #category : 'accessing' }
AvrOpSTZ2 >> selector [

	^ #stzInc:
]
