Class {
	#name : 'AvrAsmChecker',
	#superclass : 'Object',
	#category : 'Avr-Utils',
	#package : 'Avr',
	#tag : 'Utils'
}

{ #category : 'accessing' }
AvrAsmChecker class >> checkFromFileNamed: aString [

	| obj |
	obj := self new.
	obj checkFrom: aString asFileReference.
	^ obj
]

{ #category : 'accessing' }
AvrAsmChecker >> checkFrom: aStream [

	| lines |
	lines := aStream contents lines.
	lines doWithIndex: [ :each :index |
		(self checkString: each) ifFalse: [
			self error: 'Invalid at: #' , index asString ] ]
]

{ #category : 'accessing' }
AvrAsmChecker >> checkString: aString [

	| parser tuples generator result |
	parser := self newParser.
	tuples := parser parse: aString.
	tuples isPetitFailure ifTrue: [ ^ false ].
	generator := self newGenerator.
	result := generator generateOp: tuples third.
	^ result hasEqualElements: tuples second
]

{ #category : 'instance creation' }
AvrAsmChecker >> newGenerator [

	^ AvrCodeGenerator new
]

{ #category : 'instance creation' }
AvrAsmChecker >> newParser [

	^ AvrAsmParser new
]
