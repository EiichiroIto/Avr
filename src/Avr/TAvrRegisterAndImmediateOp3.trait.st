Trait {
	#name : 'TAvrRegisterAndImmediateOp3',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp3 >> codeSize [

	^ 4
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp3 >> extendedCode [

	^ self immediate bitAnd: 16rFFFF
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp3 >> fromWord: anInteger [

	self error
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp3 >> fromWord: anInteger withExtended: anInteger2 [

	self register: (anInteger >> 4 bitAnd: 2r11111).
	self immediate: (anInteger2 bitAnd: 16rFFFF)
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp3 >> immediateRange [

	^ 0 to: 65535
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp3 >> opcodeMask [

	^ 16rFE0F
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp3 >> operand [

	^ (self register bitAnd: 2r11111) << 4
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp3 >> registerRange [

	^ 0 to: 31
]
