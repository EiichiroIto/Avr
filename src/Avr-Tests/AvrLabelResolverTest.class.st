"
An AvrLabelResolverTest is a test class for testing the behavior of AvrLabelResolver
"
Class {
	#name : 'AvrLabelResolverTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Assembly',
	#package : 'Avr-Tests',
	#tag : 'Assembly'
}

{ #category : 'instance creation' }
AvrLabelResolverTest >> newObj [

	^ AvrLabelResolver new
]

{ #category : 'tests' }
AvrLabelResolverTest >> testLabeler [

	| obj a |
	obj := self newObj.
	self assert: obj labeler isNil.
	a := AvrLabeler new.
	obj labeler: a.
	self assert: obj labeler identicalTo: a
]

{ #category : 'tests' }
AvrLabelResolverTest >> testResolve [

	| obj pair pair2 labeler |
	obj := self newObj.
	labeler := AvrLabeler new.
	labeler labelNameAt: #test1 put: 100.
	obj labeler: labeler.

	pair := Array with: 50 with: AvrOpNOP new.
	pair2 := obj resolve: pair.
	self assert: pair2 first equals: 50.
	self assert: pair2 second mnemonic equals: #NOP.

	pair := Array with: 50 with: AvrOpJMP new.
	pair second immediate: 123.
	pair2 := obj resolve: pair.
	self assert: pair2 first equals: 50.
	self assert: pair2 second mnemonic equals: #JMP.
	self assert: pair2 second immediate equals: 123.

	pair := Array with: 90 with: AvrOpJMP new.
	pair second immediate: #test1.
	pair2 := obj resolve: pair.
	self assert: pair2 first equals: 90.
	self assert: pair2 second mnemonic equals: #JMP.
	self assert: pair2 second immediate equals: 50.

	pair := Array with: 90 with: AvrOpRJMP new.
	pair second immediate: #test1.
	pair2 := obj resolve: pair.
	self assert: pair2 first equals: 90.
	self assert: pair2 second mnemonic equals: #RJMP.
	self assert: pair2 second immediate equals: 100 - 90 - 2 / 2.

	pair := Array with: 90 with: AvrOpCALL new.
	pair second immediate: #test1.
	pair2 := obj resolve: pair.
	self assert: pair2 first equals: 90.
	self assert: pair2 second mnemonic equals: #CALL.
	self assert: pair2 second immediate equals: 50.

	pair := Array with: 90 with: AvrOpRCALL new.
	pair second immediate: #test1.
	pair2 := obj resolve: pair.
	self assert: pair2 first equals: 90.
	self assert: pair2 second mnemonic equals: #RCALL.
	self assert: pair2 second immediate equals: 100 - 90 - 2 / 2
]

{ #category : 'tests' }
AvrLabelResolverTest >> testResolveCollection [

	| obj labeler codes ret code |
	obj := self newObj.
	labeler := AvrLabeler new.
	labeler labelNameAt: #boot put: 104.
	labeler labelNameAt: #setupTimers put: 410.
	obj labeler: labeler.
	codes := OrderedCollection new.
	codes add: {
			0.
			(AvrOpJMP new immediate: 52) }.
	codes add: {
			100.
			(AvrOpCALL new immediate: 205) }.
	codes add: {
			0.
			(AvrOpJMP new immediate: #boot) }.
	codes add: {
			100.
			(AvrOpCALL new immediate: #setupTimers) }.
	ret := obj resolveCollection: codes.
	code := ret first second.
	self assert: code mnemonic equals: #JMP.
	self assert: code immediate equals: 52.
	code := ret second second.
	self assert: code mnemonic equals: #CALL.
	self assert: code immediate equals: 205
]

{ #category : 'tests' }
AvrLabelResolverTest >> testResolvedCopyOf [

	| obj op ret io |
	obj := self newObj.
	io := AvrArduinoIO new port: 12.
	op := AvrOpJMP new immediate: 52.
	ret := obj resolvedCopyOf: op.
	self assert: (ret isKindOf: AvrOpJMP).
	self assert: ret immediate equals: 52.
	op := AvrOpOUT new
		      immediate: io;
		      register: 10.
	ret := obj resolvedCopyOf: op.
	self assert: (ret isKindOf: AvrOpOUT).
	self assert: ret register equals: 10.
	self assert: ret immediate equals: 12
]
