Class {
	#name : 'AvrOpIN',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrInputOutputOp',
	#classTraits : 'TAvrInputOutputOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpIN >> category [

	^ #dataTransfer
]

{ #category : 'accessing' }
AvrOpIN >> description [

	^ 'load an I/O location to register'
]

{ #category : 'accessing' }
AvrOpIN >> mnemonic [

	^ #IN
]

{ #category : 'accessing' }
AvrOpIN >> opcode [

	^ 16rB000
]

{ #category : 'as yet unclassified' }
AvrOpIN >> selector [

	^ #inR:address:
]
