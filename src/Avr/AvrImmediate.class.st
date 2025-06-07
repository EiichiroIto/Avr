Class {
	#name : 'AvrImmediate',
	#superclass : 'AvrInstruction',
	#instVars : [
		'immediate'
	],
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrImmediate >> arguments [

	^ Array with: immediate
]

{ #category : 'testing' }
AvrImmediate >> hasLabel [

	^ immediate isString
]

{ #category : 'accessing' }
AvrImmediate >> immediate [

	^ immediate
]

{ #category : 'accessing' }
AvrImmediate >> immediate: anObject [

	immediate := anObject
]

{ #category : 'accessing' }
AvrImmediate >> immediateRange [

	self subclassResponsibility
]

{ #category : 'testing' }
AvrImmediate >> isValid [

	self immediate isInteger ifFalse: [ ^ false ].
	^ self immediateRange includes: self immediate
]

{ #category : 'accessing' }
AvrImmediate >> selector [

	^ (self mnemonic asLowercase , ':') asSymbol
]
