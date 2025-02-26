"
An AvrAsmParserTest is a test class for testing the behavior of AvrAsmParser
"
Class {
	#name : 'AvrAsmParserTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Parser',
	#package : 'Avr-Tests',
	#tag : 'Parser'
}

{ #category : 'instance creation' }
AvrAsmParserTest >> newParser [

	^ AvrAsmParser new
]

{ #category : 'tests' }
AvrAsmParserTest >> testAbsoluteOps [

	| obj r |
	obj := self newParser.
	r := obj absoluteOps parse: 'call 0x246'.
	self assert: (r isKindOf: AvrOpCALL).
	self assert: r immediate equals: 16r123.
	r := obj absoluteOps parse: 'jmp 0x468'.
	self assert: (r isKindOf: AvrOpJMP).
	self assert: r immediate equals: 16r234
]

{ #category : 'tests' }
AvrAsmParserTest >> testAddress [

	| obj r |
	obj := self newParser.
	r := obj address parse: ' abcd: '.
	self assert: r equals: 16rabcd
]

{ #category : 'tests' }
AvrAsmParserTest >> testBinaryCodes [

	| obj r |
	obj := self newParser.
	r := obj binaryCodes parse: '10'.
	self assert: r size equals: 1.
	self assert: r first equals: 16r10.
	r := obj binaryCodes parse: '23 ab'.
	self assert: r size equals: 2.
	self assert: r first equals: 16r23.
	self assert: r second equals: 16rab
]

{ #category : 'tests' }
AvrAsmParserTest >> testBuilder [

	self assert: (self newParser builder isKindOf: AvrInstructionBuilder)
]

{ #category : 'tests' }
AvrAsmParserTest >> testComment [

	| obj r |
	obj := self newParser.
	r := obj comment parse: ';'.
	self assert: r isEmpty.
	r := obj comment parse: ';  abc def'.
	self assert: r equals: 'abc def'
]

{ #category : 'tests' }
AvrAsmParserTest >> testDecimalNumber [

	| obj r |
	obj := self newParser.
	r := obj decimalNumber parse: '0'.
	self assert: r equals: 0.
	r := obj decimalNumber parse: '123'.
	self assert: r equals: 123
]

{ #category : 'tests' }
AvrAsmParserTest >> testHex2Number [

	| obj r |
	obj := self newParser.
	r := obj hex2Number parse: '00'.
	self assert: r equals: 0.
	r := obj hex2Number parse: 'ab'.
	self assert: r equals: 16rab
]

{ #category : 'tests' }
AvrAsmParserTest >> testHexLiteral [

	| obj r |
	obj := self newParser.
	r := obj hexLiteral parse: '0x00'.
	self assert: r equals: 0.
	r := obj hexLiteral parse: '0xab'.
	self assert: r equals: 16rab
]

{ #category : 'tests' }
AvrAsmParserTest >> testIn [

	| obj r |
	obj := self newParser.
	r := obj in parse: 'in r4, 0x23'.
	self assert: (r isKindOf: AvrOpIN).
	self assert: r immediate equals: 16r23.
	self assert: r register equals: 4
]

{ #category : 'tests' }
AvrAsmParserTest >> testLd [

	| obj r |
	obj := self newParser.
	r := obj ld parse: 'ld r2, X'.
	self assert: (r isKindOf: AvrOpLDX1).
	self assert: r register equals: 2.
	r := obj ld parse: 'ld r3, X+'.
	self assert: (r isKindOf: AvrOpLDX2).
	self assert: r register equals: 3.
	r := obj ld parse: 'ld r4, -X'.
	self assert: (r isKindOf: AvrOpLDX3).
	self assert: r register equals: 4.
	r := obj ld parse: 'ld r2, Y'.
	self assert: (r isKindOf: AvrOpLDY1).
	self assert: r register equals: 2.
	r := obj ld parse: 'ld r3, Y+'.
	self assert: (r isKindOf: AvrOpLDY2).
	self assert: r register equals: 3.
	r := obj ld parse: 'ld r4, -Y'.
	self assert: (r isKindOf: AvrOpLDY3).
	self assert: r register equals: 4.
	r := obj ld parse: 'ld r2, Z'.
	self assert: (r isKindOf: AvrOpLDZ1).
	self assert: r register equals: 2.
	r := obj ld parse: 'ld r3, Z+'.
	self assert: (r isKindOf: AvrOpLDZ2).
	self assert: r register equals: 3.
	r := obj ld parse: 'ld r4, -Z'.
	self assert: (r isKindOf: AvrOpLDZ3).
	self assert: r register equals: 4
]

{ #category : 'tests' }
AvrAsmParserTest >> testLdd [

	| obj r |
	obj := self newParser.
	r := obj ldd parse: 'ldd r2, Y+60'.
	self assert: (r isKindOf: AvrOpLDDY).
	self assert: r register equals: 2.
	self assert: r immediate equals: 60.
	r := obj ldd parse: 'ldd r3, Z+61'.
	self assert: (r isKindOf: AvrOpLDDZ).
	self assert: r register equals: 3.
	self assert: r immediate equals: 61
]

{ #category : 'tests' }
AvrAsmParserTest >> testLpm [

	| obj r |
	obj := self newParser.
	r := obj lpm parse: 'lpm'.
	self assert: (r isKindOf: AvrOpLPM1).
	r := obj lpm parse: 'lpm r10, Z'.
	self assert: (r isKindOf: AvrOpLPM2).
	self assert: r register equals: 10.
	r := obj lpm parse: 'lpm r5, Z+'.
	self assert: (r isKindOf: AvrOpLPM3).
	self assert: r register equals: 5
]

{ #category : 'tests' }
AvrAsmParserTest >> testNoOperandOps [

	| obj r |
	obj := self newParser.
	{
		{ 'break'. #AvrOpBREAK }.
		{ 'clc'. #AvrOpCLC }.
		{ 'clh'. #AvrOpCLH }.
		{ 'cli'. #AvrOpCLI }.
		{ 'cln'. #AvrOpCLN }.
		{ 'cls'. #AvrOpCLS }.
		{ 'clt'. #AvrOpCLT }.
		{ 'clv'. #AvrOpCLV }.
		{ 'clz'. #AvrOpCLZ }.
		{ 'eicall'. #AvrOpEICALL }.
		{ 'eijmp'. #AvrOpEIJMP }.
		{ 'icall'. #AvrOpICALL }.
		{ 'ijmp'. #AvrOpIJMP }.
		{ 'nop'. #AvrOpNOP }.
		{ 'ret'. #AvrOpRET }.
		{ 'reti'. #AvrOpRETI }.
		{ 'sec'. #AvrOpSEC }.
		{ 'seh'. #AvrOpSEH }.
		{ 'sei'. #AvrOpSEI }.
		{ 'sen'. #AvrOpSEN }.
		{ 'ses'. #AvrOpSES }.
		{ 'set'. #AvrOpSET }.
		{ 'sev'. #AvrOpSEV }.
		{ 'sez'. #AvrOpSEZ }.
		{ 'sleep'. #AvrOpSLEEP }.
		{ 'wdr'. #AvrOpWDR }.
		{ 'elpm'. #AvrOpELPM1 } } do: [ :each |
		r := obj noOperandOps parse: each first.
		self assert: r class name equals: each second ]
]

{ #category : 'tests' }
AvrAsmParserTest >> testOneRegisterOps [

	| obj r |
	obj := self newParser.
	{
		{ 'bclr'. #AvrOpBCLR }.
		{ 'bset'. #AvrOpBSET }.
		{ 'com'. #AvrOpCOM }.
		{ 'dec'. #AvrOpDEC }.
		{ 'inc'. #AvrOpINC }.
		{ 'asr'. #AvrOpASR }.
		{ 'lsr'. #AvrOpLSR }.
		{ 'neg'. #AvrOpNEG }.
		{ 'pop'. #AvrOpPOP }.
		{ 'push'. #AvrOpPUSH }.
		{ 'ror'. #AvrOpROR }.
		{ 'swap'. #AvrOpSWAP } } do: [ :each |
		r := obj oneRegisterOps parse: each first , ' r5'.
		self assert: r class name equals: each second.
		self assert: r register equals: 5 ]
]

{ #category : 'tests' }
AvrAsmParserTest >> testOut [

	| obj r |
	obj := self newParser.
	r := obj out parse: 'out 0xcd, r5'.
	self assert: (r isKindOf: AvrOpOUT).
	self assert: r immediate equals: 16rcd.
	self assert: r register equals: 5
]

{ #category : 'tests' }
AvrAsmParserTest >> testRegister [

	| obj r |
	obj := self newParser.
	r := obj register parse: 'r5'.
	self assert: r equals: 5.
	r := obj register parse: 'r12'.
	self assert: r equals: 12
]

{ #category : 'tests' }
AvrAsmParserTest >> testRegisterThenImmediate [

	| obj r |
	obj := self newParser.
	r := obj registerThenImmediate parse: 'r5, 0x42'.
	self assert: r first equals: 5.
	self assert: r second equals: 16r42
]

{ #category : 'tests' }
AvrAsmParserTest >> testRegisterThenImmediateOps [

	| obj r |
	obj := self newParser.
	{
		{ 'andi'. #AvrOpANDI }.
		{ 'adiw'. #AvrOpADIW }.
		{ 'sbiw'. #AvrOpSBIW }.
		{ 'bld'. #AvrOpBLD }.
		{ 'bst'. #AvrOpBST }.
		{ 'cpi'. #AvrOpCPI }.
		{ 'ldi'. #AvrOpLDI }.
		{ 'brbc'. #AvrOpBRBC }.
		{ 'ori'. #AvrOpORI }.
		{ 'brbs'. #AvrOpBRBS }.
		{ 'sbci'. #AvrOpSBCI }.
		{ 'sbrc'. #AvrOpSBRC }.
		{ 'sbrs'. #AvrOpSBRS }.
		{ 'subi'. #AvrOpSUBI }.
		{ 'sbic'. #AvrOpSBIC }.
		{ 'lds'. #AvrOpLDS } } do: [ :each |
		r := obj registerThenImmediateOps parse: each first , ' r15 , 0x45'.
		self assert: r class name equals: each second.
		self assert: r register equals: 15.
		self assert: r immediate equals: 16r45 ]
]

{ #category : 'tests' }
AvrAsmParserTest >> testRelativeAddress [

	| obj r |
	obj := self newParser.
	r := obj relativeAddress parse: '.+6'.
	self assert: r equals: 3.
	r := obj relativeAddress parse: '.-16'.
	self assert: r equals: -8
]

{ #category : 'tests' }
AvrAsmParserTest >> testRelativeOps [

	| obj r |
	obj := self newParser.
	{
		{ 'brcc'. #AvrOpBRCC }.
		{ 'brcs'. #AvrOpBRCS }.
		{ 'breq'. #AvrOpBREQ }.
		{ 'brge'. #AvrOpBRGE }.
		{ 'brhc'. #AvrOpBRHC }.
		{ 'brhs'. #AvrOpBRHS }.
		{ 'brid'. #AvrOpBRID }.
		{ 'brie'. #AvrOpBRIE }.
		{ 'brlt'. #AvrOpBRLT }.
		{ 'brmi'. #AvrOpBRMI }.
		{ 'brne'. #AvrOpBRNE }.
		{ 'brpl'. #AvrOpBRPL }.
		{ 'brtc'. #AvrOpBRTC }.
		{ 'brts'. #AvrOpBRTS }.
		{ 'brvc'. #AvrOpBRVC }.
		{ 'brvs'. #AvrOpBRVS }.
		{ 'rcall'. #AvrOpRCALL }.
		{ 'rjmp'. #AvrOpRJMP } } do: [ :each |
		r := obj relativeOps parse: each first , ' .-10'.
		self assert: r class name equals: each second.
		self assert: r immediate equals: -5 ]
]

{ #category : 'tests' }
AvrAsmParserTest >> testSbis [

	| obj r |
	obj := self newParser.
	r := obj sbis parse: 'sbis 0x23, 19'.
	self assert: (r isKindOf: AvrOpSBIS).
	self assert: r register equals: 16r23.
	self assert: r immediate equals: 19
]

{ #category : 'tests' }
AvrAsmParserTest >> testSt [

	| obj r |
	obj := self newParser.
	r := obj st parse: 'st X, r2'.
	self assert: (r isKindOf: AvrOpSTX1).
	self assert: r register equals: 2.
	r := obj st parse: 'st X+, r3'.
	self assert: (r isKindOf: AvrOpSTX2).
	self assert: r register equals: 3.
	r := obj st parse: 'st -X, r4'.
	self assert: (r isKindOf: AvrOpSTX3).
	self assert: r register equals: 4.
	r := obj st parse: 'st Y, r2'.
	self assert: (r isKindOf: AvrOpSTY1).
	self assert: r register equals: 2.
	r := obj st parse: 'st Y+, r3'.
	self assert: (r isKindOf: AvrOpSTY2).
	self assert: r register equals: 3.
	r := obj st parse: 'st -Y, r4'.
	self assert: (r isKindOf: AvrOpSTY3).
	self assert: r register equals: 4.
	r := obj st parse: 'st Z, r2'.
	self assert: (r isKindOf: AvrOpSTZ1).
	self assert: r register equals: 2.
	r := obj st parse: 'st Z+ , r3'.
	self assert: (r isKindOf: AvrOpSTZ2).
	self assert: r register equals: 3.
	r := obj st parse: 'st -Z ,r4'.
	self assert: (r isKindOf: AvrOpSTZ3).
	self assert: r register equals: 4
]

{ #category : 'tests' }
AvrAsmParserTest >> testStd [

	| obj r |
	obj := self newParser.
	r := obj std parse: 'std Y+60, r2'.
	self assert: (r isKindOf: AvrOpSTDY).
	self assert: r register equals: 2.
	self assert: r immediate equals: 60.
	r := obj std parse: 'std Z+61, r3'.
	self assert: (r isKindOf: AvrOpSTDZ).
	self assert: r register equals: 3.
	self assert: r immediate equals: 61
]

{ #category : 'tests' }
AvrAsmParserTest >> testSts [

	| obj r |
	obj := self newParser.
	r := obj sts parse: 'sts 0x23, r19'.
	self assert: (r isKindOf: AvrOpSTS).
	self assert: r immediate equals: 16r23.
	self assert: r register equals: 19
]

{ #category : 'tests' }
AvrAsmParserTest >> testTwoRegisters [

	| obj r |
	obj := self newParser.
	r := obj twoRegisters parse: 'r15, r3'.
	self assert: r first equals: 15.
	self assert: r second equals: 3
]

{ #category : 'tests' }
AvrAsmParserTest >> testTwoRegistersOps [

	| obj r |
	obj := self newParser.
	{
		{ 'adc'. #AvrOpADC }.
		{ 'add'. #AvrOpADD }.
		{ 'and'. #AvrOpAND }.
		{ 'cp'. #AvrOpCP }.
		{ 'cpc'. #AvrOpCPC }.
		{ 'cpse'. #AvrOpCPSE }.
		{ 'eor'. #AvrOpEOR }.
		{ 'fmul'. #AvrOpFMUL }.
		{ 'fmuls'. #AvrOpFMULS }.
		{ 'fmulsu'. #AvrOpFMULSU }.
		{ 'mov'. #AvrOpMOV }.
		{ 'movw'. #AvrOpMOVW }.
		{ 'mul'. #AvrOpMUL }.
		{ 'muls'. #AvrOpMULS }.
		{ 'mulsu'. #AvrOpMULSU }.
		{ 'or'. #AvrOpOR }.
		{ 'sbc'. #AvrOpSBC }.
		{ 'sub'. #AvrOpSUB } } do: [ :each |
		r := obj twoRegistersOps parse: each first , ' r15 , r2'.
		self assert: r class name equals: each second.
		self assert: r dest equals: 15.
		self assert: r source equals: 2 ]
]

{ #category : 'tests' }
AvrAsmParserTest >> testWord [

	| obj r |
	obj := self newParser.
	r := obj word parse: '.word 0xabcd'.
	self assert: (r isKindOf: AvrSemiWord).
	self assert: r immediate equals: 16rabcd
]
