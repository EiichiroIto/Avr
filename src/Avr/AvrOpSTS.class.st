Class {
	#name : 'AvrOpSTS',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp3',
	#classTraits : 'TAvrRegisterAndImmediateOp3 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSTS >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpSTS >> description [

	^ 'store direct to data space'
]

{ #category : 'accessing' }
AvrOpSTS >> mnemonic [

	^ #STS
]

{ #category : 'accessing' }
AvrOpSTS >> opcode [

	^ 16r9200
]

{ #category : 'accessing' }
AvrOpSTS >> operandText [

	^ (self printHexImmediate: immediate) , ', ' , self registerString
]
