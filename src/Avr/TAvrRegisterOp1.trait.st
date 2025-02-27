Trait {
	#name : 'TAvrRegisterOp1',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrRegisterOp1 >> operand [

	^ (self register bitAnd: 2r11111) << 4
]

{ #category : 'accessing' }
TAvrRegisterOp1 >> registerRange [

	^ 0 to: 31
]
