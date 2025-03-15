Trait {
	#name : 'TAvrRegisterAndImmediateOp2',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp2 >> fromWord: anInteger [

	| data |
	self register: (anInteger >> 4 bitAnd: 2r11) * 2 + 24.
	data := (anInteger bitAnd: 2r001111) bitOr:
		        (anInteger >> 2 bitAnd: 2r110000).
	self immediate: data
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp2 >> immediateRange [

	^ 0 to: 63
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp2 >> opcodeMask [

	^ 16rFF00
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp2 >> operand [

	^ (self register - 24 // 2 bitAnd: 2r11) << 4 bitOr:
		  ((self immediate bitAnd: 2r001111) bitOr:
			   (self immediate bitAnd: 2r110000) << 2)
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp2 >> registerRange [

	^ #( 24 26 28 30 )
]
