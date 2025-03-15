Trait {
	#name : 'TAvrTwoRegistersOp1',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrTwoRegistersOp1 >> destRange [

	^ 0 to: 31
]

{ #category : 'accessing' }
TAvrTwoRegistersOp1 >> fromWord: anInteger [

	self source:
		((anInteger bitAnd: 2r01111) bitOr: (anInteger >> 5 bitAnd: 2r10000)).
	self dest: (anInteger >> 4 bitAnd: 2r11111)
]

{ #category : 'accessing' }
TAvrTwoRegistersOp1 >> opcodeMask [

	^ 16rFC00
]

{ #category : 'accessing' }
TAvrTwoRegistersOp1 >> operand [

	^ (self source bitAnd: 2r01111) bitOr:
		  ((self source bitAnd: 2r10000) << 5 bitOr:
			   (self dest bitAnd: 2r11111) << 4)
]

{ #category : 'accessing' }
TAvrTwoRegistersOp1 >> sourceRange [

	^ 0 to: 31
]
