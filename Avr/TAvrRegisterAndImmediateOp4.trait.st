Trait {
	#name : 'TAvrRegisterAndImmediateOp4',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp4 >> immediateRange [

	^ 0 to: 63
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp4 >> operand [

	^ (self register bitAnd: 2r011111) << 4 bitOr:
		  ((self immediate bitAnd: 2r111) bitOr:
			   ((self immediate bitAnd: 2r011000) << 7 bitOr:
				    (self immediate bitAnd: 2r100000) << 8))
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp4 >> registerRange [

	^ 0 to: 31
]
