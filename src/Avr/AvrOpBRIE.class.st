Class {
	#name : 'AvrOpBRIE',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpBRIE >> description [

	^ 'branch if global interrupt is enabled'
]

{ #category : 'accessing' }
AvrOpBRIE >> mnemonic [

	^ #BRIE
]

{ #category : 'accessing' }
AvrOpBRIE >> opcode [

	^ 16rF007
]
