Trait {
	#name : 'TAvrTwoRegistersOp3',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrTwoRegistersOp3 >> destRange [

	^ 16 to: 31
]

{ #category : 'accessing' }
TAvrTwoRegistersOp3 >> fromWord: anInteger [

	self source: (anInteger bitAnd: 2r1111) + 16.
	self dest: (anInteger >> 4 bitAnd: 2r1111) + 16
]

{ #category : 'accessing' }
TAvrTwoRegistersOp3 >> opcodeMask [

	^ 16rFF00
]

{ #category : 'accessing' }
TAvrTwoRegistersOp3 >> operand [

	^ (self source bitAnd: 2r1111) bitOr: (self dest bitAnd: 2r1111) << 4
]

{ #category : 'accessing' }
TAvrTwoRegistersOp3 >> sourceRange [

	^ 16 to: 31
]
