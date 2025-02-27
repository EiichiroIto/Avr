Class {
	#name : 'AvrOpBRVS',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpBRVS >> description [

	^ 'branch if overflow set'
]

{ #category : 'accessing' }
AvrOpBRVS >> mnemonic [

	^ #BRVS
]

{ #category : 'accessing' }
AvrOpBRVS >> opcode [

	^ 16rF003
]
