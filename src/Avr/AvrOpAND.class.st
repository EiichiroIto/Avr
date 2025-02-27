Class {
	#name : 'AvrOpAND',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpAND >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpAND >> description [

	^ 'logical AND'
]

{ #category : 'accessing' }
AvrOpAND >> mnemonic [

	^ #AND
]

{ #category : 'accessing' }
AvrOpAND >> opcode [

	^ 16r2000
]
