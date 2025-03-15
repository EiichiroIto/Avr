Class {
	#name : 'AvrSemiWord',
	#superclass : 'AvrImmediate',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
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
AvrSemiWord >> fromWord: anInteger [

	self immediate: anInteger
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
AvrSemiWord >> opcodeMask [

	^ 16r0000
]

{ #category : 'accessing' }
AvrSemiWord >> operand [

	^ immediate bitAnd: 16rFFFF
]

{ #category : 'accessing' }
AvrSemiWord >> operandText [

	immediate ifNil: [ ^ 'nil' ].
	^ '0x' , (immediate printStringBase: 16 length: 4 padded: true)
]

{ #category : 'accessing' }
AvrSemiWord >> selector [

	^ #word:
]
