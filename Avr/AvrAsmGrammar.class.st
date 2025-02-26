Class {
	#name : 'AvrAsmGrammar',
	#superclass : 'PPCompositeParser',
	#instVars : [
		'digit',
		'hex',
		'decimalNumber',
		'hexNumber',
		'hexLiteral',
		'comment',
		'address',
		'binaryCodes',
		'instruction',
		'instructionLine',
		'hex2Number',
		'twoRegisters',
		'register',
		'out',
		'relativeAddress',
		'st',
		'in',
		'noOperandOps',
		'absoluteOps',
		'oneRegisterOps',
		'twoRegistersOps',
		'relativeOps',
		'registerThenImmediateOps',
		'sbis',
		'word',
		'ld',
		'lpm',
		'registerThenImmediate',
		'sts',
		'std',
		'ldd'
	],
	#category : 'Avr-Parser',
	#package : 'Avr',
	#tag : 'Parser'
}

{ #category : 'initialization' }
AvrAsmGrammar class >> loadPetitParser [
	"self loadPetitParser"

	Metacello new
		baseline: 'PetitParser';
		repository: 'github://moosetechnology/PetitParser:v3.x.x/src';
		load: { #Examples. #Tests }
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> absoluteOps [

	^ 'call' asParser / 'jmp' asParser , #blank asParser star
	  , (hexLiteral / decimalNumber)
]

{ #category : 'parsers' }
AvrAsmGrammar >> address [

	^ #blank asParser star , hexNumber , ':' asParser
	  , #blank asParser
]

{ #category : 'parsers' }
AvrAsmGrammar >> binaryCodes [

	^ hex2Number , (#blank asParser , hex2Number) star
]

{ #category : 'parsers' }
AvrAsmGrammar >> comment [

	^ ';' asParser , #blank asParser star
	  , #any asParser star flatten trim
]

{ #category : 'parsers' }
AvrAsmGrammar >> decimalNumber [

	^ (digit , digit star) flatten trim
]

{ #category : 'parsers' }
AvrAsmGrammar >> digit [

	^ '0' asParser / '1' asParser / '2' asParser / '3' asParser
	  / '4' asParser / '5' asParser / '6' asParser / '7' asParser
	  / '8' asParser / '9' asParser
]

{ #category : 'parsers' }
AvrAsmGrammar >> hex [

	^ 'A' asParser | 'a' asParser | 'B' asParser | 'b' asParser
	  | 'C' asParser | 'c' asParser | 'D' asParser | 'd' asParser
	  | 'E' asParser | 'e' asParser | 'F' asParser | 'f' asParser | digit
]

{ #category : 'parsers' }
AvrAsmGrammar >> hex2Number [

	^ (hex , hex) flatten
]

{ #category : 'parsers' }
AvrAsmGrammar >> hexLiteral [

	^ '0x' asParser , hexNumber
]

{ #category : 'parsers' }
AvrAsmGrammar >> hexNumber [

	^ (hex , hex star) flatten trim
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> in [

	^ 'in' asParser , #blank asParser star , register
	  , #blank asParser star , ',' asParser , #blank asParser star
	  , hexLiteral
]

{ #category : 'parsers' }
AvrAsmGrammar >> instruction [

	^ registerThenImmediateOps / twoRegistersOps / relativeOps
	  / absoluteOps / oneRegisterOps / sts / noOperandOps / in / out
	  / ldd / ld / std / st / sbis / lpm / word
]

{ #category : 'parsers' }
AvrAsmGrammar >> instructionLine [

	^ address , binaryCodes , #blank asParser star , instruction
	  , (#blank asParser star , comment) optional
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> ld [

	^ 'ld' asParser , #blank asParser star , register
	  , #blank asParser star , ',' asParser , #blank asParser star
	  , ('-X' asParser / 'X+' asParser / 'X' asParser / '-Y' asParser
		   / 'Y+' asParser / 'Y' asParser / '-Z' asParser / 'Z+' asParser
		   / 'Z' asParser)
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> ldd [

	^ 'ldd' asParser , #blank asParser star , register
	  , #blank asParser star , ',' asParser , #blank asParser star
	  , ('Y+' asParser / 'Z+' asParser) , decimalNumber
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> lpm [

	^ 'lpm' asParser
	  ,
		  (#blank asParser star , register , #blank asParser star
		   , ',' asParser , #blank asParser star
		   , ('Z+' asParser / 'Z' asParser)) optional
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> noOperandOps [

	^ 'break' asParser / 'clc' asParser / 'clh' asParser / 'cli' asParser
	  / 'cln' asParser / 'cls' asParser / 'clt' asParser / 'clv' asParser
	  / 'clz' asParser / 'eicall' asParser / 'eijmp' asParser
	  / 'elpm' asParser / 'icall' asParser / 'ijmp' asParser
	  / 'nop' asParser / 'reti' asParser / 'ret' asParser
	  / 'sec' asParser / 'seh' asParser / 'sei' asParser / 'sen' asParser
	  / 'ses' asParser / 'set' asParser / 'sev' asParser / 'sez' asParser
	  / 'sleep' asParser / 'wdr' asParser
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> oneRegisterOps [

	^ 'bclr' asParser / 'bset' asParser / 'com' asParser / 'dec' asParser
	  / 'inc' asParser / 'asr' asParser / 'lsr' asParser / 'neg' asParser
	  / 'pop' asParser / 'push' asParser / 'ror' asParser
	  / 'swap' asParser , #blank asParser star , register
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> out [

	^ 'out' asParser , #blank asParser star , hexLiteral
	  , #blank asParser star , ',' asParser , #blank asParser star
	  , register
]

{ #category : 'operand-parsers' }
AvrAsmGrammar >> register [

	^ 'R' asParser / 'r' asParser , decimalNumber
]

{ #category : 'operand-parsers' }
AvrAsmGrammar >> registerThenImmediate [

	^ register , #blank asParser star , ',' asParser
	  , #blank asParser star , hexLiteral
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> registerThenImmediateOps [

	^ 'adiw' asParser / 'andi' asParser / 'bld' asParser
	  / 'brbc' asParser / 'brbs' asParser / 'bst' asParser
	  / 'cpi' asParser / 'ldi' asParser / 'lds' asParser / 'ori' asParser
	  / 'sbci' asParser / 'sbic' asParser / 'sbiw' asParser
	  / 'sbrc' asParser / 'sbrs' asParser / 'subi' asParser
	  , #blank asParser star , registerThenImmediate
]

{ #category : 'operand-parsers' }
AvrAsmGrammar >> relativeAddress [

	^ '.' asParser , ('+' asParser / '-' asParser) , decimalNumber
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> relativeOps [

	^ 'brcc' asParser / 'brcs' asParser / 'breq' asParser
	  / 'brge' asParser / 'brhc' asParser / 'brhs' asParser
	  / 'brid' asParser / 'brie' asParser / 'brlt' asParser
	  / 'brmi' asParser / 'brne' asParser / 'brpl' asParser
	  / 'brtc' asParser / 'brts' asParser / 'brvc' asParser
	  / 'brvs' asParser / 'rjmp' asParser / 'rcall' asParser
	  , #blank asParser star , relativeAddress
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> sbis [

	^ 'sbis' asParser , #blank asParser star , hexLiteral
	  , #blank asParser star , ',' asParser , #blank asParser star
	  , decimalNumber
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> st [

	^ 'st' asParser , #blank asParser star
	  , ('-X' asParser / 'X+' asParser / 'X' asParser / '-Y' asParser
		   / 'Y+' asParser / 'Y' asParser / '-Z' asParser / 'Z+' asParser
		   / 'Z' asParser) , #blank asParser star , ',' asParser
	  , #blank asParser star , register
]

{ #category : 'accessing' }
AvrAsmGrammar >> start [

	^ instructionLine end
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> std [

	^ 'std' asParser , #blank asParser star
	  , ('Y+' asParser / 'Z+' asParser) , decimalNumber
	  , #blank asParser star , ',' asParser , #blank asParser star
	  , register
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> sts [

	^ 'sts' asParser , #blank asParser star , hexLiteral
	  , #blank asParser star , ',' asParser , #blank asParser star
	  , register
]

{ #category : 'operand-parsers' }
AvrAsmGrammar >> twoRegisters [

	^ register , #blank asParser star , ',' asParser
	  , #blank asParser star , register
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> twoRegistersOps [

	^ 'adc' asParser / 'add' asParser / 'and' asParser / 'cpc' asParser
	  / 'cpse' asParser / 'cp' asParser / 'eor' asParser
	  / 'fmulsu' asParser / 'fmuls' asParser / 'fmul' asParser
	  / 'movw' asParser / 'mov' asParser / 'mulsu' asParser
	  / 'muls' asParser / 'mul' asParser / 'or' asParser / 'sbc' asParser
	  / 'sub' asParser , #blank asParser star , twoRegisters
]

{ #category : 'instructions-parsers' }
AvrAsmGrammar >> word [

	^ '.word' asParser , #blank asParser star , '0x' asParser
	  , (hex , hex star) flatten
]
