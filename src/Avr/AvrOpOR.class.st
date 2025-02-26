Class {
	#name : 'AvrOpOR',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
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
