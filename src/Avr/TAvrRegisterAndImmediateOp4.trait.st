Trait {
	#name : 'TAvrRegisterAndImmediateOp4',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp4 >> fromWord: anInteger [

	| data |
	self register: (anInteger >> 4 bitAnd: 2r011111).
	data := (anInteger bitAnd: 2r111) bitOr:
		        ((anInteger >> 7 bitAnd: 2r011000) bitOr:
			         (anInteger >> 8 bitAnd: 2r100000)).
	self immediate: data
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp4 >> immediateRange [

	^ 0 to: 63
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp4 >> opcodeMask [

	^ 16rD208
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp4 >> operand [

	^ (self register bitAnd: 2r011111) << 4 bitOr:
		  ((self immediate bitAnd: 2r111) bitOr:
			   ((self immediate bitAnd: 2r011000) << 7 bitOr:
				    (self immediate bitAnd: 2r100000) << 8))
]

{ #category : 'accessing' }
TAvrRegisterAndImmediateOp4 >> registerRange [

	^ 0 to: 31
]
