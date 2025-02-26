Class {
	#name : 'AvrOpLDY2',
	#superclass : 'AvrOneRegister',
	#traits : 'TAvrRegisterOp1',
	#classTraits : 'TAvrRegisterOp1 classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpLDY2 >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpLDY2 >> description [

	^ 'load indirect from data space to register using index Y post increment'
]

{ #category : 'accessing' }
AvrOpLDY2 >> mnemonic [

	^ #LD
]

{ #category : 'accessing' }
AvrOpLDY2 >> opcode [

	^ 16r9009
]

{ #category : 'accessing' }
AvrOpLDY2 >> operandText [

	^ self registerString , ', Y+'
]

{ #category : 'accessing' }
AvrOpLDY2 >> selector [

	^ #ldyInc:
]
