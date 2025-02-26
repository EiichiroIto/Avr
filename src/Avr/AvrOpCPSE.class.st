Class {
	#name : 'AvrOpCPSE',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpCPSE >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
AvrOpCPSE >> description [

	^ 'compare skip if equal'
]

{ #category : 'accessing' }
AvrOpCPSE >> mnemonic [

	^ #CPSE
]

{ #category : 'accessing' }
AvrOpCPSE >> opcode [

	^ 16r1000
]
