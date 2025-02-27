Class {
	#name : 'AvrOpCP',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpCP >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
AvrOpCP >> description [

	^ 'compare'
]

{ #category : 'accessing' }
AvrOpCP >> mnemonic [

	^ #CP
]

{ #category : 'accessing' }
AvrOpCP >> opcode [

	^ 16r1400
]
