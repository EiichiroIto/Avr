Class {
	#name : 'AvrOpCLH',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpCLH >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
AvrOpCLH >> description [

	^ 'clear half carry flag'
]

{ #category : 'accessing' }
AvrOpCLH >> mnemonic [

	^ #CLH
]

{ #category : 'accessing' }
AvrOpCLH >> opcode [

	^ 16r94D8
]

{ #category : 'accessing' }
AvrOpCLH >> selector [

	^ #clh
]
