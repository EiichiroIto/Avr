Class {
	#name : 'AvrOpPUSH',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpPUSH >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpPUSH >> description [

	^ 'push register on stack'
]

{ #category : 'accessing' }
AvrOpPUSH >> mnemonic [

	^ #PUSH
]

{ #category : 'accessing' }
AvrOpPUSH >> opcode [

	^ 16r920F
]

{ #category : 'accessing' }
AvrOpPUSH >> selector [

	^ #push:
]
