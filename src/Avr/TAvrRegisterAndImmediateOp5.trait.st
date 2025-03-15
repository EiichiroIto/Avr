Trait {
	#name : 'TAvrRegisterAndImmediateOp5',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp5 >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp5 >> immediateRange [

	^ -64 to: 63
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp5 >> opcodeMask [

	^ 16rFC00
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp5 >> operand [

	^ (self register bitAnd: 2r111) bitOr:
		  (self immediate bitAnd: 2r1111111) << 3
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp5 >> registerRange [

	^ 0 to: 7
]
