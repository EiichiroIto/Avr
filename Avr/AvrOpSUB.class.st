Class {
	#name : 'AvrOpSUB',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSUB >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpSUB >> description [

	^ 'subtract without carry'
]

{ #category : 'accessing' }
AvrOpSUB >> mnemonic [

	^ #SUB
]

{ #category : 'accessing' }
AvrOpSUB >> opcode [

	^ 16r1800
]
