"
An AvrAssemblyTest is a test class for testing the behavior of AvrAssembly
"
Class {
	#name : 'AvrAssemblerTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Assembly',
	#package : 'Avr-Tests',
	#tag : 'Assembly'
}

{ #category : 'instance creation' }
AvrAssemblerTest >> newObj [

	^ AvrAssembler new
		  program: AvrProgram new;
		  yourself
]

{ #category : 'tests' }
AvrAssemblerTest >> testAdcDestSource [

	| obj |
	obj := self newObj.
	obj adcDest: 12 source: 23.
	self assert: obj program codes first second mnemonic equals: #ADC.
	self assert: obj program codes first second dest equals: 12.
	self assert: obj program codes first second source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testAdd [

	| obj |
	obj := self newObj.
	self assert: obj program codeCount equals: 0.
	obj add: AvrOpNOP new.
	obj add: AvrOpNOP new.
	self assert: obj program codeCount equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testAddDestSource [

	| obj |
	obj := self newObj.
	obj addDest: 12 source: 23.
	self assert: obj program codes first second mnemonic equals: #ADD.
	self assert: obj program codes first second dest equals: 12.
	self assert: obj program codes first second source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testAdiwRData [

	| obj |
	obj := self newObj.
	obj adiwR: 12 data: 23.
	self assert: obj program codes first second mnemonic equals: #ADIW.
	self assert: obj program codes first second register equals: 12.
	self assert: obj program codes first second immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testAndDestSource [

	| obj |
	obj := self newObj.
	obj andDest: 12 source: 23.
	self assert: obj program codes first second mnemonic equals: #AND.
	self assert: obj program codes first second dest equals: 12.
	self assert: obj program codes first second source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testAndiRData [

	| obj |
	obj := self newObj.
	obj andiR: 12 data: 23.
	self assert: obj program codes first second mnemonic equals: #ANDI.
	self assert: obj program codes first second register equals: 12.
	self assert: obj program codes first second immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testAvailableRegisters [

	| obj a |
	obj := self newObj.
	self assert: obj availableRegisters isEmpty.
	a := OrderedCollection new.
	obj availableRegisters: a.
	self assert: obj availableRegisters identicalTo: a
]

{ #category : 'tests' }
AvrAssemblerTest >> testBclr [

	| obj r |
	obj := self newObj.
	obj bclr: 4.
	r := obj program codes first second.
	self assert: r mnemonic equals: #BCLR.
	self assert: r register equals: 4
]

{ #category : 'tests' }
AvrAssemblerTest >> testBrcc [

	| obj |
	obj := self newObj.
	obj brcc: 123.
	self assert: obj program codes first second mnemonic equals: #BRCC.
	self assert: obj program codes first second immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testBrcs [

	| obj |
	obj := self newObj.
	obj brcs: 123.
	self assert: obj program codes first second mnemonic equals: #BRCS.
	self assert: obj program codes first second immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testBreq [

	| obj |
	obj := self newObj.
	obj breq: 123.
	self assert: obj program codes first second mnemonic equals: #BREQ.
	self assert: obj program codes first second immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testBrge [

	| obj |
	obj := self newObj.
	obj brge: 123.
	self assert: obj program codes first second mnemonic equals: #BRGE.
	self assert: obj program codes first second immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testBrlt [

	| obj |
	obj := self newObj.
	obj brlt: 123.
	self assert: obj program codes first second mnemonic equals: #BRLT.
	self assert: obj program codes first second immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testBrne [

	| obj |
	obj := self newObj.
	obj brne: 123.
	self assert: obj program codes first second mnemonic equals: #BRNE.
	self assert: obj program codes first second immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testBset [

	| obj r |
	obj := self newObj.
	obj bset: 4.
	r := obj program codes first second.
	self assert: r mnemonic equals: #BSET.
	self assert: r register equals: 4
]

{ #category : 'tests' }
AvrAssemblerTest >> testCall [

	| obj |
	obj := self newObj.
	obj call: 123.
	self assert: obj program codes first second mnemonic equals: #CALL.
	self assert: obj program codes first second immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testCallSubroutine [

	| obj codes code |
	obj := self newObj.
	obj callSubroutine: 'abc'.
	obj callSubroutine: 'def'.
	codes := obj program codes.
	self assert: codes size equals: 2.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #RCALL.
	self assert: code second immediate equals: 'abc'.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #RCALL.
	self assert: code second immediate equals: 'def'.
	self assert: (obj subroutines includes: 'abc').
	self assert: (obj subroutines includes: 'def')
]

{ #category : 'tests' }
AvrAssemblerTest >> testCbiBit [

	| obj r |
	obj := self newObj.
	obj cbi: 16r3E bit: 2.
	r := obj program codes first second.
	self assert: r mnemonic equals: #CBI.
	self assert: r io equals: 16r3E.
	self assert: r bit equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testCheckAnyRegistersAvailable [

	| obj |
	obj := self newObj.
	obj availableRegisters: #( 4 6 9 10 12 16 ) asOrderedCollection.
	self assert: (obj checkAnyRegistersAvailable: #( 2 3 4 )).
	self deny: (obj checkAnyRegistersAvailable: #( 2 3 5 )).
	self assert: (obj checkAnyRegistersAvailable: #( 4 6 9 ))
]

{ #category : 'tests' }
AvrAssemblerTest >> testClearAvailableRegisters [

	| obj |
	obj := self newObj.
	obj availableRegisters: #( 1 2 3 ) asOrderedCollection.
	self deny: obj availableRegisters isEmpty.
	obj clearAvailableRegisters.
	self assert: obj availableRegisters isEmpty
]

{ #category : 'tests' }
AvrAssemblerTest >> testCli [

	| obj |
	obj := self newObj.
	obj cli.
	self assert: obj program codes first second mnemonic equals: #CLI
]

{ #category : 'tests' }
AvrAssemblerTest >> testCom [

	| obj |
	obj := self newObj.
	obj com: 2.
	self assert: obj program codes first second mnemonic equals: #COM.
	self assert: obj program codes first second register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testCpDestSource [

	| obj |
	obj := self newObj.
	obj cpDest: 12 source: 23.
	self assert: obj program codes first second mnemonic equals: #CP.
	self assert: obj program codes first second dest equals: 12.
	self assert: obj program codes first second source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testCpcDestSource [

	| obj |
	obj := self newObj.
	obj cpcDest: 12 source: 23.
	self assert: obj program codes first second mnemonic equals: #CPC.
	self assert: obj program codes first second dest equals: 12.
	self assert: obj program codes first second source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testCpiRData [

	| obj |
	obj := self newObj.
	obj cpiR: 12 data: 23.
	self assert: obj program codes first second mnemonic equals: #CPI.
	self assert: obj program codes first second register equals: 12.
	self assert: obj program codes first second immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testCpseDestSource [

	| obj |
	obj := self newObj.
	obj cpseDest: 12 source: 23.
	self assert: obj program codes first second mnemonic equals: #CPSE.
	self assert: obj program codes first second dest equals: 12.
	self assert: obj program codes first second source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testDec [

	| obj |
	obj := self newObj.
	obj dec: 2.
	self assert: obj program codes first second mnemonic equals: #DEC.
	self assert: obj program codes first second register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testEorDestSource [

	| obj |
	obj := self newObj.
	obj eorDest: 12 source: 23.
	self assert: obj program codes first second mnemonic equals: #EOR.
	self assert: obj program codes first second dest equals: 12.
	self assert: obj program codes first second source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testGetRegisters [

	| obj r |
	obj := self newObj.
	obj availableRegisters: #( 4 6 9 10 12 16 ) asOrderedCollection.
	r := obj getRegisters: #( 12 10 4 ).
	self assertCollection: r equals: #( 12 10 4 ).
	self
		assertCollection: obj availableRegisters
		equals: #( 6 9 16 ) asOrderedCollection
]

{ #category : 'tests' }
AvrAssemblerTest >> testGetRegistersCount [

	| obj r |
	obj := self newObj.
	obj availableRegisters: #( 4 6 9 ) asOrderedCollection.
	r := obj getRegistersCount: 2.
	self assertCollection: r equals: #( 4 6 ).
	self
		assertCollection: obj availableRegisters
		equals: #( 9 ) asOrderedCollection
]

{ #category : 'tests' }
AvrAssemblerTest >> testInRAddress [

	| obj |
	obj := self newObj.
	obj inR: 12 address: 23.
	self assert: obj program codes first second mnemonic equals: #IN.
	self assert: obj program codes first second register equals: 12.
	self assert: obj program codes first second immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testInc [

	| obj |
	obj := self newObj.
	obj inc: 2.
	self assert: obj program codes first second mnemonic equals: #INC.
	self assert: obj program codes first second register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testInitialize [

	| obj |
	obj := AvrAssembler basicNew.
	self assert: obj subroutines isNil.
	self assert: obj literals isNil.
	obj initialize.
	self assert: obj subroutines isCollection.
	self assert: obj subroutines isEmpty.
	self assert: obj literals isCollection.
	self assert: obj literals isEmpty
]

{ #category : 'tests' }
AvrAssemblerTest >> testJmp [

	| obj |
	obj := self newObj.
	obj jmp: 123.
	self assert: obj program codes first second mnemonic equals: #JMP.
	self assert: obj program codes first second immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testLabel [

	| obj |
	obj := self newObj.
	self assert: (obj program labeler labelNameAt: 'abc') isNil.
	obj label: 'abc'.
	self assert: (obj program labeler labelNameAt: 'abc') equals: 0 
]

{ #category : 'tests' }
AvrAssemblerTest >> testLabeler [

	| obj |
	obj := self newObj.
	self assert: (obj labeler isKindOf: AvrLabeler)
]

{ #category : 'tests' }
AvrAssemblerTest >> testLddRYOffset [

	| obj |
	obj := self newObj.
	obj lddR: 12 yOffset: 23.
	self assert: (obj program codes first second isKindOf: AvrOpLDDY).
	self assert: obj program codes first second mnemonic equals: #LDD.
	self assert: obj program codes first second register equals: 12.
	self assert: obj program codes first second immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testLddRZOffset [

	| obj |
	obj := self newObj.
	obj lddR: 12 zOffset: 23.
	self assert: (obj program codes first second isKindOf: AvrOpLDDZ).
	self assert: obj program codes first second mnemonic equals: #LDD.
	self assert: obj program codes first second register equals: 12.
	self assert: obj program codes first second immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdiRData [

	| obj |
	obj := self newObj.
	obj ldiR: 12 data: 23.
	self assert: obj program codes first second mnemonic equals: #LDI.
	self assert: obj program codes first second register equals: 12.
	self assert: obj program codes first second immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdsRAddress [

	| obj |
	obj := self newObj.
	obj ldsR: 12 address: 23.
	self assert: obj program codes first second mnemonic equals: #LDS.
	self assert: obj program codes first second register equals: 12.
	self assert: obj program codes first second immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdx [

	| obj |
	obj := self newObj.
	obj ldx: 2.
	self assert: (obj program codes first second isKindOf: AvrOpLDX1).
	self assert: obj program codes first second mnemonic equals: #LD.
	self assert: obj program codes first second register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdxDec [

	| obj r |
	obj := self newObj.
	obj ldxDec: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpLDX3).
	self assert: r mnemonic equals: #LD.
	self assert: r register equals: 2.
	self assert: r selector equals: #ldxDec:
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdxInc [

	| obj r |
	obj := self newObj.
	obj ldxInc: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpLDX2).
	self assert: r mnemonic equals: #LD.
	self assert: r register equals: 2.
	self assert: r selector equals: #ldxInc:
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdy [

	| obj |
	obj := self newObj.
	obj ldy: 3.
	self assert: (obj program codes first second isKindOf: AvrOpLDY1).
	self assert: obj program codes first second mnemonic equals: #LD.
	self assert: obj program codes first second register equals: 3
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdyDec [

	| obj r |
	obj := self newObj.
	obj ldyDec: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpLDY3).
	self assert: r mnemonic equals: #LD.
	self assert: r register equals: 2.
	self assert: r selector equals: #ldyDec:
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdyInc [

	| obj r |
	obj := self newObj.
	obj ldyInc: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpLDY2).
	self assert: r mnemonic equals: #LD.
	self assert: r register equals: 2.
	self assert: r selector equals: #ldyInc:
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdz [

	| obj r |
	obj := self newObj.
	obj ldz: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpLDZ1).
	self assert: r mnemonic equals: #LD.
	self assert: r register equals: 2.
	self assert: r selector equals: #ldz:
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdzDec [

	| obj r |
	obj := self newObj.
	obj ldzDec: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpLDZ3).
	self assert: r mnemonic equals: #LD.
	self assert: r register equals: 2.
	self assert: r selector equals: #ldzDec:
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdzInc [

	| obj r |
	obj := self newObj.
	obj ldzInc: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpLDZ2).
	self assert: r mnemonic equals: #LD.
	self assert: r register equals: 2.
	self assert: r selector equals: #ldzInc:
]

{ #category : 'tests' }
AvrAssemblerTest >> testLiterals [

	| obj a |
	obj := self newObj.
	self assert: obj literals isCollection.
	self assert: obj literals isEmpty.
	a := OrderedCollection new.
	obj literals: a.
	self assert: obj literals identicalTo: a
]

{ #category : 'tests' }
AvrAssemblerTest >> testLpmz [

	| obj |
	obj := self newObj.
	obj lpmz: 2.
	self assert: (obj program codes first second isKindOf: AvrOpLPM2).
	self assert: obj program codes first second mnemonic equals: #LPM.
	self assert: obj program codes first second register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testLpmzInc [

	| obj |
	obj := self newObj.
	obj lpmzInc: 2.
	self assert: (obj program codes first second isKindOf: AvrOpLPM3).
	self assert: obj program codes first second mnemonic equals: #LPM.
	self assert: obj program codes first second register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testMovDestSource [

	| obj |
	obj := self newObj.
	obj movDest: 12 source: 23.
	self assert: obj program codes first second mnemonic equals: #MOV.
	self assert: obj program codes first second dest equals: 12.
	self assert: obj program codes first second source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testMovwDestSource [

	| obj |
	obj := self newObj.
	obj movwDest: 12 source: 23.
	self assert: obj program codes first second mnemonic equals: #MOVW.
	self assert: obj program codes first second dest equals: 12.
	self assert: obj program codes first second source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testMulsDestSource [

	| obj |
	obj := self newObj.
	obj mulsDest: 12 source: 23.
	self assert: obj program codes first second mnemonic equals: #MULS.
	self assert: obj program codes first second dest equals: 12.
	self assert: obj program codes first second source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testMulsuDestSource [

	| obj |
	obj := self newObj.
	obj mulsuDest: 12 source: 23.
	self assert: obj program codes first second mnemonic equals: #MULSU.
	self assert: obj program codes first second dest equals: 12.
	self assert: obj program codes first second source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testNop [

	| obj |
	obj := self newObj.
	obj nop.
	self assert: obj program codes first second selector equals: #nop
]

{ #category : 'tests' }
AvrAssemblerTest >> testOrDestSource [

	| obj |
	obj := self newObj.
	obj orDest: 12 source: 23.
	self assert: obj program codes first second mnemonic equals: #OR.
	self assert: obj program codes first second dest equals: 12.
	self assert: obj program codes first second source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testOriRData [

	| obj |
	obj := self newObj.
	obj oriR: 12 data: 23.
	self assert: obj program codes first second mnemonic equals: #ORI.
	self assert: obj program codes first second register equals: 12.
	self assert: obj program codes first second immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testOutR [

	| obj r |
	obj := self newObj.
	obj out: 12 r: 23.
	r := obj program codes first second.
	self assert: r selector equals: #out:r:.
	self assert: r immediate equals: 12.
	self assert: r register equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testPop [

	| obj r |
	obj := self newObj.
	obj pop: 2.
	r := obj program codes first second.
	self assert: r mnemonic equals: #POP.
	self assert: r register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testProgram [

	| obj a |
	obj := self newObj.
	self assert: (obj program isKindOf: AvrProgram).
	a := AvrProgram new.
	obj program: a.
	self assert: obj program identicalTo: a
]

{ #category : 'tests' }
AvrAssemblerTest >> testPush [

	| obj r |
	obj := self newObj.
	obj push: 2.
	r := obj program codes first second.
	self assert: r mnemonic equals: #PUSH.
	self assert: r register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testRcall [

	| obj r |
	obj := self newObj.
	obj rcall: 123.
	r := obj program codes first second.
	self assert: r mnemonic equals: #RCALL.
	self assert: r immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testReleaseRegisters [

	| obj list |
	obj := self newObj.
	list := obj availableRegisters.
	list addAll: #( 1 2 3 ).
	obj releaseRegisters: #( 4 5 ).
	self
		assertCollection: obj availableRegisters
		equals: #( 1 2 3 4 5 ) asOrderedCollection.
	self should: [ obj releaseRegisters: #( 5 6 ) ] raise: Error
]

{ #category : 'tests' }
AvrAssemblerTest >> testResolveLiteralsFor [

	| obj codes code device |
	obj := self newObj.
	obj useLiteral: 'abc'.
	obj useLiteral: 'def'.
	device := AvrTestDevice new.
	device asm: obj.
	obj resolveLiteralsFor: device.
	codes := obj program codes.
	self assert: codes size equals: 4.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r0201.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r0003.
	code := codes third.
	self assert: code first equals: 4.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r6564.
	code := codes fourth.
	self assert: code first equals: 6.
	self assert: code second selector equals: #word:.
	self assert: code second immediate equals: 16r0066.
	self assert: (obj labeler labelNameAt: #abc) equals: 0.
	self assert: (obj labeler labelNameAt: #def) equals: 4
]

{ #category : 'tests' }
AvrAssemblerTest >> testResolveUndefinedSubroutinesFor [

	| obj device |
	obj := self newObj.
	device := AvrArduino new.
	device asm: obj.
	obj callSubroutine: 'all'.
	self assert: (obj program labeler labelNameAt: 'all') isNil.
	obj resolveUndefinedSubroutinesFor: device.
	self assert: (obj program labeler labelNameAt: 'all') notNil
]

{ #category : 'tests' }
AvrAssemblerTest >> testRet [

	| obj r |
	obj := self newObj.
	obj ret.
	r := obj program codes first second.
	self assert: r mnemonic equals: #RET
]

{ #category : 'tests' }
AvrAssemblerTest >> testReti [

	| obj r |
	obj := self newObj.
	obj reti.
	r := obj program codes first second.
	self assert: r mnemonic equals: #RETI
]

{ #category : 'tests' }
AvrAssemblerTest >> testRjmp [

	| obj r |
	obj := self newObj.
	obj rjmp: 123.
	r := obj program codes first second.
	self assert: r mnemonic equals: #RJMP.
	self assert: r immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testRor [

	| obj r |
	obj := self newObj.
	obj ror: 2.
	r := obj program codes first second.
	self assert: r mnemonic equals: #ROR.
	self assert: r register equals: 2.
	self assert: r selector equals: #ror:
]

{ #category : 'tests' }
AvrAssemblerTest >> testSbcDestSource [

	| obj r |
	obj := self newObj.
	obj sbcDest: 12 source: 23.
	r := obj program codes first second.
	self assert: r mnemonic equals: #SBC.
	self assert: r dest equals: 12.
	self assert: r source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testSbciRData [

	| obj r |
	obj := self newObj.
	obj sbciR: 12 data: 23.
	r := obj program codes first second.
	self assert: r mnemonic equals: #SBCI.
	self assert: r register equals: 12.
	self assert: r immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testSbiBit [

	| obj r |
	obj := self newObj.
	obj sbi: 16r3E bit: 7.
	r := obj program codes first second.
	self assert: r mnemonic equals: #SBI.
	self assert: r io equals: 16r3E.
	self assert: r bit equals: 7
]

{ #category : 'tests' }
AvrAssemblerTest >> testSbicBit [

	| obj r |
	obj := self newObj.
	obj sbic: 24 bit: 6.
	r := obj program codes first second.
	self assert: r mnemonic equals: #SBIC.
	self assert: r register equals: 24.
	self assert: r immediate equals: 6
]

{ #category : 'tests' }
AvrAssemblerTest >> testSbisBit [

	| obj r |
	obj := self newObj.
	obj sbis: 12 bit: 23.
	r := obj program codes first second.
	self assert: r mnemonic equals: #SBIS.
	self assert: r register equals: 12.
	self assert: r immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testSbiwRData [

	| obj r |
	obj := self newObj.
	obj sbiwR: 12 data: 23.
	r := obj program codes first second.
	self assert: r mnemonic equals: #SBIW.
	self assert: r register equals: 12.
	self assert: r immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testSbrcBit [

	| obj r |
	obj := self newObj.
	obj sbrc: 24 bit: 6.
	r := obj program codes first second.
	self assert: r mnemonic equals: #SBRC.
	self assert: r register equals: 24.
	self assert: r immediate equals: 6
]

{ #category : 'tests' }
AvrAssemblerTest >> testSbrsBit [

	| obj r |
	obj := self newObj.
	obj sbrs: 24 bit: 6.
	r := obj program codes first second.
	self assert: r mnemonic equals: #SBRS.
	self assert: r register equals: 24.
	self assert: r immediate equals: 6
]

{ #category : 'tests' }
AvrAssemblerTest >> testSei [

	| obj r |
	obj := self newObj.
	obj sei.
	r := obj program codes first second.
	self assert: r mnemonic equals: #SEI
]

{ #category : 'tests' }
AvrAssemblerTest >> testStdYOffsetR [

	| obj r |
	obj := self newObj.
	obj stdYOffset: 12 r: 23.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpSTDY).
	self assert: r mnemonic equals: #STD.
	self assert: r register equals: 23.
	self assert: r immediate equals: 12
]

{ #category : 'tests' }
AvrAssemblerTest >> testStdZOffsetR [

	| obj r |
	obj := self newObj.
	obj stdZOffset: 12 r: 23.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpSTDZ).
	self assert: r mnemonic equals: #STD.
	self assert: r register equals: 23.
	self assert: r immediate equals: 12
]

{ #category : 'tests' }
AvrAssemblerTest >> testStsAddressR [

	| obj r |
	obj := self newObj.
	obj stsAddress: 23 r: 12.
	r := obj program codes first second.
	self assert: r mnemonic equals: #STS.
	self assert: r register equals: 12.
	self assert: r immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testStx [

	| obj r |
	obj := self newObj.
	obj stx: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpSTX1).
	self assert: r mnemonic equals: #ST.
	self assert: r register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testStxInc [

	| obj r |
	obj := self newObj.
	obj stxInc: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpSTX2).
	self assert: r mnemonic equals: #ST.
	self assert: r register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testSty [

	| obj r |
	obj := self newObj.
	obj sty: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpSTY1).
	self assert: r mnemonic equals: #ST.
	self assert: r register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testStyInc [

	| obj r |
	obj := self newObj.
	obj styInc: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpSTY2).
	self assert: r mnemonic equals: #ST.
	self assert: r register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testStz [

	| obj r |
	obj := self newObj.
	obj stz: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpSTZ1).
	self assert: r mnemonic equals: #ST.
	self assert: r register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testStzDec [

	| obj r |
	obj := self newObj.
	obj stzDec: 3.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpSTZ3).
	self assert: r selector equals: #stzDec:.
	self assert: r mnemonic equals: #ST.
	self assert: r register equals: 3
]

{ #category : 'tests' }
AvrAssemblerTest >> testStzInc [

	| obj r |
	obj := self newObj.
	obj stzInc: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpSTZ2).
	self assert: r mnemonic equals: #ST.
	self assert: r register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testSubDestSource [

	| obj r |
	obj := self newObj.
	obj subDest: 12 source: 23.
	r := obj program codes first second.
	self assert: r mnemonic equals: #SUB.
	self assert: r dest equals: 12.
	self assert: r source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testSubiRData [

	| obj |
	obj := self newObj.
	obj subiR: 12 data: 23.
	self assert: obj program codes first second mnemonic equals: #SUBI.
	self assert: obj program codes first second register equals: 12.
	self assert: obj program codes first second immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testSubroutines [

	| obj a |
	obj := self newObj.
	self assert: obj subroutines isCollection.
	self assert: obj subroutines isEmpty.
	a := Set new.
	obj subroutines: a.
	self assert: obj subroutines identicalTo: a
]

{ #category : 'tests' }
AvrAssemblerTest >> testSwap [

	| obj r |
	obj := self newObj.
	obj swap: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpSWAP).
	self assert: r mnemonic equals: #SWAP.
	self assert: r register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testUseLiteral [

	| obj |
	obj := self newObj.
	self assert: obj literals isEmpty.
	obj useLiteral: 'abc'.
	obj useLiteral: 'def'.
	obj useLiteral: 'abc'.
	self assert: obj literals size equals: 2.
	self assert: (obj literals includes: #abc).
	self assert: (obj literals includes: #def).
	self deny: (obj literals includes: #ghi)
]

{ #category : 'tests' }
AvrAssemblerTest >> testWord [

	| obj |
	obj := self newObj.
	obj word: 123.
	self assert: obj program codes first second selector equals: #word:.
	self assert: obj program codes first second immediate equals: 123
]
