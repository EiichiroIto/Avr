Class {
	#name : 'AvrOpICALL',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpICALL >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
AvrOpICALL >> description [

	^ 'indirect call to a subroutine'
]

{ #category : 'accessing' }
AvrOpICALL >> mnemonic [

	^ #ICALL
]

{ #category : 'accessing' }
AvrOpICALL >> opcode [

	^ 16r9509
]

{ #category : 'accessing' }
AvrOpICALL >> selector [

	^ #icall
]
