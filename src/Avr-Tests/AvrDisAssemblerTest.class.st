"
An AvrDisAssemblerTest is a test class for testing the behavior of AvrDisAssembler
"
Class {
	#name : 'AvrDisAssemblerTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Assembly',
	#package : 'Avr-Tests',
	#tag : 'Assembly'
}

{ #category : 'instance creation' }
AvrDisAssemblerTest >> newObj [

	^ AvrDisAssembler new
]

{ #category : 'instance creation' }
AvrDisAssemblerTest >> newProgram [

	^ AvrProgram new
]

{ #category : 'tests' }
AvrDisAssemblerTest >> testInitialize [

	| obj |
	obj := self newObj.
	self assert: obj opClasses isCollection
]

{ #category : 'tests' }
AvrDisAssemblerTest >> testOpClasses [

	| obj a |
	obj := self newObj.
	self assert: obj opClasses isCollection.
	a := #( 1 2 3 ).
	obj opClasses: a.
	self assert: obj opClasses identicalTo: a
]

{ #category : 'tests' }
AvrDisAssemblerTest >> testProgram [

	| obj a |
	obj := self newObj.
	self assert: obj program isNil.
	a := self newProgram.
	obj program: a.
	self assert: obj program identicalTo: a
]

{ #category : 'tests' }
AvrDisAssemblerTest >> testReadCodeFrom [

	| obj stream code |
	obj := self newObj.
	stream := ReadStream on: #[ 16r0c 16r94 16r34 16r00 ].
	code := obj readCodeFrom: stream.
	self assert: (code isKindOf: AvrOpJMP).
	self assert: code immediate equals: 16r34.
	obj := self newObj.
	stream := ReadStream on: #[ 16r11 16r24 ].
	code := obj readCodeFrom: stream.
	self assert: (code isKindOf: AvrOpEOR).
	self assert: code dest equals: 1.
	self assert: code source equals: 1.
	obj := self newObj.
	stream := ReadStream on: #[ 16rA1 16rF0 ].
	code := obj readCodeFrom: stream.
	self assert: (code isKindOf: AvrOpBREQ).
	self assert: code immediate equals: 20.
" 294:	a8 9b       	sbis	0x15, 0"
	obj := self newObj.
	stream := ReadStream on: #[ 16rA8 16r9B ].
	code := obj readCodeFrom: stream.
	self assert: (code isKindOf: AvrOpSBIS).
	self assert: code register equals: 16r15.
	self assert: code immediate equals: 0
]

{ #category : 'tests' }
AvrDisAssemblerTest >> testReadFrom [

	| obj stream |
	obj := self newObj.
	obj program: self newProgram.
	stream := ReadStream on:
		          #[ 16r0C 16r94 16r46 16r00 16r11 16r24 16r1F 16rBE ].
	obj readFrom: stream.
	self assert: obj program codeCount equals: 3.
	self assert: (obj program codes first isKindOf: AvrOpJMP).
	self assert: (obj program codes second isKindOf: AvrOpEOR).
	self assert: (obj program codes third isKindOf: AvrOpOUT)
]

{ #category : 'tests' }
AvrDisAssemblerTest >> testReadNextWordFrom [

	| obj stream r |
	obj := self newObj.
	stream := ReadStream on: #[ 16r0c 16r94 16r34 16r00 ].
	r := obj readNextWordFrom: stream.
	self assert: r equals: 16r940C.
	r := obj readNextWordFrom: stream.
	self assert: r equals: 16r0034
]
