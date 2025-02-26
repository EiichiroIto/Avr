Class {
	#name : 'AvrAsmParser',
	#superclass : 'AvrAsmGrammar',
	#category : 'Avr-Parser',
	#package : 'Avr',
	#tag : 'Parser'
}

{ #category : 'instructions-parsers' }
AvrAsmParser >> absoluteOps [

	^ super absoluteOps ==> [ :arr |
	  (self builder immediateOpNamed: arr first)
		  ifNotNil: [ :obj | obj immediate: arr third // 2 ]
		  ifNil: [ arr ] ]
]

{ #category : 'parsers' }
AvrAsmParser >> address [

	^ super address ==> [ :str | Integer readFrom: str second base: 16 ]
]

{ #category : 'parsers' }
AvrAsmParser >> binaryCodes [

	^ super binaryCodes
	  ==> [ :arr |
	  (ByteArray with: arr first) , (arr second collect: #second) ]
]

{ #category : 'instance creation' }
AvrAsmParser >> builder [

	^ AvrInstructionBuilder new
]

{ #category : 'parsers' }
AvrAsmParser >> comment [

	^ super comment
	  ==> [ :arr |
	  arr ifNil: [ nil ] ifNotNil: [ arr third ] ]
]

{ #category : 'parsers' }
AvrAsmParser >> decimalNumber [

	^ super decimalNumber ==> [ :str | str asInteger ]
]

{ #category : 'parsers' }
AvrAsmParser >> hex2Number [

	^ super hex2Number
	  ==> [ :str | Integer readFrom: str base: 16 ]
]

{ #category : 'parsers' }
AvrAsmParser >> hexLiteral [

	^ super hexLiteral
	  ==> [ :arr | Integer readFrom: arr second base: 16 ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> in [

	^ super in ==> [ :arr |
	  AvrOpIN new
		  register: arr third;
		  immediate: arr seventh ]
]

{ #category : 'parsers' }
AvrAsmParser >> instructionLine [

	^ super instructionLine ==> [ :arr |
	  Array
		  with: arr first
		  with: arr second
		  with: arr fourth
		  with: (arr fifth ifNotNil: [ :arr2 | arr2 second ]) ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> ld [

	^ super ld ==> [ :arr |
	  (self builder ldIndirect: arr seventh)
		  ifNotNil: [ :obj | obj register: arr third ]
		  ifNil: [ arr ] ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> ldd [

	^ super ldd ==> [ :arr |
	  (self builder lddIndex: arr seventh)
		  ifNotNil: [ :obj |
			  obj
				  immediate: arr eighth;
				  register: arr third ]
		  ifNil: [ arr ] ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> lpm [

	^ super lpm ==> [ :arr |
	  (self builder lpmIndirect:
		   (arr second ifNil: [ nil ] ifNotNil: [ :arr2 | arr2 sixth ]))
		  ifNotNil: [ :obj |
			  arr second
				  ifNil: [ obj ]
				  ifNotNil: [ :arr2 | obj register: arr2 second ] ]
		  ifNil: [ arr ] ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> noOperandOps [

	^ super noOperandOps
	  ==> [ :str | (self builder noOperandOpNamed: str) ifNil: [ str ] ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> oneRegisterOps [

	^ super oneRegisterOps ==> [ :arr |
	  (self builder oneRegisterOpNamed: arr first)
		  ifNotNil: [ :obj | obj register: arr third ]
		  ifNil: [ arr ] ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> out [

	^ super out ==> [ :arr |
	  AvrOpOUT new
		  register: arr seventh;
		  immediate: arr third ]
]

{ #category : 'operand-parsers' }
AvrAsmParser >> register [

	^ super register ==> [ :arr | arr second ]
]

{ #category : 'operand-parsers' }
AvrAsmParser >> registerThenImmediate [

	^ super registerThenImmediate
	  ==> [ :arr | Array with: arr first with: arr fifth ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> registerThenImmediateOps [

	^ super registerThenImmediateOps ==> [ :arr |
	  (self builder registerAndImmediateOpNamed: arr first)
		  ifNotNil: [ :obj |
			  obj
				  register: arr third first;
				  immediate: arr third second ]
		  ifNil: [ arr ] ]
]

{ #category : 'operand-parsers' }
AvrAsmParser >> relativeAddress [

	^ super relativeAddress ==> [ :arr |
	  | value |
	  value := arr third asInteger // 2.
	  arr second = '-' ifTrue: [ value := value negated ].
	  value ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> relativeOps [

	^ super relativeOps ==> [ :arr |
	  (self builder immediateOpNamed: arr first) ifNotNil: [ :obj |
		  obj immediate: arr third ] ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> sbis [

	^ super sbis ==> [ :arr |
	  (self builder registerAndImmediateOpNamed: arr first)
		  ifNotNil: [ :obj |
			  obj
				  register: arr third;
				  immediate: arr seventh ]
		  ifNil: [ arr ] ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> st [

	^ super st ==> [ :arr |
	  (self builder stIndirect: arr third)
		  ifNotNil: [ :obj | obj register: arr seventh ]
		  ifNil: [ arr ] ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> std [

	^ super std ==> [ :arr |
	  (self builder stdIndex: arr third)
		  ifNotNil: [ :obj |
			  obj
				  immediate: arr fourth;
				  register: arr eighth ]
		  ifNil: [ arr ] ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> sts [

	^ super sts ==> [ :arr |
	  (self builder registerAndImmediateOpNamed: arr first)
		  ifNotNil: [ :obj |
			  obj
				  immediate: arr third;
				  register: arr seventh ]
		  ifNil: [ arr ] ]
]

{ #category : 'operand-parsers' }
AvrAsmParser >> twoRegisters [

	^ super twoRegisters
	  ==> [ :arr | Array with: arr first with: arr fifth ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> twoRegistersOps [

	^ super twoRegistersOps ==> [ :arr |
	  (self builder twoRegistersOpNamed: arr first)
		  ifNotNil: [ :obj |
			  obj
				  dest: arr third first;
				  source: arr third second ]
		  ifNil: [ arr ] ]
]

{ #category : 'instructions-parsers' }
AvrAsmParser >> word [

	^ super word ==> [ :arr |
	  AvrSemiWord new immediate: (Integer readFrom: arr fourth base: 16) ]
]
