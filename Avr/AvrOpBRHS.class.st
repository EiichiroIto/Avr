Class {
	#name : 'AvrOpBRHS',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpBRHS >> description [

	^ 'branch if half carry flag is set'
]

{ #category : 'accessing' }
AvrOpBRHS >> mnemonic [

	^ #BRHS
]

{ #category : 'accessing' }
AvrOpBRHS >> opcode [

	^ 16rF005
]
