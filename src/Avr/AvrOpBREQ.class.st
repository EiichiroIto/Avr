Class {
	#name : 'AvrOpBREQ',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpBREQ >> description [

	^ 'branch if equal'
]

{ #category : 'accessing' }
AvrOpBREQ >> mnemonic [

	^ #BREQ
]

{ #category : 'accessing' }
AvrOpBREQ >> opcode [

	^ 16rF001
]
