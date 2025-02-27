Class {
	#name : 'AvrOpSBC',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpSBC >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpSBC >> description [

	^ 'subtract with carry'
]

{ #category : 'accessing' }
AvrOpSBC >> mnemonic [

	^ #SBC
]

{ #category : 'accessing' }
AvrOpSBC >> opcode [

	^ 16r0800
]
