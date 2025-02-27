Class {
	#name : 'AvrOpADC',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpADC >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpADC >> description [

	^ 'add with carry'
]

{ #category : 'accessing' }
AvrOpADC >> mnemonic [

	^ #ADC
]

{ #category : 'accessing' }
AvrOpADC >> opcode [

	^ 16r1c00
]
