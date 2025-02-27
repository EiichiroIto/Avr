Class {
	#name : 'AvrOpSBRS',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndBitOp',
	#classTraits : 'TAvrRegisterAndBitOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSBRS >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
AvrOpSBRS >> description [

	^ 'skip if bit in register is set'
]

{ #category : 'accessing' }
AvrOpSBRS >> mnemonic [

	^ #SBRS
]

{ #category : 'accessing' }
AvrOpSBRS >> opcode [

	^ 16rFE00
]
