Trait {
	#name : 'TAvrRegisterOp2',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrRegisterOp2 >> category [

	^ #bitAndBitTest
]

{ #category : 'accessing' }
TAvrRegisterOp2 >> fromWord: anInteger [

	self register: (anInteger >> 4 bitAnd: 2r111)
]

{ #category : 'accessing' }
TAvrRegisterOp2 >> opcodeMask [

	^ 16rFF8F
]

{ #category : 'accessing' }
TAvrRegisterOp2 >> operand [

	^ (self register bitAnd: 2r111) << 4
]

{ #category : 'accessing' }
TAvrRegisterOp2 >> registerRange [

	^ 0 to: 7
]
