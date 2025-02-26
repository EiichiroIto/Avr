Class {
	#name : 'AvrOpBRMI',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpBRMI >> description [

	^ 'branch if minus'
]

{ #category : 'accessing' }
AvrOpBRMI >> mnemonic [

	^ #BRMI
]

{ #category : 'accessing' }
AvrOpBRMI >> opcode [

	^ 16rF002
]
