Class {
	#name : 'AvrOpSBRC',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndBitOp',
	#classTraits : 'TAvrRegisterAndBitOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSBRC >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
AvrOpSBRC >> description [

	^ 'skip if bit in register is cleared'
]

{ #category : 'accessing' }
AvrOpSBRC >> mnemonic [

	^ #SBRC
]

{ #category : 'accessing' }
AvrOpSBRC >> opcode [

	^ 16rFC00
]
