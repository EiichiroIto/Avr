Class {
	#name : 'AvrOpJMP',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrAbsoluteOp',
	#classTraits : 'TAvrAbsoluteOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
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
