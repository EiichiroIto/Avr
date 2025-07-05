Extension { #name : 'StringTest' }

{ #category : '*Avr-Tests' }
StringTest >> testAddLiteralCodesFor [

	| asm codes code |
	asm := AvrAssembler new.
	asm program: AvrProgram new.
	'ABCDEF' addLiteralCodesFor: asm.
	codes := asm program codes.
	self assert: codes size equals: 4.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r4241.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r4443.
	code := codes third.
	self assert: code first equals: 4.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r4645.
	code := codes fourth.
	self assert: code first equals: 6.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 0.

	asm := AvrAssembler new.
	asm program: AvrProgram new.
	'ABCDEFG' addLiteralCodesFor: asm.
	codes := asm program codes.
	self assert: codes size equals: 4.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r4241.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r4443.
	code := codes third.
	self assert: code first equals: 4.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r4645.
	code := codes fourth.
	self assert: code first equals: 6.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r0047.

	asm := AvrAssembler new.
	asm program: AvrProgram new.
	'' addLiteralCodesFor: asm.
	codes := asm program codes.
	self assert: codes size equals: 1.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r0000
]
