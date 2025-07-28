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
		  setupRegisterFrames;
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
	obj registerFrames reset.
	obj eorDest: 12 source: 23.
	self assert: obj program codes first second mnemonic equals: #EOR.
	self assert: obj program codes first second dest equals: 12.
	self assert: obj program codes first second source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testIcall [

	| obj |
	obj := self newObj.
	obj icall.
	self assert: obj program codes first second mnemonic equals: #ICALL.
	self assert: obj program codes first second selector equals: #icall
]

{ #category : 'tests' }
AvrAssemblerTest >> testIjmp [

	| obj |
	obj := self newObj.
	obj ijmp.
	self assert: obj program codes first second mnemonic equals: #IJMP.
	self assert: obj program codes first second selector equals: #ijmp
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
AvrAssemblerTest >> testLabelNameAt [

	| obj |
	obj := self newObj.
	self assert: obj labeler labels isEmpty.
	obj labeler labelNameAt: 'abc' put: 123.
	self assert: (obj labelNameAt: 'abc') equals: 123
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
	obj registerFrames reset.
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
	obj registerFrames reset.
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
	obj registerFrames reset.
	obj push: 2.
	r := obj program codes first second.
	self assert: r mnemonic equals: #PUSH.
	self assert: r register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testPushRegistersDuring [

	| obj codes code |
	obj := self newObj.
	obj registerFrames reset.
	obj registerFrames unusedRegisters: (0 to: 31) asOrderedCollection.
	obj
		useRegisters: #( 1 2 )
		in: [ :r1 :r2 | obj pushRegisters: #( 1 2 ) during: [ obj nop ] ].
	codes := obj program validatedCodes.
	self assert: codes size equals: 5.
	code := codes first.
	self assert: code first equals: 0.
	self assert: code second mnemonic equals: #PUSH.
	self assert: code second register equals: 1.
	code := codes second.
	self assert: code first equals: 2.
	self assert: code second mnemonic equals: #PUSH.
	self assert: code second register equals: 2.
	code := codes third.
	self assert: code first equals: 4.
	self assert: code second mnemonic equals: #NOP.
	code := codes fourth.
	self assert: code first equals: 6.
	self assert: code second mnemonic equals: #POP.
	self assert: code second register equals: 2.
	code := codes fifth.
	self assert: code first equals: 8.
	self assert: code second mnemonic equals: #POP.
	self assert: code second register equals: 1.
	self
		should: [ obj pushRegisters: #( 1 2 2 ) during: [  ] ]
		raise: Error
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
AvrAssemblerTest >> testResolveLiterals [

	| obj codes code |
	obj := self newObj.
	obj useLiteral: #[ 1 2 3 ] named: 'abc'.
	obj useLiteral: 'def' named: 'def'.
	obj resolveLiterals.
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
AvrAssemblerTest >> testStxDec [

	| obj r |
	obj := self newObj.
	obj stxDec: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpSTX3).
	self assert: r mnemonic equals: #ST.
	self assert: r register equals: 2.
	self assert: r selector equals: #stxDec:
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
AvrAssemblerTest >> testStyDec [

	| obj r |
	obj := self newObj.
	obj styDec: 2.
	r := obj program codes first second.
	self assert: (r isKindOf: AvrOpSTY3).
	self assert: r mnemonic equals: #ST.
	self assert: r register equals: 2.
	self assert: r selector equals: #styDec:
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
AvrAssemblerTest >> testUseInputsOutputsIn [

	| obj list |
	obj := self newObj.
	obj registerFrames reset.
	list := (1 to: 3) asOrderedCollection.
	obj registerFrames unusedRegisters: list.
	self assert: list size equals: 3.
	obj useInputs: #( 0 4 ) outputs: nil in: [ :r1 :r2 |
		self assert: r1 equals: 0.
		self assert: r2 equals: 4.
		self deny: (list includesAny: #( 0 4 )) ].
	self assert: list size equals: 3.
	self
		should: [
		obj useInputs: #( 3 4 ) outputs: #( 4 ) in: [ :r1 :r2 |  ] ]
		raise: Error.

	obj := self newObj.
	obj registerFrames reset.
	list := (1 to: 3) asOrderedCollection.
	obj registerFrames unusedRegisters: list.
	self assert: list size equals: 3.
	obj useInputs: #( 4 ) outputs: #( 0 ) in: [ :r1 :r2 |
		self assert: r1 equals: 4.
		self assert: r2 equals: 0.
		self deny: (list includesAny: #( 0 4 )) ].
	self assert: list size equals: 3.
	self
		should: [ obj useInputs: #( 3 ) outputs: #( 4 ) in: [ :r1 :r2 |  ] ]
		raise: Error
]

{ #category : 'tests' }
AvrAssemblerTest >> testUseLiteralNamed [

	| obj r |
	obj := self newObj.
	self assert: obj literals isEmpty.
	r := obj useLiteral: #[ 1 2 3 ] named: 'abc'.
	self assert: (r isKindOf: AvrLiteral).
	self assert: r label equals: #literal.
	self assert: r address equals: 'abc'.
	obj useLiteral: #[ 4 5 6 ] named: 'def'.
	obj useLiteral: 'xyz' named: 'abc'.
	self assert: obj literals size equals: 2.
	self assert: (obj literals at: #abc) equals: 'xyz'.
	self assertCollection: (obj literals at: #def) equals: #[ 4 5 6 ].
	self deny: (obj literals includesKey: #ghi)
]

{ #category : 'tests' }
AvrAssemblerTest >> testUseRegisterIn [

	| obj list |
	obj := self newObj.
	obj registerFrames reset.
	list := obj registerFrames unusedRegisters.
	self assert: list size equals: 32.
	obj useRegisterIn: [ :r |
		self assert: r equals: 0.
		self deny: (list includes: r) ].
	self assert: list size equals: 32.
	self
		should: [ obj useRegisterIn: [ :r | list add: r ] ]
		raise: Error
]

{ #category : 'tests' }
AvrAssemblerTest >> testUseRegisterIn2 [

	| obj list |
	obj := self newObj.
	obj registerFrames reset.
	list := obj registerFrames unusedRegisters.
	self assert: list size equals: 32.
	obj useRegister: 1 in: [ :r |
		self assert: r equals: 1.
		self deny: (list includes: r) ].
	self assert: list size equals: 32.
	self
		should: [ obj useRegister: 1 in: [ :r | list add: r ] ]
		raise: Error
]

{ #category : 'tests' }
AvrAssemblerTest >> testUseRegistersIn [

	| obj list |
	obj := self newObj.
	obj registerFrames reset.
	list := obj registerFrames unusedRegisters.
	self assert: list size equals: 32.
	obj use: 4 registersIn: [ :r |
		self assertCollection: r equals: #( 0 1 2 3 ).
		obj
			use: 4
			registersIn: [ :r2 |
			self assertCollection: r2 equals: #( 4 5 6 7 ) ] ].
	self assert: list size equals: 32
]

{ #category : 'tests' }
AvrAssemblerTest >> testUseRegistersIn2 [

	| obj list |
	obj := self newObj.
	obj registerFrames reset.
	list := obj registerFrames unusedRegisters.
	self assert: list size equals: 32.
	obj useRegisters: #( 0 2 4 ) in: [ :r0 :r2 :r4 |
		self assert: r0 equals: 0.
		self assert: r2 equals: 2.
		self assert: r4 equals: 4.
		self deny: (list includes: r0).
		self deny: (list includes: r2).
		self deny: (list includes: r4) ].
	self assert: list size equals: 32
]

{ #category : 'tests' }
AvrAssemblerTest >> testUseSubroutine [

	| obj |
	obj := self newObj.
	self deny: (obj subroutines includes: #abc).
	obj useSubroutine: #abc.
	self assert: (obj subroutines includes: #abc)
]

{ #category : 'tests' }
AvrAssemblerTest >> testWord [

	| obj |
	obj := self newObj.
	obj word: 123.
	self assert: obj program codes first second selector equals: #word:.
	self assert: obj program codes first second immediate equals: 123
]
