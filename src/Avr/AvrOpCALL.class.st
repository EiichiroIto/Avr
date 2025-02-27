Class {
	#name : 'AvrOpCALL',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrAbsoluteOp',
	#classTraits : 'TAvrAbsoluteOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpCALL >> description [

	^ 'long call to a subroutine'
]

{ #category : 'accessing' }
AvrOpCALL >> mnemonic [

	^ #CALL
]

{ #category : 'accessing' }
AvrOpCALL >> opcode [

	^ 16r940E
]
