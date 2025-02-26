Trait {
	#name : 'TAvrRegisterAndImmediateOp1',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp1 >> immediateRange [

	^ 0 to: 255
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp1 >> operand [

	^ ((self register - 16) bitAnd: 2r1111) << 4 bitOr:
		  ((self immediate bitAnd: 16r0F) bitOr:
			   (self immediate bitAnd: 16rF0) << 4)
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp1 >> registerRange [

	^ 16 to: 31
]
