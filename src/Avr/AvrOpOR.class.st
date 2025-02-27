Class {
	#name : 'AvrOpOR',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpOR >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpOR >> description [

	^ 'logical OR'
]

{ #category : 'accessing' }
AvrOpOR >> mnemonic [

	^ #OR
]

{ #category : 'accessing' }
AvrOpOR >> opcode [

	^ 16r2800
]
