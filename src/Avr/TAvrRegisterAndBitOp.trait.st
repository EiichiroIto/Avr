Trait {
	#name : 'TAvrRegisterAndBitOp',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrRegisterAndBitOp >> immediateRange [

	^ 0 to: 7
]

{ #category : 'accessing' }
TAvrRegisterAndBitOp >> operand [

	^ (self register bitAnd: 2r11111) << 4 bitOr:
		  (self immediate bitAnd: 2r111)
]

{ #category : 'accessing' }
TAvrRegisterAndBitOp >> registerRange [

	^ 0 to: 31
]
