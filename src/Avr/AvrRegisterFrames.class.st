Class {
	#name : 'AvrRegisterFrames',
	#superclass : 'Object',
	#instVars : [
		'list'
	],
	#category : 'Avr-Assembly',
	#package : 'Avr',
	#tag : 'Assembly'
}

{ #category : 'api' }
AvrRegisterFrames >> allocateRegisters: aCollection [

	^ list first allocateRegisters: aCollection
]

{ #category : 'api' }
AvrRegisterFrames >> allocateRegistersCount: anInteger [

	^ list first allocateRegistersCount: anInteger
]

{ #category : 'api' }
AvrRegisterFrames >> checkAnyRegistersAvailable: aCollection [

	^ list first checkAnyRegistersAvailable: aCollection
]

{ #category : 'checking' }
AvrRegisterFrames >> checkReadRegister: anInteger [

	list first checkReadRegister: anInteger
]

{ #category : 'checking' }
AvrRegisterFrames >> checkWriteRegister: anInteger [

	list first checkWriteRegister: anInteger
]

{ #category : 'api' }
AvrRegisterFrames >> freeRegisters: aCollection [

	^ list first freeRegisters: aCollection
]

{ #category : 'accessing' }
AvrRegisterFrames >> list [

	^ list
]

{ #category : 'accessing' }
AvrRegisterFrames >> list: anObject [

	list := anObject
]

{ #category : 'api' }
AvrRegisterFrames >> pushRegister: anInteger [

	list first pushRegister: anInteger
]

{ #category : 'api' }
AvrRegisterFrames >> releaseFrame [

	list removeFirst
]

{ #category : 'api' }
AvrRegisterFrames >> reset [

	list := OrderedCollection new.
	list addFirst: AvrTopFrame new
]

{ #category : 'accessing' }
AvrRegisterFrames >> unusedRegisters [

	^ list first unusedRegisters
]

{ #category : 'accessing' }
AvrRegisterFrames >> unusedRegisters: aCollection [

	list first unusedRegisters: aCollection
]

{ #category : 'api' }
AvrRegisterFrames >> useInputs: aCollection outputs: aCollection2 [

	| obj |
	obj := AvrSubFrame new
		       inputs: aCollection;
		       outputs: aCollection2;
		       yourself.
	list addFirst: obj
]
