Class {
	#name : 'AvrOpCBI',
	#superclass : 'AvrInputOutput',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpCBI >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpCBI >> description [

	^ 'clear bit in I/O register'
]

{ #category : 'accessing' }
AvrOpCBI >> mnemonic [

	^ #CBI
]

{ #category : 'accessing' }
AvrOpCBI >> opcode [

	^ 16r9800
]

{ #category : 'accessing' }
AvrOpCBI >> selector [

	^ #cbi:bit:
]
