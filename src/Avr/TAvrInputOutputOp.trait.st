Trait {
	#name : 'TAvrInputOutputOp',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrInputOutputOp >> fromWord: anInteger [

	| data |
	self register: (anInteger >> 4 bitAnd: 2r11111).
	data := (anInteger bitAnd: 2r001111) bitOr:
		        (anInteger >> 5 bitAnd: 2r110000).
	self immediate: data
]

{ #category : 'accessing' }
TAvrInputOutputOp >> immediateRange [

	^ 0 to: 63
]

{ #category : 'accessing' }
TAvrInputOutputOp >> opcodeMask [

	^ 16rF800
]

{ #category : 'accessing' }
TAvrInputOutputOp >> operand [

	^ (self register bitAnd: 2r11111) << 4 bitOr:
		  ((self immediate bitAnd: 2r001111) bitOr:
			   ((self immediate bitAnd: 2r110000) << 5))
]

{ #category : 'accessing' }
TAvrInputOutputOp >> registerRange [

	^ 0 to: 31
]
