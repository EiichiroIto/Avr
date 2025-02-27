Class {
	#name : 'AvrOpRCALL',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrRelativeOp',
	#classTraits : 'TAvrRelativeOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpRCALL >> description [

	^ 'relative call to a subroutine'
]

{ #category : 'accessing' }
AvrOpRCALL >> mnemonic [

	^ #RCALL
]

{ #category : 'accessing' }
AvrOpRCALL >> opcode [

	^ 16rD000
]
