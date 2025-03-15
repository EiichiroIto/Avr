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
	self assert: obj program codes first mnemonic equals: #ADC.
	self assert: obj program codes first dest equals: 12.
	self assert: obj program codes first source equals: 23
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
	self assert: obj program codes first mnemonic equals: #ADD.
	self assert: obj program codes first dest equals: 12.
	self assert: obj program codes first source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testAdiwRData [

	| obj |
	obj := self newObj.
	obj adiwR: 12 data: 23.
	self assert: obj program codes first mnemonic equals: #ADIW.
	self assert: obj program codes first register equals: 12.
	self assert: obj program codes first immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testAndDestSource [

	| obj |
	obj := self newObj.
	obj andDest: 12 source: 23.
	self assert: obj program codes first mnemonic equals: #AND.
	self assert: obj program codes first dest equals: 12.
	self assert: obj program codes first source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testAndiRData [

	| obj |
	obj := self newObj.
	obj andiR: 12 data: 23.
	self assert: obj program codes first mnemonic equals: #ANDI.
	self assert: obj program codes first register equals: 12.
	self assert: obj program codes first immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testBrcc [

	| obj |
	obj := self newObj.
	obj brcc: 123.
	self assert: obj program codes first mnemonic equals: #BRCC.
	self assert: obj program codes first immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testBrcs [

	| obj |
	obj := self newObj.
	obj brcs: 123.
	self assert: obj program codes first mnemonic equals: #BRCS.
	self assert: obj program codes first immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testBreq [

	| obj |
	obj := self newObj.
	obj breq: 123.
	self assert: obj program codes first mnemonic equals: #BREQ.
	self assert: obj program codes first immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testBrge [

	| obj |
	obj := self newObj.
	obj brge: 123.
	self assert: obj program codes first mnemonic equals: #BRGE.
	self assert: obj program codes first immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testBrne [

	| obj |
	obj := self newObj.
	obj brne: 123.
	self assert: obj program codes first mnemonic equals: #BRNE.
	self assert: obj program codes first immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testCall [

	| obj |
	obj := self newObj.
	obj call: 123.
	self assert: obj program codes first mnemonic equals: #CALL.
	self assert: obj program codes first immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testCli [

	| obj |
	obj := self newObj.
	obj cli.
	self assert: obj program codes first mnemonic equals: #CLI
]

{ #category : 'tests' }
AvrAssemblerTest >> testCom [

	| obj |
	obj := self newObj.
	obj com: 2.
	self assert: obj program codes first mnemonic equals: #COM.
	self assert: obj program codes first register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testCpDestSource [

	| obj |
	obj := self newObj.
	obj cpDest: 12 source: 23.
	self assert: obj program codes first mnemonic equals: #CP.
	self assert: obj program codes first dest equals: 12.
	self assert: obj program codes first source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testCpcDestSource [

	| obj |
	obj := self newObj.
	obj cpcDest: 12 source: 23.
	self assert: obj program codes first mnemonic equals: #CPC.
	self assert: obj program codes first dest equals: 12.
	self assert: obj program codes first source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testCpiRData [

	| obj |
	obj := self newObj.
	obj cpiR: 12 data: 23.
	self assert: obj program codes first mnemonic equals: #CPI.
	self assert: obj program codes first register equals: 12.
	self assert: obj program codes first immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testCpseDestSource [

	| obj |
	obj := self newObj.
	obj cpseDest: 12 source: 23.
	self assert: obj program codes first mnemonic equals: #CPSE.
	self assert: obj program codes first dest equals: 12.
	self assert: obj program codes first source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testDec [

	| obj |
	obj := self newObj.
	obj dec: 2.
	self assert: obj program codes first mnemonic equals: #DEC.
	self assert: obj program codes first register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testEorDestSource [

	| obj |
	obj := self newObj.
	obj eorDest: 12 source: 23.
	self assert: obj program codes first mnemonic equals: #EOR.
	self assert: obj program codes first dest equals: 12.
	self assert: obj program codes first source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testInRAddress [

	| obj |
	obj := self newObj.
	obj inR: 12 address: 23.
	self assert: obj program codes first mnemonic equals: #IN.
	self assert: obj program codes first register equals: 12.
	self assert: obj program codes first immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testInc [

	| obj |
	obj := self newObj.
	obj inc: 2.
	self assert: obj program codes first mnemonic equals: #INC.
	self assert: obj program codes first register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testJmp [

	| obj |
	obj := self newObj.
	obj jmp: 123.
	self assert: obj program codes first mnemonic equals: #JMP.
	self assert: obj program codes first immediate equals: 123
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
AvrAssemblerTest >> testLddRY [

	| obj |
	obj := self newObj.
	obj lddR: 12 y: 23.
	self assert: (obj program codes first isKindOf: AvrOpLDDY).
	self assert: obj program codes first mnemonic equals: #LDD.
	self assert: obj program codes first register equals: 12.
	self assert: obj program codes first immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testLddRZ [

	| obj |
	obj := self newObj.
	obj lddR: 12 z: 23.
	self assert: (obj program codes first isKindOf: AvrOpLDDZ).
	self assert: obj program codes first mnemonic equals: #LDD.
	self assert: obj program codes first register equals: 12.
	self assert: obj program codes first immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdiRData [

	| obj |
	obj := self newObj.
	obj ldiR: 12 data: 23.
	self assert: obj program codes first mnemonic equals: #LDI.
	self assert: obj program codes first register equals: 12.
	self assert: obj program codes first immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdsRAddress [

	| obj |
	obj := self newObj.
	obj ldsR: 12 address: 23.
	self assert: obj program codes first mnemonic equals: #LDS.
	self assert: obj program codes first register equals: 12.
	self assert: obj program codes first immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdx [

	| obj |
	obj := self newObj.
	obj ldx: 2.
	self assert: (obj program codes first isKindOf: AvrOpLDX1).
	self assert: obj program codes first mnemonic equals: #LD.
	self assert: obj program codes first register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testLdz [

	| obj |
	obj := self newObj.
	obj ldz: 2.
	self assert: (obj program codes first isKindOf: AvrOpLDZ1).
	self assert: obj program codes first mnemonic equals: #LD.
	self assert: obj program codes first register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testLpmz [

	| obj |
	obj := self newObj.
	obj lpmz: 2.
	self assert: (obj program codes first isKindOf: AvrOpLPM2).
	self assert: obj program codes first mnemonic equals: #LPM.
	self assert: obj program codes first register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testLpmzInc [

	| obj |
	obj := self newObj.
	obj lpmzInc: 2.
	self assert: (obj program codes first isKindOf: AvrOpLPM3).
	self assert: obj program codes first mnemonic equals: #LPM.
	self assert: obj program codes first register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testMovDestSource [

	| obj |
	obj := self newObj.
	obj movDest: 12 source: 23.
	self assert: obj program codes first mnemonic equals: #MOV.
	self assert: obj program codes first dest equals: 12.
	self assert: obj program codes first source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testMovwDestSource [

	| obj |
	obj := self newObj.
	obj movwDest: 12 source: 23.
	self assert: obj program codes first mnemonic equals: #MOVW.
	self assert: obj program codes first dest equals: 12.
	self assert: obj program codes first source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testMulsDestSource [

	| obj |
	obj := self newObj.
	obj mulsDest: 12 source: 23.
	self assert: obj program codes first mnemonic equals: #MULS.
	self assert: obj program codes first dest equals: 12.
	self assert: obj program codes first source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testMulsuDestSource [

	| obj |
	obj := self newObj.
	obj mulsuDest: 12 source: 23.
	self assert: obj program codes first mnemonic equals: #MULSU.
	self assert: obj program codes first dest equals: 12.
	self assert: obj program codes first source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testNop [

	| obj |
	obj := self newObj.
	obj nop.
	self assert: obj program codes first selector equals: #nop
]

{ #category : 'tests' }
AvrAssemblerTest >> testOrDestSource [

	| obj |
	obj := self newObj.
	obj orDest: 12 source: 23.
	self assert: obj program codes first mnemonic equals: #OR.
	self assert: obj program codes first dest equals: 12.
	self assert: obj program codes first source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testOriRData [

	| obj |
	obj := self newObj.
	obj oriR: 12 data: 23.
	self assert: obj program codes first mnemonic equals: #ORI.
	self assert: obj program codes first register equals: 12.
	self assert: obj program codes first immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testOutR [

	| obj |
	obj := self newObj.
	obj out: 12 r: 23.
	self assert: obj program codes first selector equals: #out:r:.
	self assert: obj program codes first immediate equals: 12.
	self assert: obj program codes first register equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testPop [

	| obj |
	obj := self newObj.
	obj pop: 2.
	self assert: obj program codes first mnemonic equals: #POP.
	self assert: obj program codes first register equals: 2
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

	| obj |
	obj := self newObj.
	obj push: 2.
	self assert: obj program codes first mnemonic equals: #PUSH.
	self assert: obj program codes first register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testRcall [

	| obj |
	obj := self newObj.
	obj rcall: 123.
	self assert: obj program codes first mnemonic equals: #RCALL.
	self assert: obj program codes first immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testRet [

	| obj |
	obj := self newObj.
	obj ret.
	self assert: obj program codes first mnemonic equals: #RET
]

{ #category : 'tests' }
AvrAssemblerTest >> testReti [

	| obj |
	obj := self newObj.
	obj reti.
	self assert: obj program codes first mnemonic equals: #RETI
]

{ #category : 'tests' }
AvrAssemblerTest >> testRjmp [

	| obj |
	obj := self newObj.
	obj rjmp: 123.
	self assert: obj program codes first mnemonic equals: #RJMP.
	self assert: obj program codes first immediate equals: 123
]

{ #category : 'tests' }
AvrAssemblerTest >> testSbcDestSource [

	| obj |
	obj := self newObj.
	obj sbcDest: 12 source: 23.
	self assert: obj program codes first mnemonic equals: #SBC.
	self assert: obj program codes first dest equals: 12.
	self assert: obj program codes first source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testSbciRData [

	| obj |
	obj := self newObj.
	obj sbciR: 12 data: 23.
	self assert: obj program codes first mnemonic equals: #SBCI.
	self assert: obj program codes first register equals: 12.
	self assert: obj program codes first immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testSbisRData [

	| obj |
	obj := self newObj.
	obj sbisR: 12 data: 23.
	self assert: obj program codes first mnemonic equals: #SBIS.
	self assert: obj program codes first register equals: 12.
	self assert: obj program codes first immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testSbiwRData [

	| obj |
	obj := self newObj.
	obj sbiwR: 12 data: 23.
	self assert: obj program codes first mnemonic equals: #SBIW.
	self assert: obj program codes first register equals: 12.
	self assert: obj program codes first immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testSei [

	| obj |
	obj := self newObj.
	obj sei.
	self assert: obj program codes first mnemonic equals: #SEI
]

{ #category : 'tests' }
AvrAssemblerTest >> testStdYR [

	| obj |
	obj := self newObj.
	obj stdY: 12 r: 23.
	self assert: (obj program codes first isKindOf: AvrOpSTDY).
	self assert: obj program codes first mnemonic equals: #STD.
	self assert: obj program codes first register equals: 23.
	self assert: obj program codes first immediate equals: 12
]

{ #category : 'tests' }
AvrAssemblerTest >> testStdZR [

	| obj |
	obj := self newObj.
	obj stdZ: 12 r: 23.
	self assert: (obj program codes first isKindOf: AvrOpSTDZ).
	self assert: obj program codes first mnemonic equals: #STD.
	self assert: obj program codes first register equals: 23.
	self assert: obj program codes first immediate equals: 12
]

{ #category : 'tests' }
AvrAssemblerTest >> testStsRData [

	| obj |
	obj := self newObj.
	obj stsR: 12 data: 23.
	self assert: obj program codes first mnemonic equals: #STS.
	self assert: obj program codes first register equals: 12.
	self assert: obj program codes first immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testStx [

	| obj |
	obj := self newObj.
	obj stx: 2.
	self assert: (obj program codes first isKindOf: AvrOpSTX1).
	self assert: obj program codes first mnemonic equals: #ST.
	self assert: obj program codes first register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testStxInc [

	| obj |
	obj := self newObj.
	obj stxInc: 2.
	self assert: (obj program codes first isKindOf: AvrOpSTX2).
	self assert: obj program codes first mnemonic equals: #ST.
	self assert: obj program codes first register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testSty [

	| obj |
	obj := self newObj.
	obj sty: 2.
	self assert: (obj program codes first isKindOf: AvrOpSTY1).
	self assert: obj program codes first mnemonic equals: #ST.
	self assert: obj program codes first register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testStyInc [

	| obj |
	obj := self newObj.
	obj styInc: 2.
	self assert: (obj program codes first isKindOf: AvrOpSTY2).
	self assert: obj program codes first mnemonic equals: #ST.
	self assert: obj program codes first register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testStz [

	| obj |
	obj := self newObj.
	obj stz: 2.
	self assert: (obj program codes first isKindOf: AvrOpSTZ1).
	self assert: obj program codes first mnemonic equals: #ST.
	self assert: obj program codes first register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testStzInc [

	| obj |
	obj := self newObj.
	obj stzInc: 2.
	self assert: (obj program codes first isKindOf: AvrOpSTZ2).
	self assert: obj program codes first mnemonic equals: #ST.
	self assert: obj program codes first register equals: 2
]

{ #category : 'tests' }
AvrAssemblerTest >> testSubDestSource [

	| obj |
	obj := self newObj.
	obj subDest: 12 source: 23.
	self assert: obj program codes first mnemonic equals: #SUB.
	self assert: obj program codes first dest equals: 12.
	self assert: obj program codes first source equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testSubiRData [

	| obj |
	obj := self newObj.
	obj subiR: 12 data: 23.
	self assert: obj program codes first mnemonic equals: #SUBI.
	self assert: obj program codes first register equals: 12.
	self assert: obj program codes first immediate equals: 23
]

{ #category : 'tests' }
AvrAssemblerTest >> testWord [

	| obj |
	obj := self newObj.
	obj word: 123.
	self assert: obj program codes first selector equals: #word:.
	self assert: obj program codes first immediate equals: 123
]
