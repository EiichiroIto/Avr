Class {
	#name : 'AvrOpLDS',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp3',
	#classTraits : 'TAvrRegisterAndImmediateOp3 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpLDS >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLDS >> description [

	^ 'load direct from data space'
]

{ #category : 'accessing' }
AvrOpLDS >> mnemonic [

	^ #LDS
]

{ #category : 'accessing' }
AvrOpLDS >> opcode [

	^ 16r9000
]

{ #category : 'as yet unclassified' }
AvrOpLDS >> selector [

	^ #ldsR:address:
]
