Trait {
	#name : 'TAvrTwoRegistersOp2',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
TAvrTwoRegistersOp2 >> destRange [

	^ 0 to: 30 by: 2
]

{ #category : 'accessing' }
TAvrTwoRegistersOp2 >> operand [

	^ ((self source // 2) bitAnd: 2r1111) bitOr: ((self dest // 2) bitAnd: 2r1111) << 4
]

{ #category : 'accessing' }
TAvrTwoRegistersOp2 >> sourceRange [

	^ 0 to: 30 by: 2
]
