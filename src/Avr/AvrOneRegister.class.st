Class {
	#name : 'AvrOneRegister',
	#superclass : 'AvrInstruction',
	#instVars : [
		'register'
	],
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrOneRegister >> arguments [

	^ Array with: register
]

{ #category : 'testing' }
AvrOneRegister >> isValid [

	self register isInteger ifFalse: [ ^ false ].
	^ self registerRange includes: self register
]

{ #category : 'accessing' }
AvrOneRegister >> operandText [

	^ self registerString
]

{ #category : 'accessing' }
AvrOneRegister >> register [

	^ register
]

{ #category : 'accessing' }
AvrOneRegister >> register: anObject [

	register := anObject
]

{ #category : 'accessing' }
AvrOneRegister >> registerRange [

	self subclassResponsibility
]

{ #category : 'accessing' }
AvrOneRegister >> registerString [

	register ifNil: [ ^ 'nil' ].
	^ 'r' , register asString
]
