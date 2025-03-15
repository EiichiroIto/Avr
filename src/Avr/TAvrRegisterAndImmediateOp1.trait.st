Trait {
	#name : 'TAvrRegisterAndImmediateOp1',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp1 >> fromWord: anInteger [

	| data |
	self register: (anInteger >> 4 bitAnd: 2r1111) + 16.
	data := (anInteger bitAnd: 16r0F) bitOr:
		        (anInteger >> 4 bitAnd: 16rF0).
	self immediate: data
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp1 >> immediateRange [

	^ 0 to: 255
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp1 >> opcodeMask [

	^ 16rF000
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp1 >> operand [

	^ ((self register - 16) bitAnd: 2r1111) << 4 bitOr:
		  ((self immediate bitAnd: 16r0F) bitOr:
			   (self immediate bitAnd: 16rF0) << 4)
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp1 >> registerRange [

	^ 16 to: 31
]
