Class {
	#name : 'AvrOpSEC',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpSEC >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpSEC >> description [

	^ 'set carry flag'
]

{ #category : 'accessing' }
AvrOpSEC >> mnemonic [

	^ #SEC
]

{ #category : 'accessing' }
AvrOpSEC >> opcode [

	^ 16r9408
]

{ #category : 'accessing' }
AvrOpSEC >> selector [

	^ #sec
]
