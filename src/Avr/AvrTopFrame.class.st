Class {
	#name : 'AvrTopFrame',
	#superclass : 'AvrRegisterFrame',
	#category : 'Avr-Assembly',
	#package : 'Avr',
	#tag : 'Assembly'
}

{ #category : 'checking' }
AvrTopFrame >> checkReadRegister: anInteger [

	^ true
]

{ #category : 'checking' }
AvrTopFrame >> checkWriteRegister: anInteger [

	^ true
]

{ #category : 'initialization' }
AvrTopFrame >> initialize [

	super initialize.
	unusedRegisters := (0 to: 31) asOrderedCollection
]

{ #category : 'api' }
AvrTopFrame >> pushRegister: anInteger [

	"do nothing"
]
