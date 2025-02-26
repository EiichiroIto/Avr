Trait {
	#name : 'TAvrInputOutputOp',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
TAvrInputOutputOp >> immediateRange [

	^ 0 to: 63
]

{ #category : 'accessing' }
TAvrInputOutputOp >> operand [

	^ (self register bitAnd: 2r11111) << 4 bitOr:
		  ((self immediate bitAnd: 2r001111) bitOr:
			   ((self immediate bitAnd: 2r110000) << 5))
]

{ #category : 'accessing' }
TAvrInputOutputOp >> registerRange [

	^ 0 to: 31
]
