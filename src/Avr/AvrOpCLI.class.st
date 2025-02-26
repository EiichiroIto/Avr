Class {
	#name : 'AvrOpCLI',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpCLI >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpCLI >> description [

	^ 'disable all interrupts'
]

{ #category : 'accessing' }
AvrOpCLI >> mnemonic [

	^ #CLI
]

{ #category : 'accessing' }
AvrOpCLI >> opcode [

	^ 16r94F8
]

{ #category : 'accessing' }
AvrOpCLI >> selector [

	^ #cli
]
