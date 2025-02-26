"
An AvrAsmGrammarTest is a test class for testing the behavior of AvrAsmGrammar
"
Class {
	#name : 'AvrAsmGrammarTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Parser',
	#package : 'Avr-Tests',
	#tag : 'Parser'
}

{ #category : 'instance creation' }
AvrAsmGrammarTest >> newParser [

	^ AvrAsmGrammar new
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testAbsoluteOps [

	| obj r |
	obj := self newParser.
	r := obj absoluteOps parse: 'call 0x123'.
	self assert: r isArray.
	self assert: r first equals: 'call'.
	self assert: r third first equals: '0x'.
	self assert: r third second equals: '123'.
	r := obj absoluteOps parse: 'jmp 0x456'.
	self assert: r isArray.
	self assert: r first equals: 'jmp'.
	self assert: r third first equals: '0x'.
	self assert: r third second equals: '456'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testAddress [

	| obj r |
	obj := self newParser.
	r := obj address parse: ' 1234: '.
	self assert: r isArray.
	self assert: r size equals: 4.
	self assert: r second equals: '1234'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testBinaryCodes [

	| obj r |
	obj := self newParser.
	r := obj binaryCodes parse: '23'.
	self assert: r first equals: '23'.
	self assert: r second isEmpty.
	r := obj binaryCodes parse: '23 45 67'.
	self assert: r first equals: '23'.
	self assert: r second first second equals: '45'.
	self assert: r second second second equals: '67'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testComment [

	| obj r |
	obj := self newParser.
	r := obj comment parse: '; abc def'.
	self assert: r third equals: 'abc def'.
	r := obj comment parse: ';'.
	self assert: r third equals: ''
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testDecimalNumber [

	| obj r |
	obj := self newParser.
	r := obj decimalNumber parse: '0'.
	self assert: r equals: '0'.
	r := obj decimalNumber parse: '0123'.
	self assert: r equals: '0123'.
	r := obj decimalNumber parse: '456'.
	self assert: r equals: '456'.
	r := obj decimalNumber parse: '789'.
	self assert: r equals: '789'.
	r := obj decimalNumber parse: '12eg'.
	self assert: r equals: '12'.
	r := obj decimalNumber parse: ''.
	self assert: r isPetitFailure.
	r := obj decimalNumber parse: 'g12e'.
	self assert: r isPetitFailure
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testDigit [

	| obj r |
	obj := self newParser.
	'0123456789' do: [ :each |
		r := obj digit parse: each asString.
		self assert: r equals: each asString ].
	r := obj digit parse: 'A'.
	self assert: r isPetitFailure
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testHex [

	| obj r |
	obj := self newParser.
	'0123456789ABCDEFabcdef' do: [ :each |
		r := obj hex parse: each asString.
		self assert: r equals: each asString ].
	r := obj hex parse: 'G'.
	self assert: r isPetitFailure
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testHex2Number [

	| obj r |
	obj := self newParser.
	r := obj hex2Number parse: '23'.
	self assert: r equals: '23'.
	r := obj hex2Number parse: 'a9'.
	self assert: r equals: 'a9'.
	r := obj hex2Number parse: 'ef'.
	self assert: r equals: 'ef'.
	r := obj hex2Number parse: '2g'.
	self assert: r isPetitFailure
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testHexLiteral [

	| obj r |
	obj := self newParser.
	r := obj hexLiteral parse: '0x123'.
	self assert: r first equals: '0x'.
	self assert: r second equals: '123'.
	r := obj hexLiteral parse: '0xabcdef'.
	self assert: r second equals: 'abcdef'.
	r := obj hexLiteral parse: '0x12ab'.
	self assert: r second equals: '12ab'.
	r := obj hexLiteral parse: '0x12eg'.
	self assert: r second equals: '12e'.
	r := obj hexLiteral parse: '0xg12e'.
	self assert: r isPetitFailure
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testHexNumber [

	| obj r |
	obj := self newParser.
	r := obj hexNumber parse: '123'.
	self assert: r equals: '123'.
	r := obj hexNumber parse: 'abcdef'.
	self assert: r equals: 'abcdef'.
	r := obj hexNumber parse: '12ab'.
	self assert: r equals: '12ab'.
	r := obj hexNumber parse: '12eg'.
	self assert: r equals: '12e'.
	r := obj hexNumber parse: 'g12e'.
	self assert: r isPetitFailure
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testIn [

	| obj r |
	obj := self newParser.
	r := obj in parse: 'in r12, 0x10'.
	self assert: r first equals: 'in'.
	self assert: r third first equals: 'r'.
	self assert: r third second equals: '12'.
	self assert: r seventh first equals: '0x'.
	self assert: r seventh second equals: '10'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testLd [

	| obj r |
	obj := self newParser.
	r := obj ld parse: 'ld r2, X'.
	self assert: r first equals: 'ld'.
	self assert: r third first equals: 'r'.
	self assert: r third second equals: '2'.
	self assert: r seventh equals: 'X'.
	r := obj ld parse: 'ld r3, X+'.
	self assert: r first equals: 'ld'.
	self assert: r third first equals: 'r'.
	self assert: r third second equals: '3'.
	self assert: r seventh equals: 'X+'.
	r := obj ld parse: 'ld r4, -X'.
	self assert: r first equals: 'ld'.
	self assert: r third first equals: 'r'.
	self assert: r third second equals: '4'.
	self assert: r seventh equals: '-X'.
	r := obj ld parse: 'ld r2, Y'.
	self assert: r first equals: 'ld'.
	self assert: r third first equals: 'r'.
	self assert: r third second equals: '2'.
	self assert: r seventh first equals: $Y.
	r := obj ld parse: 'ld r3, Y+'.
	self assert: r first equals: 'ld'.
	self assert: r third first equals: 'r'.
	self assert: r third second equals: '3'.
	self assert: r seventh equals: 'Y+'.
	r := obj ld parse: 'ld r4, -Y'.
	self assert: r first equals: 'ld'.
	self assert: r third first equals: 'r'.
	self assert: r third second equals: '4'.
	self assert: r seventh equals: '-Y'.
	r := obj ld parse: 'ld r2, Z'.
	self assert: r first equals: 'ld'.
	self assert: r third first equals: 'r'.
	self assert: r third second equals: '2'.
	self assert: r seventh equals: 'Z'.
	r := obj ld parse: 'ld r3, Z+'.
	self assert: r first equals: 'ld'.
	self assert: r third first equals: 'r'.
	self assert: r third second equals: '3'.
	self assert: r seventh equals: 'Z+'.
	r := obj ld parse: 'ld r4, -Z'.
	self assert: r first equals: 'ld'.
	self assert: r third first equals: 'r'.
	self assert: r third second equals: '4'.
	self assert: r seventh equals: '-Z'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testLdd [

	| obj r |
	obj := self newParser.
	r := obj ldd parse: 'ldd r2, Y+60'.
	self assert: r first equals: 'ldd'.
	self assert: r third first equals: 'r'.
	self assert: r third second equals: '2'.
	self assert: r seventh equals: 'Y+'.
	self assert: r eighth equals: '60'.
	r := obj ldd parse: 'ldd r3, Z+61'.
	self assert: r first equals: 'ldd'.
	self assert: r third first equals: 'r'.
	self assert: r third second equals: '3'.
	self assert: r seventh equals: 'Z+'.
	self assert: r eighth equals: '61'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testLpm [

	| obj r |
	obj := self newParser.
	r := obj lpm parse: 'lpm'.
	self assert: r first equals: 'lpm'.
	self assert: r second isNil.
	r := obj lpm parse: 'lpm r10, Z'.
	self assert: r first equals: 'lpm'.
	self assert: r second second first equals: 'r'.
	self assert: r second second second equals: '10'.
	self assert: r second sixth equals: 'Z'.
	r := obj lpm parse: 'lpm r5, Z+'.
	self assert: r first equals: 'lpm'.
	self assert: r second second first equals: 'r'.
	self assert: r second second second equals: '5'.
	self assert: r second sixth equals: 'Z+'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testNoOperandOps [

	| obj r |
	obj := self newParser.
	#( 'break' 'clc' 'clh' 'cli' 'cln' 'cls' 'clt' 'clv' 'clz' 'eicall'
	   'eijmp' 'elpm' 'icall' 'ijmp' 'nop' 'reti' 'ret' 'sec' 'seh' 'sei'
	   'sen' 'ses' 'set' 'sev' 'sez' 'sleep' 'wdr' ) do: [ :each |
		r := obj noOperandOps parse: each.
		self assert: r equals: each ]
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testOneRegisterOps [

	| obj r |
	obj := self newParser.
	#( 'bclr' 'bset' 'com' 'dec' 'inc' 'asr' 'lsr' 'neg' 'pop' 'push'
	   'ror' 'swap' ) do: [ :each |
		r := obj oneRegisterOps parse: each , '  r1'.
		self assert: r first equals: each.
		self assert: r third first equals: 'r'.
		self assert: r third second equals: '1' ]
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testOut [

	| obj r |
	obj := self newParser.
	r := obj out parse: 'out 0x10, r12'.
	self assert: r first equals: 'out'.
	self assert: r third first equals: '0x'.
	self assert: r third second equals: '10'.
	self assert: r seventh first equals: 'r'.
	self assert: r seventh second equals: '12'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testRegister [

	| obj r |
	obj := self newParser.
	r := obj register parse: 'r4'.
	self assert: r first equals: 'r'.
	self assert: r second equals: '4'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testRegisterThenImmediate [

	| obj r |
	obj := self newParser.
	r := obj registerThenImmediate parse: 'r5 , 0x23'.
	self assert: r first first equals: 'r'.
	self assert: r first second equals: '5'.
	self assert: r fifth first equals: '0x'.
	self assert: r fifth second equals: '23'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testRegisterThenImmediateOps [

	| obj r |
	obj := self newParser.
	#( 'adiw' 'andi' 'bld' 'brbc' 'brbs' 'bst' 'cpi' 'ldi' 'lds' 'ori'
	   'sbci' 'sbic' 'sbiw' 'sbrc' 'sbrs' 'subi' ) do: [ :each |
		r := obj registerThenImmediateOps parse: each , ' r12, 0x23'.
		self assert: r first equals: each.
		self assert: r third first first equals: 'r'.
		self assert: r third first second equals: '12'.
		self assert: r third fifth first equals: '0x'.
		self assert: r third fifth second equals: '23' ]
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testRelativeAddress [

	| obj r |
	obj := self newParser.
	r := obj relativeAddress parse: '.+10'.
	self assert: r second equals: '+'.
	self assert: r third equals: '10'.
	r := obj relativeAddress parse: '.-2'.
	self assert: r second equals: '-'.
	self assert: r third equals: '2'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testRelativeOps [

	| obj r |
	obj := self newParser.
	#( 'brcc' 'brcs' 'breq' 'brge' 'brhc' 'brhs' 'brid' 'brie' 'brlt'
	   'brmi' 'brne' 'brpl' 'brtc' 'brts' 'brvc' 'brvs' 'rjmp' 'rcall' )
		do: [ :each |
			r := obj relativeOps parse: each , ' .+10'.
			self assert: r first equals: each.
			self assert: r third first equals: '.'.
			self assert: r third second equals: '+'.
			self assert: r third third equals: '10'.
			r := obj relativeOps parse: each , ' .-6'.
			self assert: r first equals: each.
			self assert: r third first equals: '.'.
			self assert: r third second equals: '-'.
			self assert: r third third equals: '6' ]
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testSbis [

	| obj r |
	obj := self newParser.
	r := obj sbis parse: 'sbis 0x10, 12'.
	self assert: r first equals: 'sbis'.
	self assert: r third first equals: '0x'.
	self assert: r third second equals: '10'.
	self assert: r seventh equals: '12'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testSt [

	| obj r |
	obj := self newParser.
	r := obj st parse: 'st X, r2'.
	self assert: r first equals: 'st'.
	self assert: r third equals: 'X'.
	self assert: r seventh first equals: 'r'.
	self assert: r seventh second equals: '2'.
	r := obj st parse: 'st X+, r3'.
	self assert: r third equals: 'X+'.
	self assert: r seventh first equals: 'r'.
	self assert: r seventh second equals: '3'.
	r := obj st parse: 'st -X, r4'.
	self assert: r third equals: '-X'.
	self assert: r seventh first equals: 'r'.
	self assert: r seventh second equals: '4'.
	r := obj st parse: 'st Y, r2'.
	self assert: r first equals: 'st'.
	self assert: r third equals: 'Y'.
	self assert: r seventh first equals: 'r'.
	self assert: r seventh second equals: '2'.
	r := obj st parse: 'st Y+, r3'.
	self assert: r first equals: 'st'.
	self assert: r third equals: 'Y+'.
	self assert: r seventh first equals: 'r'.
	self assert: r seventh second equals: '3'.
	r := obj st parse: 'st -Y, r4'.
	self assert: r first equals: 'st'.
	self assert: r third equals: '-Y'.
	self assert: r seventh first equals: 'r'.
	self assert: r seventh second equals: '4'.
	r := obj st parse: 'st Z, r2'.
	self assert: r first equals: 'st'.
	self assert: r third equals: 'Z'.
	self assert: r seventh first equals: 'r'.
	self assert: r seventh second equals: '2'.
	r := obj st parse: 'st Z+ , r3'.
	self assert: r first equals: 'st'.
	self assert: r third equals: 'Z+'.
	self assert: r seventh first equals: 'r'.
	self assert: r seventh second equals: '3'.
	r := obj st parse: 'st -Z ,r4'.
	self assert: r first equals: 'st'.
	self assert: r third equals: '-Z'.
	self assert: r seventh first equals: 'r'.
	self assert: r seventh second equals: '4'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testStd [

	| obj r |
	obj := self newParser.
	r := obj std parse: 'std Y+60, r2'.
	self assert: r first equals: 'std'.
	self assert: r third equals: 'Y+'.
	self assert: r fourth equals: '60'.
	self assert: r eighth first equals: 'r'.
	self assert: r eighth second equals: '2'.
	r := obj std parse: 'std Z+61, r3'.
	self assert: r first equals: 'std'.
	self assert: r third equals: 'Z+'.
	self assert: r fourth equals: '61'.
	self assert: r eighth first equals: 'r'.
	self assert: r eighth second equals: '3'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testSts [

	| obj r |
	obj := self newParser.
	r := obj sts parse: 'sts 0x10, r12'.
	self assert: r first equals: 'sts'.
	self assert: r third first equals: '0x'.
	self assert: r third second equals: '10'.
	self assert: r seventh first equals: 'r'.
	self assert: r seventh second equals: '12'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testTwoRegisters [

	| obj r |
	obj := self newParser.
	r := obj twoRegisters parse: 'r2, r3'.
	self assert: r first first equals: 'r'.
	self assert: r first second equals: '2'.
	self assert: r fifth first equals: 'r'.
	self assert: r fifth second equals: '3'
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testTwoRegistersOps [

	| obj r |
	obj := self newParser.
	#( 'adc' 'add' 'and' 'cpc' 'cpse' 'cp' 'eor' 'fmulsu' 'fmuls' 'fmul'
	   'movw' 'mov' 'mulsu' 'muls' 'mul' 'or' 'sbc' 'sub' ) do: [ :each |
		r := obj twoRegistersOps parse: each , '  r1, r2'.
		self assert: r first equals: each.
		self assert: r third first first equals: 'r'.
		self assert: r third first second equals: '1'.
		self assert: r third fifth first equals: 'r'.
		self assert: r third fifth second equals: '2' ]
]

{ #category : 'tests' }
AvrAsmGrammarTest >> testWord [

	| obj r |
	obj := self newParser.
	r := obj word parse: '.word 0x1234'.
	self assert: r first equals: '.word'.
	self assert: r third equals: '0x'.
	self assert: r fourth equals: '1234'
]
