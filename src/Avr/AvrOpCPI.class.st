Class {
	#name : 'AvrOpCPI',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp1',
	#classTraits : 'TAvrRegisterAndImmediateOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpCPI >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
AvrOpCPI >> description [

	^ 'compare with immediate'
]

{ #category : 'accessing' }
AvrOpCPI >> mnemonic [

	^ #CPI
]

{ #category : 'accessing' }
AvrOpCPI >> opcode [

	^ 16r3000
]
