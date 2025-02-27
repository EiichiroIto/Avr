Class {
	#name : 'AvrOpBRTC',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrBranchOp',
	#classTraits : 'TAvrBranchOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpBRTC >> description [

	^ 'branch if the T bit is cleared'
]

{ #category : 'accessing' }
AvrOpBRTC >> mnemonic [

	^ #BRTC
]

{ #category : 'accessing' }
AvrOpBRTC >> opcode [

	^ 16rF406
]
