Class {
	#name : 'AvrOpLDDZ',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp4',
	#classTraits : 'TAvrRegisterAndImmediateOp4 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpLDDZ >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLDDZ >> description [

	^ 'load indirect from data space to register using index Z with displacement'
]

{ #category : 'accessing' }
AvrOpLDDZ >> mnemonic [

	^ #LDD
]

{ #category : 'accessing' }
AvrOpLDDZ >> opcode [

	^ 16r8000
]

{ #category : 'accessing' }
AvrOpLDDZ >> operandText [

	^ self registerString , ', Z+' , (self printDecImmediate: immediate)
]

{ #category : 'accessing' }
AvrOpLDDZ >> selector [

	^ #lddR:z:
]
