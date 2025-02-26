Trait {
	#name : 'TAvrRelativeOp',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
TAvrRelativeOp >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
TAvrRelativeOp >> immediateRange [

	^ -2048 to: 2047
]

{ #category : 'testing' }
TAvrRelativeOp >> isRelative [

	^ true
]

{ #category : 'accessing' }
TAvrRelativeOp >> operand [

	^ self immediate bitAnd: 16r0FFF
]

{ #category : 'accessing' }
TAvrRelativeOp >> operandText [

	^ self printRelativeAddress: self immediate
]
