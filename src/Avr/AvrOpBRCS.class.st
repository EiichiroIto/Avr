Class {
	#name : 'AvrOpBRCS',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpBRCS >> description [

	^ 'branch if carry set'
]

{ #category : 'accessing' }
AvrOpBRCS >> mnemonic [

	^ #BRCS
]

{ #category : 'accessing' }
AvrOpBRCS >> opcode [

	^ 16rF000
]
