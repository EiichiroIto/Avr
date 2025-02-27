Class {
	#name : 'AvrOpBRGE',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpBRGE >> description [

	^ 'branch if greater or equal (signed)'
]

{ #category : 'accessing' }
AvrOpBRGE >> mnemonic [

	^ #BRGE
]

{ #category : 'accessing' }
AvrOpBRGE >> opcode [

	^ 16rF404
]
