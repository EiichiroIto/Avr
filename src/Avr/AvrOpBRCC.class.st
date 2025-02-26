Class {
	#name : 'AvrOpBRCC',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpBRCC >> description [

	^ 'branch if carry cleared'
]

{ #category : 'accessing' }
AvrOpBRCC >> mnemonic [

	^ #BRCC
]

{ #category : 'accessing' }
AvrOpBRCC >> opcode [

	^ 16rF400
]
