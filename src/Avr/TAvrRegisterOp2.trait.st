Trait {
	#name : 'TAvrRegisterOp2',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
TAvrRegisterOp2 >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
TAvrRegisterOp2 >> operand [

	^ (self register bitAnd: 2r111) << 4
]

{ #category : 'accessing' }
TAvrRegisterOp2 >> registerRange [

	^ 0 to: 7
]
