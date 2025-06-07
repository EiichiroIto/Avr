Class {
	#name : 'AvrRegisterWithImmediate',
	#superclass : 'AvrInstruction',
	#instVars : [
		'immediate',
		'register'
	],
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrRegisterWithImmediate >> arguments [

	^ Array with: register with: immediate
]

{ #category : 'testing' }
AvrRegisterWithImmediate >> hasLabel [

	^ immediate isString
]

{ #category : 'accessing' }
AvrRegisterWithImmediate >> immediate [

	^ immediate
]

{ #category : 'accessing' }
AvrRegisterWithImmediate >> immediate: anObject [

	immediate := anObject
]

{ #category : 'accessing' }
AvrRegisterWithImmediate >> immediateRange [

	self subclassResponsibility
]

{ #category : 'testing' }
AvrRegisterWithImmediate >> isValid [

	self register isInteger ifFalse: [ ^ false ].
	self immediate isInteger ifFalse: [ ^ false ].
	^ (self registerRange includes: self register) and: [
		  self immediateRange includes: self immediate ]
]

{ #category : 'accessing' }
AvrRegisterWithImmediate >> operandText [

	^ self registerString , ', ' , (self printHexImmediate: immediate)
]

{ #category : 'accessing' }
AvrRegisterWithImmediate >> register [

	^ register
]

{ #category : 'accessing' }
AvrRegisterWithImmediate >> register: anObject [

	register := anObject
]

{ #category : 'accessing' }
AvrRegisterWithImmediate >> registerRange [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrRegisterWithImmediate >> registerString [

	register ifNil: [ ^ 'nil' ].
	^ 'r' , register asString
]

{ #category : 'accessing' }
AvrRegisterWithImmediate >> selector [

	^ (self mnemonic asLowercase , 'R:data:') asSymbol
]
