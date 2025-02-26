Class {
	#name : 'AvrSemiWord',
	#superclass : 'AvrImmediate',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrSemiWord >> category [

	^ #semi
]

{ #category : 'accessing' }
AvrSemiWord >> description [

	^ 'Program data'
]

{ #category : 'accessing' }
AvrSemiWord >> immediateRange [

	^ 0 to: 63355
]

{ #category : 'accessing' }
AvrSemiWord >> mnemonic [

	^ #'.WORD'
]

{ #category : 'accessing' }
AvrSemiWord >> opcode [

	^ 0
]

{ #category : 'accessing' }
AvrSemiWord >> operand [

	^ immediate bitAnd: 16rFFFF
]

{ #category : 'accessing' }
AvrSemiWord >> operandText [

	immediate ifNil: [ ^ 'nil' ].
	^ '0x' , immediate printStringHex
]

{ #category : 'accessing' }
AvrSemiWord >> selector [

	^ #word:
]
