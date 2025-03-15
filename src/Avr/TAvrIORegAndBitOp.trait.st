Trait {
	#name : 'TAvrIORegAndBitOp',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrIORegAndBitOp >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
TAvrIORegAndBitOp >> immediateRange [

	^ 0 to: 7
]

{ #category : 'accessing' }
TAvrIORegAndBitOp >> opcodeMask [

	^ 16rFF00
]

{ #category : 'accessing' }
TAvrIORegAndBitOp >> operand [

	^ (self register bitAnd: 2r11111) << 3 bitOr:
		  (self immediate bitAnd: 2r111)
]

{ #category : 'accessing' }
TAvrIORegAndBitOp >> operandText [

	^ (self immediate
		   ifNil: [ 'nil' ]
		   ifNotNil: [ :r | '0x' , r printStringHex ]) , ', '
	  , (self printDecImmediate: self register)
]

{ #category : 'accessing' }
TAvrIORegAndBitOp >> registerRange [

	^ 0 to: 31
]
