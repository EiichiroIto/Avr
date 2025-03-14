Trait {
	#name : 'TAvrTwoRegistersOp4',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrTwoRegistersOp4 >> destRange [

	^ 16 to: 23
]

{ #category : 'accessing' }
TAvrTwoRegistersOp4 >> fromWord: anInteger [

	self source: (anInteger bitAnd: 2r111) + 16.
	self dest: (anInteger >> 4 bitAnd: 2r111) + 16
]

{ #category : 'accessing' }
TAvrTwoRegistersOp4 >> opcodeMask [

	^ 16rFF88
]

{ #category : 'accessing' }
TAvrTwoRegistersOp4 >> operand [

	^ (self source bitAnd: 2r111) bitOr: (self dest bitAnd: 2r111) << 4
]

{ #category : 'accessing' }
TAvrTwoRegistersOp4 >> sourceRange [

	^ 16 to: 23
]
