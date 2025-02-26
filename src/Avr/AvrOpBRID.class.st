Class {
	#name : 'AvrOpBRID',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpBRID >> description [

	^ 'branch if global interrupt is disabled'
]

{ #category : 'accessing' }
AvrOpBRID >> mnemonic [

	^ #BRID
]

{ #category : 'accessing' }
AvrOpBRID >> opcode [

	^ 16rF407
]
