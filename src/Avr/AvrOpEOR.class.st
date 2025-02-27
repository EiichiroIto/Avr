Class {
	#name : 'AvrOpEOR',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpEOR >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpEOR >> description [

	^ 'logical EOR'
]

{ #category : 'accessing' }
AvrOpEOR >> mnemonic [

	^ #EOR
]

{ #category : 'accessing' }
AvrOpEOR >> opcode [

	^ 16r2400
]
