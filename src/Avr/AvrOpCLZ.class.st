Class {
	#name : 'AvrOpCLZ',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpCLZ >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpCLZ >> description [

	^ 'clear zero flag'
]

{ #category : 'accessing' }
AvrOpCLZ >> mnemonic [

	^ #CLZ
]

{ #category : 'accessing' }
AvrOpCLZ >> opcode [

	^ 16r9498
]

{ #category : 'accessing' }
AvrOpCLZ >> selector [

	^ #clz
]
