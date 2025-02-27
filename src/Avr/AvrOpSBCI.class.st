Class {
	#name : 'AvrOpSBCI',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndImmediateOp1',
	#classTraits : 'TAvrRegisterAndImmediateOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSBCI >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpSBCI >> description [

	^ 'subtract immediate with carry'
]

{ #category : 'accessing' }
AvrOpSBCI >> mnemonic [

	^ #SBCI
]

{ #category : 'accessing' }
AvrOpSBCI >> opcode [

	^ 16r4000
]
