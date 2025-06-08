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

{ #category : 'copying' }
AvrImmediate >> copyUsingLabeler: aLabeler address: anInteger [

	| obj addr |
	obj := self copy.
	obj immediate isInteger ifTrue: [ ^ obj ].
	addr := aLabeler labelNameAt: obj immediate.
	addr ifNil: [ self error: 'Unresolved label:' , obj immediate ].
	self isRelative ifTrue: [ addr := addr - anInteger - self codeSize ].
	addr := addr // 2.
	obj immediate: addr.
	^ obj
]

{ #category : 'testing' }
AvrImmediate >> hasImmediate [

	^ true
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
AvrImmediate >> isRelative [

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
