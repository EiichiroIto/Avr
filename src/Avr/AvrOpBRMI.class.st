Class {
	#name : 'AvrOpBRMI',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
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
