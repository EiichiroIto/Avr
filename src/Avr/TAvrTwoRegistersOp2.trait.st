Trait {
	#name : 'TAvrTwoRegistersOp2',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrTwoRegistersOp2 >> destRange [

	^ 0 to: 30 by: 2
]

{ #category : 'accessing' }
TAvrTwoRegistersOp2 >> fromWord: anInteger [

	self source: (anInteger bitAnd: 2r1111) * 2.
	self dest: (anInteger >> 4 bitAnd: 2r1111) * 2
]

{ #category : 'accessing' }
TAvrTwoRegistersOp2 >> opcodeMask [

	^ 16rFF00
]

{ #category : 'accessing' }
TAvrTwoRegistersOp2 >> operand [

	^ ((self source // 2) bitAnd: 2r1111) bitOr: ((self dest // 2) bitAnd: 2r1111) << 4
]

{ #category : 'accessing' }
TAvrTwoRegistersOp2 >> sourceRange [

	^ 0 to: 30 by: 2
]
