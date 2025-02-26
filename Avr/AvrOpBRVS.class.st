Class {
	#name : 'AvrOpBRVS',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
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
