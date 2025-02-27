Trait {
	#name : 'TAvrRegisterAndImmediateOp3',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp3 >> extendedCode [

	^ self immediate bitAnd: 16rFFFF
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp3 >> immediateRange [

	^ 0 to: 65535
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp3 >> operand [

	^ (self register bitAnd: 2r11111) << 4
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp3 >> registerRange [

	^ 0 to: 31
]
