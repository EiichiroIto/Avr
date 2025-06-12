"
An AvrAsm2CodeTest is a test class for testing the behavior of AvrAsm2Code
"
Class {
	#name : 'AvrAsm2CodeTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Utils',
	#package : 'Avr-Tests',
	#tag : 'Utils'
}

{ #category : 'instance creation' }
AvrAsm2CodeTest >> newObj [

	^ AvrAsm2Code new
]

{ #category : 'tests' }
AvrAsm2CodeTest >> testInitialize [

	| obj |
	obj := AvrAsm2Code basicNew.
	self assert: obj program isNil.
	obj initialize.
	self assert: (obj program isKindOf: AvrProgram)
]

{ #category : 'tests' }
AvrAsm2CodeTest >> testNewParser [

	self assert: (self newObj newParser isKindOf: AvrAsmParser)
]

{ #category : 'tests' }
AvrAsm2CodeTest >> testNewProgram [

	self assert: (self newObj newProgram isKindOf: AvrProgram)
]

{ #category : 'tests' }
AvrAsm2CodeTest >> testProgram [

	| obj a |
	obj := self newObj.
	self assert: (obj program isKindOf: AvrProgram).
	a := AvrProgram new.
	obj program: a.
	self assert: obj program identicalTo: a
]

{ #category : 'tests' }
AvrAsm2CodeTest >> testReadFrom [

	| obj r code |
	obj := self newObj.
	obj readFrom: '  c2:	11 24       	eor	r1, r1
  c4:	1f be       	out	0x3f, r1	; 63
' readStream.
	r := obj program codes.
	self assert: r size equals: 2.
	code := r first.
	self assert: code first equals: 16rC2.
	self assert: code second mnemonic equals: #EOR.
	code := r second.
	self assert: code first equals: 16rC4.
	self assert: code second mnemonic equals: #OUT
]

{ #category : 'tests' }
AvrAsm2CodeTest >> testReadString [

	| obj r |
	obj := self newObj.
	obj readString: '  12:	0c 94 61 00 	jmp	0xc2	;  0xc2'.
	r := obj program codes.
	self assert: r size equals: 1.
	self assert: r first first equals: 16r12.
	self assert: r first second mnemonic equals: #JMP.
	self assert: r first second immediate equals: 16rC2 // 2
]
