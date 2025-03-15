Trait {
	#name : 'TAvrBranchOp',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrBranchOp >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
TAvrBranchOp >> fromWord: anInteger [

	self immediate: (anInteger >> 3 expandSignWith: 16r7F)
]

{ #category : 'accessing' }
TAvrBranchOp >> immediateRange [

	^ -64 to: 63
]

{ #category : 'testing' }
TAvrBranchOp >> isRelative [

	^ true
]

{ #category : 'accessing' }
TAvrBranchOp >> opcodeMask [

	^ 16rFC07
]

{ #category : 'accessing' }
TAvrBranchOp >> operand [

	^ (self immediate bitAnd: 16r7F) << 3
]

{ #category : 'accessing' }
TAvrBranchOp >> operandText [

	^ self printRelativeAddress: self immediate
]
