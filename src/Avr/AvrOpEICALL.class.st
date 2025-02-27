Class {
	#name : 'AvrOpEICALL',
	#superclass : 'AvrNoOperand',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOpEICALL >> category [

	^ #changeOfFlow
]

{ #category : 'accessing' }
AvrOpEICALL >> description [

	^ 'extended indirect call to a subroutine'
]

{ #category : 'accessing' }
AvrOpEICALL >> mnemonic [

	^ #EICALL
]

{ #category : 'accessing' }
AvrOpEICALL >> opcode [

	^ 16r9519
]

{ #category : 'accessing' }
AvrOpEICALL >> selector [

	^ #eicall
]
