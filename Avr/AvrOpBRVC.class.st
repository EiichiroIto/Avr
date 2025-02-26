Class {
	#name : 'AvrOpBRVC',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpBRVC >> description [

	^ 'branch if overflow cleared'
]

{ #category : 'accessing' }
AvrOpBRVC >> mnemonic [

	^ #BRVC
]

{ #category : 'accessing' }
AvrOpBRVC >> opcode [

	^ 16rF403
]
