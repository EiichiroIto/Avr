Class {
	#name : 'AvrOpJMP',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrAbsoluteOp',
	#classTraits : 'TAvrAbsoluteOp classTrait',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpJMP >> description [

	^ 'jump'
]

{ #category : 'accessing' }
AvrOpJMP >> mnemonic [

	^ #JMP
]

{ #category : 'accessing' }
AvrOpJMP >> opcode [

	^ 16r940C
]
