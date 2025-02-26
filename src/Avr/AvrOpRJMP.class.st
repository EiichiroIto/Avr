Class {
	#name : 'AvrOpRJMP',
	#superclass : 'AvrImmediate',
	#traits : 'TAvrRelativeOp',
	#classTraits : 'TAvrRelativeOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpRJMP >> description [

	^ 'relative jump'
]

{ #category : 'accessing' }
AvrOpRJMP >> mnemonic [

	^ #RJMP
]

{ #category : 'accessing' }
AvrOpRJMP >> opcode [

	^ 16rC000
]
