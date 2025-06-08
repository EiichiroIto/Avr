Trait {
	#name : 'TAvrRelativeOp',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrRelativeOp >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
TAvrRelativeOp >> fromWord: anInteger [

	self immediate: (anInteger expandSignWith: 16r0FFF)
]

{ #category : 'testing' }
TAvrRelativeOp >> hasAddress [

	^ true
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
TAvrRelativeOp >> opcodeMask [

	^ 16rF000
]

{ #category : 'accessing' }
TAvrRelativeOp >> operand [

	^ self immediate bitAnd: 16r0FFF
]

{ #category : 'accessing' }
TAvrRelativeOp >> operandText [

	^ self printRelativeAddress: self immediate
]

{ #category : 'accessing' }
TAvrRelativeOp >> realAddressFor: anInteger [

	^ anInteger + self codeSize + (self immediate * 2)
]
