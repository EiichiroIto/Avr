Class {
	#name : 'AvrOpSEC',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
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
