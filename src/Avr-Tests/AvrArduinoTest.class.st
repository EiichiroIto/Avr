"
An AvrArduinoTest is a test class for testing the behavior of AvrArduino
"
Class {
	#name : 'AvrArduinoTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrArduinoTest >> newObj [

	^ AvrArduino new
]

{ #category : 'tests' }
AvrArduinoTest >> testAdcDestSource [

	| obj |
	obj := self newObj.
	obj adcDest: 12 source: 23.
	self assert: obj program codes first op mnemonic equals: #ADC.
	self assert: obj program codes first op dest equals: 12.
	self assert: obj program codes first op source equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testAdd [

	| obj |
	obj := self newObj.
	self assert: obj program codeCount equals: 0.
	obj add: AvrOpNOP new.
	obj add: AvrOpNOP new.
	self assert: obj program codeCount equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testAddDestSource [

	| obj |
	obj := self newObj.
	obj addDest: 12 source: 23.
	self assert: obj program codes first op mnemonic equals: #ADD.
	self assert: obj program codes first op dest equals: 12.
	self assert: obj program codes first op source equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testAdiwRData [

	| obj |
	obj := self newObj.
	obj adiwR: 12 data: 23.
	self assert: obj program codes first op mnemonic equals: #ADIW.
	self assert: obj program codes first op register equals: 12.
	self assert: obj program codes first op immediate equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testAndDestSource [

	| obj |
	obj := self newObj.
	obj andDest: 12 source: 23.
	self assert: obj program codes first op mnemonic equals: #AND.
	self assert: obj program codes first op dest equals: 12.
	self assert: obj program codes first op source equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testAndiRData [

	| obj |
	obj := self newObj.
	obj andiR: 12 data: 23.
	self assert: obj program codes first op mnemonic equals: #ANDI.
	self assert: obj program codes first op register equals: 12.
	self assert: obj program codes first op immediate equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testBrcc [

	| obj |
	obj := self newObj.
	obj brcc: 123.
	self assert: obj program codes first op mnemonic equals: #BRCC.
	self assert: obj program codes first op immediate equals: 123
]

{ #category : 'tests' }
AvrArduinoTest >> testBrcs [

	| obj |
	obj := self newObj.
	obj brcs: 123.
	self assert: obj program codes first op mnemonic equals: #BRCS.
	self assert: obj program codes first op immediate equals: 123
]

{ #category : 'tests' }
AvrArduinoTest >> testBreq [

	| obj |
	obj := self newObj.
	obj breq: 123.
	self assert: obj program codes first op mnemonic equals: #BREQ.
	self assert: obj program codes first op immediate equals: 123
]

{ #category : 'tests' }
AvrArduinoTest >> testBrge [

	| obj |
	obj := self newObj.
	obj brge: 123.
	self assert: obj program codes first op mnemonic equals: #BRGE.
	self assert: obj program codes first op immediate equals: 123
]

{ #category : 'tests' }
AvrArduinoTest >> testBrne [

	| obj |
	obj := self newObj.
	obj brne: 123.
	self assert: obj program codes first op mnemonic equals: #BRNE.
	self assert: obj program codes first op immediate equals: 123
]

{ #category : 'tests' }
AvrArduinoTest >> testCall [

	| obj |
	obj := self newObj.
	obj call: 123.
	self assert: obj program codes first op mnemonic equals: #CALL.
	self assert: obj program codes first op immediate equals: 123
]

{ #category : 'tests' }
AvrArduinoTest >> testCli [

	| obj |
	obj := self newObj.
	obj cli.
	self assert: obj program codes first op mnemonic equals: #CLI
]

{ #category : 'tests' }
AvrArduinoTest >> testCom [

	| obj |
	obj := self newObj.
	obj com: 2.
	self assert: obj program codes first op mnemonic equals: #COM.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testCpDestSource [

	| obj |
	obj := self newObj.
	obj cpDest: 12 source: 23.
	self assert: obj program codes first op mnemonic equals: #CP.
	self assert: obj program codes first op dest equals: 12.
	self assert: obj program codes first op source equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testCpcDestSource [

	| obj |
	obj := self newObj.
	obj cpcDest: 12 source: 23.
	self assert: obj program codes first op mnemonic equals: #CPC.
	self assert: obj program codes first op dest equals: 12.
	self assert: obj program codes first op source equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testCpiRData [

	| obj |
	obj := self newObj.
	obj cpiR: 12 data: 23.
	self assert: obj program codes first op mnemonic equals: #CPI.
	self assert: obj program codes first op register equals: 12.
	self assert: obj program codes first op immediate equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testCpseDestSource [

	| obj |
	obj := self newObj.
	obj cpseDest: 12 source: 23.
	self assert: obj program codes first op mnemonic equals: #CPSE.
	self assert: obj program codes first op dest equals: 12.
	self assert: obj program codes first op source equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testDec [

	| obj |
	obj := self newObj.
	obj dec: 2.
	self assert: obj program codes first op mnemonic equals: #DEC.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testEorDestSource [

	| obj |
	obj := self newObj.
	obj eorDest: 12 source: 23.
	self assert: obj program codes first op mnemonic equals: #EOR.
	self assert: obj program codes first op dest equals: 12.
	self assert: obj program codes first op source equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testInRAddress [

	| obj |
	obj := self newObj.
	obj inR: 12 address: 23.
	self assert: obj program codes first op mnemonic equals: #IN.
	self assert: obj program codes first op register equals: 12.
	self assert: obj program codes first op immediate equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testInc [

	| obj |
	obj := self newObj.
	obj inc: 2.
	self assert: obj program codes first op mnemonic equals: #INC.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testInitialize [

	| obj |
	obj := self newObj.
	self assert: (obj program isKindOf: AvrProgram)
]

{ #category : 'tests' }
AvrArduinoTest >> testJmp [

	| obj |
	obj := self newObj.
	obj jmp: 123.
	self assert: obj program codes first op mnemonic equals: #JMP.
	self assert: obj program codes first op immediate equals: 123
]

{ #category : 'tests' }
AvrArduinoTest >> testLabel [

	| obj |
	obj := self newObj.
	self assert: obj program labels isEmpty.
	obj program address: 123.
	obj label: 'abc'.
	self assert: (obj program labels at: 123) equals: 'abc'
]

{ #category : 'tests' }
AvrArduinoTest >> testLddRY [

	| obj |
	obj := self newObj.
	obj lddR: 12 y: 23.
	self assert: (obj program codes first op isKindOf: AvrOpLDDY).
	self assert: obj program codes first op mnemonic equals: #LDD.
	self assert: obj program codes first op register equals: 12.
	self assert: obj program codes first op immediate equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testLddRZ [

	| obj |
	obj := self newObj.
	obj lddR: 12 z: 23.
	self assert: (obj program codes first op isKindOf: AvrOpLDDZ).
	self assert: obj program codes first op mnemonic equals: #LDD.
	self assert: obj program codes first op register equals: 12.
	self assert: obj program codes first op immediate equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testLdiRData [

	| obj |
	obj := self newObj.
	obj ldiR: 12 data: 23.
	self assert: obj program codes first op mnemonic equals: #LDI.
	self assert: obj program codes first op register equals: 12.
	self assert: obj program codes first op immediate equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testLdsRAddress [

	| obj |
	obj := self newObj.
	obj ldsR: 12 address: 23.
	self assert: obj program codes first op mnemonic equals: #LDS.
	self assert: obj program codes first op register equals: 12.
	self assert: obj program codes first op immediate equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testLdx [

	| obj |
	obj := self newObj.
	obj ldx: 2.
	self assert: (obj program codes first op isKindOf: AvrOpLDX1).
	self assert: obj program codes first op mnemonic equals: #LD.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testLdz [

	| obj |
	obj := self newObj.
	obj ldz: 2.
	self assert: (obj program codes first op isKindOf: AvrOpLDZ1).
	self assert: obj program codes first op mnemonic equals: #LD.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testLpmz [

	| obj |
	obj := self newObj.
	obj lpmz: 2.
	self assert: (obj program codes first op isKindOf: AvrOpLPM2).
	self assert: obj program codes first op mnemonic equals: #LPM.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testLpmzInc [

	| obj |
	obj := self newObj.
	obj lpmzInc: 2.
	self assert: (obj program codes first op isKindOf: AvrOpLPM3).
	self assert: obj program codes first op mnemonic equals: #LPM.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testMovDestSource [

	| obj |
	obj := self newObj.
	obj movDest: 12 source: 23.
	self assert: obj program codes first op mnemonic equals: #MOV.
	self assert: obj program codes first op dest equals: 12.
	self assert: obj program codes first op source equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testMovwDestSource [

	| obj |
	obj := self newObj.
	obj movwDest: 12 source: 23.
	self assert: obj program codes first op mnemonic equals: #MOVW.
	self assert: obj program codes first op dest equals: 12.
	self assert: obj program codes first op source equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testMulsDestSource [

	| obj |
	obj := self newObj.
	obj mulsDest: 12 source: 23.
	self assert: obj program codes first op mnemonic equals: #MULS.
	self assert: obj program codes first op dest equals: 12.
	self assert: obj program codes first op source equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testMulsuDestSource [

	| obj |
	obj := self newObj.
	obj mulsuDest: 12 source: 23.
	self assert: obj program codes first op mnemonic equals: #MULSU.
	self assert: obj program codes first op dest equals: 12.
	self assert: obj program codes first op source equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testNewProgram [

	self assert: (self newObj program isKindOf: AvrProgram)
]

{ #category : 'tests' }
AvrArduinoTest >> testNop [

	| obj |
	obj := self newObj.
	obj nop.
	self assert: obj program codes first op selector equals: #nop
]

{ #category : 'tests' }
AvrArduinoTest >> testOrDestSource [

	| obj |
	obj := self newObj.
	obj orDest: 12 source: 23.
	self assert: obj program codes first op mnemonic equals: #OR.
	self assert: obj program codes first op dest equals: 12.
	self assert: obj program codes first op source equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testOriRData [

	| obj |
	obj := self newObj.
	obj oriR: 12 data: 23.
	self assert: obj program codes first op mnemonic equals: #ORI.
	self assert: obj program codes first op register equals: 12.
	self assert: obj program codes first op immediate equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testOutR [

	| obj |
	obj := self newObj.
	obj out: 12 r: 23.
	self assert: obj program codes first op selector equals: #out:r:.
	self assert: obj program codes first op immediate equals: 12.
	self assert: obj program codes first op register equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testPop [

	| obj |
	obj := self newObj.
	obj pop: 2.
	self assert: obj program codes first op mnemonic equals: #POP.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testProgram [

	| obj a |
	obj := self newObj.
	self assert: (obj program isKindOf: AvrProgram).
	a := AvrProgram new.
	obj program: a.
	self assert: obj program identicalTo: a
]

{ #category : 'tests' }
AvrArduinoTest >> testPush [

	| obj |
	obj := self newObj.
	obj push: 2.
	self assert: obj program codes first op mnemonic equals: #PUSH.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testRcall [

	| obj |
	obj := self newObj.
	obj rcall: 123.
	self assert: obj program codes first op mnemonic equals: #RCALL.
	self assert: obj program codes first op immediate equals: 123
]

{ #category : 'tests' }
AvrArduinoTest >> testRet [

	| obj |
	obj := self newObj.
	obj ret.
	self assert: obj program codes first op mnemonic equals: #RET
]

{ #category : 'tests' }
AvrArduinoTest >> testReti [

	| obj |
	obj := self newObj.
	obj reti.
	self assert: obj program codes first op mnemonic equals: #RETI
]

{ #category : 'tests' }
AvrArduinoTest >> testRjmp [

	| obj |
	obj := self newObj.
	obj rjmp: 123.
	self assert: obj program codes first op mnemonic equals: #RJMP.
	self assert: obj program codes first op immediate equals: 123
]

{ #category : 'tests' }
AvrArduinoTest >> testSbcDestSource [

	| obj |
	obj := self newObj.
	obj sbcDest: 12 source: 23.
	self assert: obj program codes first op mnemonic equals: #SBC.
	self assert: obj program codes first op dest equals: 12.
	self assert: obj program codes first op source equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testSbciRData [

	| obj |
	obj := self newObj.
	obj sbciR: 12 data: 23.
	self assert: obj program codes first op mnemonic equals: #SBCI.
	self assert: obj program codes first op register equals: 12.
	self assert: obj program codes first op immediate equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testSbisRData [

	| obj |
	obj := self newObj.
	obj sbisR: 12 data: 23.
	self assert: obj program codes first op mnemonic equals: #SBIS.
	self assert: obj program codes first op register equals: 12.
	self assert: obj program codes first op immediate equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testSbiwRData [

	| obj |
	obj := self newObj.
	obj sbiwR: 12 data: 23.
	self assert: obj program codes first op mnemonic equals: #SBIW.
	self assert: obj program codes first op register equals: 12.
	self assert: obj program codes first op immediate equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testSei [

	| obj |
	obj := self newObj.
	obj sei.
	self assert: obj program codes first op mnemonic equals: #SEI
]

{ #category : 'tests' }
AvrArduinoTest >> testStdYR [

	| obj |
	obj := self newObj.
	obj stdY: 12 r: 23.
	self assert: (obj program codes first op isKindOf: AvrOpSTDY).
	self assert: obj program codes first op mnemonic equals: #STD.
	self assert: obj program codes first op register equals: 23.
	self assert: obj program codes first op immediate equals: 12
]

{ #category : 'tests' }
AvrArduinoTest >> testStdZR [

	| obj |
	obj := self newObj.
	obj stdZ: 12 r: 23.
	self assert: (obj program codes first op isKindOf: AvrOpSTDZ).
	self assert: obj program codes first op mnemonic equals: #STD.
	self assert: obj program codes first op register equals: 23.
	self assert: obj program codes first op immediate equals: 12
]

{ #category : 'tests' }
AvrArduinoTest >> testStsRData [

	| obj |
	obj := self newObj.
	obj stsR: 12 data: 23.
	self assert: obj program codes first op mnemonic equals: #STS.
	self assert: obj program codes first op register equals: 12.
	self assert: obj program codes first op immediate equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testStx [

	| obj |
	obj := self newObj.
	obj stx: 2.
	self assert: (obj program codes first op isKindOf: AvrOpSTX1).
	self assert: obj program codes first op mnemonic equals: #ST.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testStxInc [

	| obj |
	obj := self newObj.
	obj stxInc: 2.
	self assert: (obj program codes first op isKindOf: AvrOpSTX2).
	self assert: obj program codes first op mnemonic equals: #ST.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testSty [

	| obj |
	obj := self newObj.
	obj sty: 2.
	self assert: (obj program codes first op isKindOf: AvrOpSTY1).
	self assert: obj program codes first op mnemonic equals: #ST.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testStyInc [

	| obj |
	obj := self newObj.
	obj styInc: 2.
	self assert: (obj program codes first op isKindOf: AvrOpSTY2).
	self assert: obj program codes first op mnemonic equals: #ST.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testStz [

	| obj |
	obj := self newObj.
	obj stz: 2.
	self assert: (obj program codes first op isKindOf: AvrOpSTZ1).
	self assert: obj program codes first op mnemonic equals: #ST.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testStzInc [

	| obj |
	obj := self newObj.
	obj stzInc: 2.
	self assert: (obj program codes first op isKindOf: AvrOpSTZ2).
	self assert: obj program codes first op mnemonic equals: #ST.
	self assert: obj program codes first op register equals: 2
]

{ #category : 'tests' }
AvrArduinoTest >> testSubDestSource [

	| obj |
	obj := self newObj.
	obj subDest: 12 source: 23.
	self assert: obj program codes first op mnemonic equals: #SUB.
	self assert: obj program codes first op dest equals: 12.
	self assert: obj program codes first op source equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testSubiRData [

	| obj |
	obj := self newObj.
	obj subiR: 12 data: 23.
	self assert: obj program codes first op mnemonic equals: #SUBI.
	self assert: obj program codes first op register equals: 12.
	self assert: obj program codes first op immediate equals: 23
]

{ #category : 'tests' }
AvrArduinoTest >> testWord [

	| obj |
	obj := self newObj.
	obj word: 123.
	self assert: obj program codes first op selector equals: #word:.
	self assert: obj program codes first op immediate equals: 123
]
