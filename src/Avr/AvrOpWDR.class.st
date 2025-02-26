Class {
	#name : 'AvrOpWDR',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpWDR >> category [

	^ #mcuControl
]

{ #category : 'accessing' }
AvrOpWDR >> description [

	^ 'watchdog reset'
]

{ #category : 'accessing' }
AvrOpWDR >> mnemonic [

	^ #WDR
]

{ #category : 'accessing' }
AvrOpWDR >> opcode [

	^ 16r95A8
]

{ #category : 'accessing' }
AvrOpWDR >> selector [

	^ #wdr
]
