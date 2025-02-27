Class {
	#name : 'AvrOpBRTS',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpBRTS >> description [

	^ 'branch if the T bit is set'
]

{ #category : 'accessing' }
AvrOpBRTS >> mnemonic [

	^ #BRTS
]

{ #category : 'accessing' }
AvrOpBRTS >> opcode [

	^ 16rF006
]
