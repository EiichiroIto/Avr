Class {
	#name : 'AvrOpSTDY',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp4',
	#classTraits : 'TAvrRegisterAndImmediateOp4 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSTDY >> arguments [

	^ Array with: immediate with: register
]

{ #category : 'accessing' }
AvrOpSTDY >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpSTDY >> description [

	^ 'store indirect from register to data space using index Y with displacement'
]

{ #category : 'accessing' }
AvrOpSTDY >> mnemonic [

	^ #STD
]

{ #category : 'accessing' }
AvrOpSTDY >> opcode [

	^ 16r8208
]

{ #category : 'accessing' }
AvrOpSTDY >> operandText [

	^ 'Y+' , (self printDecImmediate: immediate) , ', '
	  , self registerString
]

{ #category : 'accessing' }
AvrOpSTDY >> selector [

	^ #stdY:r:
]
