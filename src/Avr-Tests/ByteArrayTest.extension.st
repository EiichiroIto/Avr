Extension { #name : 'ByteArrayTest' }

{ #category : '*Avr-Tests' }
ByteArrayTest >> testAddLiteralCodesFor [

	| asm codes code |
	asm := AvrAssembler new.
	asm program: AvrProgram new.
	#[ 1 2 3 4 ] addLiteralCodesFor: asm.
	codes := asm program codes.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r0201.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r0403.

	asm := AvrAssembler new.
	asm program: AvrProgram new.
	#[ 1 2 3 4 5 ] addLiteralCodesFor: asm.
	codes := asm program codes.
	self assert: codes size equals: 3.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r0201.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r0403.
	code := codes third.
	self assert: code first equals: 4.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r0005.

	asm := AvrAssembler new.
	asm program: AvrProgram new.
	#[  ] addLiteralCodesFor: asm.
	codes := asm program codes.
	self assert: codes isEmpty
]
