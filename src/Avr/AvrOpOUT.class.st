Class {
	#name : 'AvrOpOUT',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrInputOutputOp',
	#classTraits : 'TAvrInputOutputOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'as yet unclassified' }
AvrOpOUT >> arguments [

	^ Array with: immediate with: register
]

{ #category : 'accessing' }
AvrOpOUT >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpOUT >> description [

	^ 'store register to I/O location'
]

{ #category : 'accessing' }
AvrOpOUT >> mnemonic [

	^ #OUT
]

{ #category : 'accessing' }
AvrOpOUT >> opcode [

	^ 16rB800
]

{ #category : 'accessing' }
AvrOpOUT >> operandText [

	^ (self printHexImmediate: immediate) , ', ' , self registerString
]

{ #category : 'accessing' }
AvrOpOUT >> selector [

	^ #out:r:
]
