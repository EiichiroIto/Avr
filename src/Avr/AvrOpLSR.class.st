Class {
	#name : 'AvrOpLSR',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpLSR >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpLSR >> description [

	^ 'logical shift right'
]

{ #category : 'accessing' }
AvrOpLSR >> mnemonic [

	^ #LSR
]

{ #category : 'accessing' }
AvrOpLSR >> opcode [

	^ 16r9406
]

{ #category : 'accessing' }
AvrOpLSR >> selector [

	^ #lsr:
]
