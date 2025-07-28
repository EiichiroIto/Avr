Class {
	#name : 'AvrRegisterFrame',
	#superclass : 'Object',
	#instVars : [
		'unusedRegisters'
	],
	#category : 'Avr-Assembly',
	#package : 'Avr',
	#tag : 'Assembly'
}

{ #category : 'api' }
AvrRegisterFrame >> allocateRegisters: aCollection [

	^ unusedRegisters removeAll: aCollection
]

{ #category : 'api' }
AvrRegisterFrame >> allocateRegistersCount: anInteger [

	^ unusedRegisters removeFirst: anInteger
]

{ #category : 'api' }
AvrRegisterFrame >> checkAnyRegistersAvailable: aCollection [

	aCollection ifNil: [ ^ false ].
	^ unusedRegisters includesAny: aCollection
]

{ #category : 'checking' }
AvrRegisterFrame >> checkReadRegister: anInteger [

	self subclassResponsibility
]

{ #category : 'checking' }
AvrRegisterFrame >> checkWriteRegister: anInteger [

	self subclassResponsibility
]

{ #category : 'api' }
AvrRegisterFrame >> freeRegisters: aCollection [

	(unusedRegisters includesAny: aCollection) ifTrue: [ self error ].
	unusedRegisters addAll: aCollection.
	unusedRegisters sort
]

{ #category : 'api' }
AvrRegisterFrame >> pushRegister: anInteger [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrRegisterFrame >> unusedRegisters [

	^ unusedRegisters
]

{ #category : 'accessing' }
AvrRegisterFrame >> unusedRegisters: anObject [

	unusedRegisters := anObject
]
