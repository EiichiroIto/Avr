Trait {
	#name : 'TAvrAbsoluteOp',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrAbsoluteOp >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
TAvrAbsoluteOp >> extendedCode [

	^ self immediate bitAnd: 16rFFFF
]

{ #category : 'accessing' }
TAvrAbsoluteOp >> immediateRange [

	^ 0 to: 2 ** 22 - 1
]

{ #category : 'testing' }
TAvrAbsoluteOp >> isAbsolute [

	^ true
]

{ #category : 'accessing' }
TAvrAbsoluteOp >> opcodeMask [

	^ 16rFE0E
]

{ #category : 'accessing' }
TAvrAbsoluteOp >> operand [

	^ self immediate >> 16 in: [ :high |
		  (high bitAnd: 16r01) bitOr: (high bitAnd: 16r3E) << 3 ]
]

{ #category : 'accessing' }
TAvrAbsoluteOp >> operandText [

	^ self printAbsoluteAddress: self immediate
]
