Class {
	#name : 'AvrOpBRLT',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
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
