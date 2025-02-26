Class {
	#name : 'AvrOpSBI',
	#superclass : 'AvrInputOutput',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSBI >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpSBI >> description [

	^ 'set bit in I/O register'
]

{ #category : 'accessing' }
AvrOpSBI >> mnemonic [

	^ #SBI
]

{ #category : 'accessing' }
AvrOpSBI >> opcode [

	^ 16r9A00
]

{ #category : 'accessing' }
AvrOpSBI >> selector [

	^ #sbi:bit:
]
