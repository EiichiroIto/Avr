Class {
	#name : 'AvrOpSTZ3',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSTZ3 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpSTZ3 >> description [

	^ 'store indirect from register to data space using index Z pre decrement'
]

{ #category : 'accessing' }
AvrOpSTZ3 >> mnemonic [

	^ #ST
]

{ #category : 'accessing' }
AvrOpSTZ3 >> opcode [

	^ 16r9202
]

{ #category : 'accessing' }
AvrOpSTZ3 >> operandText [

	^ '-Z, ' , self registerString
]

{ #category : 'accessing' }
AvrOpSTZ3 >> selector [

	^ #stzDec:
]
