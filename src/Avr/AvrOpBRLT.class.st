Class {
	#name : 'AvrOpBRLT',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpBRLT >> description [

	^ 'branch if less than (signed)'
]

{ #category : 'accessing' }
AvrOpBRLT >> mnemonic [

	^ #BRLT
]

{ #category : 'accessing' }
AvrOpBRLT >> opcode [

	^ 16rF004
]
