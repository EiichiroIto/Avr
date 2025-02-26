Class {
	#name : 'AvrOpBRNE',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpBRNE >> description [

	^ 'branch if not equal'
]

{ #category : 'accessing' }
AvrOpBRNE >> mnemonic [

	^ #BRNE
]

{ #category : 'accessing' }
AvrOpBRNE >> opcode [

	^ 16rF401
]
