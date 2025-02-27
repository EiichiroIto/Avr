Class {
	#name : 'AvrOpSTDZ',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp4',
	#classTraits : 'TAvrRegisterAndImmediateOp4 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSTDZ >> arguments [

	^ Array with: immediate with: register
]

{ #category : 'accessing' }
AvrOpSTDZ >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpSTDZ >> description [

	^ 'store indirect from register to data space using index Z with displacement'
]

{ #category : 'accessing' }
AvrOpSTDZ >> mnemonic [

	^ #STD
]

{ #category : 'accessing' }
AvrOpSTDZ >> opcode [

	^ 16r8200
]

{ #category : 'accessing' }
AvrOpSTDZ >> operandText [

	^ 'Z+' , (self printDecImmediate: immediate) , ', '
	  , self registerString
]

{ #category : 'accessing' }
AvrOpSTDZ >> selector [

	^ #stdZ:r:
]
