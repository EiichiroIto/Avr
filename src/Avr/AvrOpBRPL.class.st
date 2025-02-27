Class {
	#name : 'AvrOpBRPL',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpBRPL >> description [

	^ 'branch if plus'
]

{ #category : 'accessing' }
AvrOpBRPL >> mnemonic [

	^ #BRPL
]

{ #category : 'accessing' }
AvrOpBRPL >> opcode [

	^ 16rF402
]
