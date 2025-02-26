Class {
	#name : 'AvrOpBRHC',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpBRHC >> description [

	^ 'branch if half carry flag is cleared'
]

{ #category : 'accessing' }
AvrOpBRHC >> mnemonic [

	^ #BRHC
]

{ #category : 'accessing' }
AvrOpBRHC >> opcode [

	^ 16rF405
]
