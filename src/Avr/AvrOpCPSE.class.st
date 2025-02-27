Class {
	#name : 'AvrOpCPSE',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
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
