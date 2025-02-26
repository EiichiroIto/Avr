Class {
	#name : 'AvrOpBRPL',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
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
