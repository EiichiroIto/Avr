Class {
	#name : 'AvrOpCP',
	#superclass : 'AvrTwoRegisters',
	#traits : 'TAvrTwoRegistersOp1',
	#classTraits : 'TAvrTwoRegistersOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
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
