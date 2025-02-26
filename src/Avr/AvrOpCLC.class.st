Class {
	#name : 'AvrOpCLC',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpCLC >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpCLC >> description [

	^ 'clear carry flag'
]

{ #category : 'accessing' }
AvrOpCLC >> mnemonic [

	^ #CLC
]

{ #category : 'accessing' }
AvrOpCLC >> opcode [

	^ 16r9488
]

{ #category : 'accessing' }
AvrOpCLC >> selector [

	^ #clc
]
