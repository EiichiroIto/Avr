Trait {
	#name : 'TAvrTwoRegistersOp4',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
TAvrTwoRegistersOp4 >> destRange [

	^ 16 to: 23
]

{ #category : 'accessing' }
TAvrTwoRegistersOp4 >> operand [

	^ (self source bitAnd: 2r111) bitOr: (self dest bitAnd: 2r111) << 4
]

{ #category : 'accessing' }
TAvrTwoRegistersOp4 >> sourceRange [

	^ 16 to: 23
]
