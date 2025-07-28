Class {
	#name : 'AvrAssembler',
	#superclass : 'Object',
	#instVars : [
		'program',
		'subroutines',
		'literals',
		'registerFrames'
	],
	#category : 'Avr-Assembly',
	#package : 'Avr',
	#tag : 'Assembly'
}

{ #category : 'two registers' }
AvrAssembler >> adcDest: destRegister source: sourceRegister [

	registerFrames checkReadRegister: sourceRegister.
	registerFrames checkWriteRegister: destRegister.
	self add: (AvrOpADC new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'private' }
AvrAssembler >> add: aCode [

	program add: aCode
]

{ #category : 'two registers' }
AvrAssembler >> addDest: destRegister source: sourceRegister [

	registerFrames checkReadRegister: sourceRegister.
	registerFrames checkWriteRegister: destRegister.
	self add: (AvrOpADD new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrAssembler >> adiwR: register data: immediate [

	registerFrames checkReadRegister: register.
	registerFrames checkReadRegister: register + 1.
	registerFrames checkWriteRegister: register.
	registerFrames checkWriteRegister: register + 1.
	self add: (AvrOpADIW new
			 register: register;
			 immediate: immediate)
]

{ #category : 'two registers' }
AvrAssembler >> andDest: destRegister source: sourceRegister [

	registerFrames checkReadRegister: sourceRegister.
	destRegister = sourceRegister ifFalse: [
		registerFrames checkWriteRegister: destRegister ].
	self add: (AvrOpAND new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrAssembler >> andiR: register data: immediate [

	registerFrames checkReadRegister: register.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpANDI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'api' }
AvrAssembler >> assembledCodesFor: anObject [

	self resolveUndefinedSubroutinesFor: anObject.
	self resolveLiterals.
	^ program validatedCodes
]

{ #category : 'one register' }
AvrAssembler >> bclr: register [

	registerFrames checkWriteRegister: register.
	self add: (AvrOpBCLR new register: register)
]

{ #category : 'immediate' }
AvrAssembler >> brcc: anInteger [

	self add: (AvrOpBRCC new immediate: anInteger)
]

{ #category : 'immediate' }
AvrAssembler >> brcs: anInteger [

	self add: (AvrOpBRCS new immediate: anInteger)
]

{ #category : 'immediate' }
AvrAssembler >> breq: anInteger [

	self add: (AvrOpBREQ new immediate: anInteger)
]

{ #category : 'immediate' }
AvrAssembler >> brge: anInteger [

	self add: (AvrOpBRGE new immediate: anInteger)
]

{ #category : 'immediate' }
AvrAssembler >> brlt: anInteger [

	self add: (AvrOpBRLT new immediate: anInteger)
]

{ #category : 'immediate' }
AvrAssembler >> brne: anInteger [

	self add: (AvrOpBRNE new immediate: anInteger)
]

{ #category : 'one register' }
AvrAssembler >> bset: register [

	registerFrames checkWriteRegister: register.
	self add: (AvrOpBSET new register: register)
]

{ #category : 'immediate' }
AvrAssembler >> call: anInteger [

	self add: (AvrOpCALL new immediate: anInteger)
]

{ #category : 'api' }
AvrAssembler >> callSubroutine: aSymbol [

	self useSubroutine: aSymbol.
	self rcall: aSymbol
]

{ #category : 'register-immediate' }
AvrAssembler >> cbi: io bit: bit [

	self add: (AvrOpCBI new
			 io: io;
			 bit: bit)
]

{ #category : 'no register' }
AvrAssembler >> cli [

	self add: AvrOpCLI new
]

{ #category : 'one register' }
AvrAssembler >> com: register [

	registerFrames checkReadRegister: register.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpCOM new register: register)
]

{ #category : 'two registers' }
AvrAssembler >> cpDest: destRegister source: sourceRegister [

	registerFrames checkReadRegister: sourceRegister.
	registerFrames checkReadRegister: destRegister.
	self add: (AvrOpCP new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'two registers' }
AvrAssembler >> cpcDest: destRegister source: sourceRegister [

	registerFrames checkReadRegister: sourceRegister.
	registerFrames checkReadRegister: destRegister.
	self add: (AvrOpCPC new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrAssembler >> cpiR: register data: immediate [

	registerFrames checkReadRegister: register.
	self add: (AvrOpCPI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'two registers' }
AvrAssembler >> cpseDest: destRegister source: sourceRegister [

	registerFrames checkReadRegister: sourceRegister.
	registerFrames checkReadRegister: destRegister.
	self add: (AvrOpCPSE new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'one register' }
AvrAssembler >> dec: register [

	registerFrames checkReadRegister: register.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpDEC new register: register)
]

{ #category : 'two registers' }
AvrAssembler >> eorDest: destRegister source: sourceRegister [

	destRegister = sourceRegister ifFalse: [
		registerFrames checkReadRegister: sourceRegister ].
	registerFrames checkWriteRegister: destRegister.
	self add: (AvrOpEOR new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'no register' }
AvrAssembler >> icall [

	self add: AvrOpICALL new
]

{ #category : 'no register' }
AvrAssembler >> ijmp [

	self add: AvrOpIJMP new
]

{ #category : 'register-immediate' }
AvrAssembler >> inR: register address: io [

	registerFrames checkWriteRegister: register.
	self add: (AvrOpIN new
			 immediate: io;
			 register: register)
]

{ #category : 'one register' }
AvrAssembler >> inc: register [

	registerFrames checkReadRegister: register.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpINC new register: register)
]

{ #category : 'initialization' }
AvrAssembler >> initialize [

	super initialize.
	subroutines := Set new.
	literals := Dictionary new.
	registerFrames := AvrRegisterFrames new
]

{ #category : 'immediate' }
AvrAssembler >> jmp: anInteger [

	self add: (AvrOpJMP new immediate: anInteger)
]

{ #category : 'api' }
AvrAssembler >> label: aString [

	program label: aString
]

{ #category : 'api' }
AvrAssembler >> labelNameAt: aSymbol [

	^ program labelNameAt: aSymbol
]

{ #category : 'accessing' }
AvrAssembler >> labeler [

	^ program labeler
]

{ #category : 'register-immediate' }
AvrAssembler >> lddR: register yOffset: immediate [

	registerFrames checkReadRegister: 28.
	registerFrames checkReadRegister: 29.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpLDDY new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> lddR: register zOffset: immediate [

	registerFrames checkReadRegister: 30.
	registerFrames checkReadRegister: 31.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpLDDZ new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> ldiR: register data: immediate [

	registerFrames checkWriteRegister: register.
	self add: (AvrOpLDI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> ldsR: register address: immediate [

	registerFrames checkWriteRegister: register.
	self add: (AvrOpLDS new
			 register: register;
			 immediate: immediate)
]

{ #category : 'one register' }
AvrAssembler >> ldx: register [

	registerFrames checkReadRegister: 26.
	registerFrames checkReadRegister: 27.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpLDX1 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> ldxDec: register [

	registerFrames checkReadRegister: 26.
	registerFrames checkReadRegister: 27.
	registerFrames checkWriteRegister: 26.
	registerFrames checkWriteRegister: 27.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpLDX3 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> ldxInc: register [

	registerFrames checkReadRegister: 26.
	registerFrames checkReadRegister: 27.
	registerFrames checkWriteRegister: 26.
	registerFrames checkWriteRegister: 27.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpLDX2 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> ldy: register [

	registerFrames checkReadRegister: 28.
	registerFrames checkReadRegister: 29.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpLDY1 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> ldyDec: register [

	registerFrames checkReadRegister: 28.
	registerFrames checkReadRegister: 29.
	registerFrames checkWriteRegister: 28.
	registerFrames checkWriteRegister: 29.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpLDY3 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> ldyInc: register [

	registerFrames checkReadRegister: 28.
	registerFrames checkReadRegister: 29.
	registerFrames checkWriteRegister: 28.
	registerFrames checkWriteRegister: 29.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpLDY2 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> ldz: register [

	registerFrames checkReadRegister: 30.
	registerFrames checkReadRegister: 31.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpLDZ1 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> ldzDec: register [

	registerFrames checkReadRegister: 30.
	registerFrames checkReadRegister: 31.
	registerFrames checkWriteRegister: 30.
	registerFrames checkWriteRegister: 31.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpLDZ3 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> ldzInc: register [

	registerFrames checkReadRegister: 30.
	registerFrames checkReadRegister: 31.
	registerFrames checkWriteRegister: 30.
	registerFrames checkWriteRegister: 31.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpLDZ2 new register: register)
]

{ #category : 'accessing' }
AvrAssembler >> literals [

	^ literals
]

{ #category : 'accessing' }
AvrAssembler >> literals: anObject [

	literals := anObject
]

{ #category : 'one register' }
AvrAssembler >> lpmz: register [

	registerFrames checkReadRegister: 30.
	registerFrames checkReadRegister: 31.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpLPM2 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> lpmzInc: register [

	registerFrames checkReadRegister: 30.
	registerFrames checkReadRegister: 31.
	registerFrames checkWriteRegister: 30.
	registerFrames checkWriteRegister: 31.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpLPM3 new register: register)
]

{ #category : 'two registers' }
AvrAssembler >> movDest: destRegister source: sourceRegister [

	registerFrames checkReadRegister: sourceRegister.
	registerFrames checkWriteRegister: destRegister.
	self add: (AvrOpMOV new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'two registers' }
AvrAssembler >> movwDest: destRegister source: sourceRegister [

	registerFrames checkReadRegister: sourceRegister.
	registerFrames checkReadRegister: sourceRegister + 1.
	registerFrames checkWriteRegister: destRegister.
	registerFrames checkWriteRegister: destRegister + 1.
	self add: (AvrOpMOVW new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'two registers' }
AvrAssembler >> mulsDest: destRegister source: sourceRegister [

	registerFrames checkReadRegister: sourceRegister.
	registerFrames checkReadRegister: destRegister.
	registerFrames checkWriteRegister: 0.
	registerFrames checkWriteRegister: 1.
	self add: (AvrOpMULS new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'two registers' }
AvrAssembler >> mulsuDest: destRegister source: sourceRegister [

	registerFrames checkReadRegister: sourceRegister.
	registerFrames checkReadRegister: destRegister.
	registerFrames checkWriteRegister: 0.
	registerFrames checkWriteRegister: 1.
	self add: (AvrOpMULSU new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'no register' }
AvrAssembler >> nop [

	self add: AvrOpNOP new
]

{ #category : 'two registers' }
AvrAssembler >> orDest: destRegister source: sourceRegister [

	registerFrames checkReadRegister: sourceRegister.
	registerFrames checkWriteRegister: destRegister.
	self add: (AvrOpOR new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrAssembler >> oriR: register data: immediate [

	registerFrames checkReadRegister: register.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpORI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> out: io r: register [

	registerFrames checkReadRegister: register.
	self add: (AvrOpOUT new
			 immediate: io;
			 register: register)
]

{ #category : 'one register' }
AvrAssembler >> pop: register [

	registerFrames checkWriteRegister: register.
	self add: (AvrOpPOP new register: register)
]

{ #category : 'accessing' }
AvrAssembler >> program [

	^ program
]

{ #category : 'accessing' }
AvrAssembler >> program: anObject [

	program := anObject
]

{ #category : 'one register' }
AvrAssembler >> push: register [

	registerFrames pushRegister: register.
	self add: (AvrOpPUSH new register: register)
]

{ #category : 'macros' }
AvrAssembler >> pushAndUseRegisters: aCollection during: aBlock [

	self pushRegisters: aCollection during: [
		registerFrames allocateRegisters: aCollection.
		aBlock numArgs = 0
			ifTrue: [ aBlock value ]
			ifFalse: [ aBlock valueWithArguments: aCollection ].
		registerFrames freeRegisters: aCollection ]
]

{ #category : 'macros' }
AvrAssembler >> pushRegisters: aCollection during: aBlock [

	| reuseRegisters tmp |
	aCollection size = aCollection asSet size ifFalse: [
		self error: 'registers duplicated' ].
	tmp := registerFrames unusedRegisters copy.
	reuseRegisters := aCollection \ tmp.
	aCollection do: [ :each | self push: each ].
	registerFrames freeRegisters: reuseRegisters.
	aBlock value.
	registerFrames allocateRegisters: reuseRegisters.
	((registerFrames unusedRegisters includesAll: tmp) and: [
		 tmp includesAll: registerFrames unusedRegisters ]) ifFalse: [
		self error ].
	aCollection reverseDo: [ :each | self pop: each ]
]

{ #category : 'immediate' }
AvrAssembler >> rcall: relative [

	self add: (AvrOpRCALL new immediate: relative)
]

{ #category : 'accessing' }
AvrAssembler >> registerFrames [

	^ registerFrames
]

{ #category : 'accessing' }
AvrAssembler >> registerFrames: anObject [

	registerFrames := anObject
]

{ #category : 'private' }
AvrAssembler >> resolveLiterals [

	literals keysAndValuesDo: [ :key :value |
		(program labeler hasAddressOfName: key) ifFalse: [
			self label: key.
			value addLiteralCodesFor: self ] ]
]

{ #category : 'private' }
AvrAssembler >> resolveUndefinedSubroutinesFor: anObject [

	| flag |
	[
	flag := false.
	subroutines do: [ :each |
		(program labeler hasAddressOfName: each) ifFalse: [
			(anObject class canPerform: each asSymbol)
				ifTrue: [
					anObject subroutineNamed: each asSymbol.
					flag := true ]
				ifFalse: [ self error: each , ' is not defined' ] ] ] ]
		doWhileTrue: [ flag ]
]

{ #category : 'no register' }
AvrAssembler >> ret [

	self add: AvrOpRET new
]

{ #category : 'no register' }
AvrAssembler >> reti [

	self add: AvrOpRETI new
]

{ #category : 'immediate' }
AvrAssembler >> rjmp: relative [

	self add: (AvrOpRJMP new immediate: relative)
]

{ #category : 'one register' }
AvrAssembler >> ror: register [

	registerFrames checkReadRegister: register.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpROR new register: register)
]

{ #category : 'two registers' }
AvrAssembler >> sbcDest: destRegister source: sourceRegister [

	registerFrames checkReadRegister: sourceRegister.
	registerFrames checkWriteRegister: destRegister.
	self add: (AvrOpSBC new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrAssembler >> sbciR: register data: immediate [

	registerFrames checkReadRegister: register.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpSBCI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> sbi: io bit: bit [

	self add: (AvrOpSBI new
			 io: io;
			 bit: bit)
]

{ #category : 'register-immediate' }
AvrAssembler >> sbic: register bit: immediate [

	self add: (AvrOpSBIC new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> sbis: register bit: immediate [

	self add: (AvrOpSBIS new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> sbiwR: register data: immediate [

	registerFrames checkReadRegister: register.
	registerFrames checkReadRegister: register + 1.
	registerFrames checkWriteRegister: register.
	registerFrames checkWriteRegister: register + 1.
	self add: (AvrOpSBIW new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> sbrc: register bit: immediate [

	registerFrames checkReadRegister: register.
	self add: (AvrOpSBRC new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> sbrs: register bit: immediate [

	self add: (AvrOpSBRS new
			 register: register;
			 immediate: immediate)
]

{ #category : 'no register' }
AvrAssembler >> sei [

	self add: AvrOpSEI new
]

{ #category : 'api' }
AvrAssembler >> setupRegisterFrames [

	registerFrames reset
]

{ #category : 'register-immediate' }
AvrAssembler >> stdYOffset: immediate r: register [

	registerFrames checkReadRegister: 28.
	registerFrames checkReadRegister: 29.
	registerFrames checkReadRegister: register.
	self add: (AvrOpSTDY new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> stdZOffset: immediate r: register [

	registerFrames checkReadRegister: 30.
	registerFrames checkReadRegister: 31.
	registerFrames checkReadRegister: register.
	self add: (AvrOpSTDZ new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> stsAddress: immediate r: register [

	registerFrames checkReadRegister: register.
	self add: (AvrOpSTS new
			 register: register;
			 immediate: immediate)
]

{ #category : 'one register' }
AvrAssembler >> stx: register [

	registerFrames checkReadRegister: 26.
	registerFrames checkReadRegister: 27.
	registerFrames checkReadRegister: register.
	self add: (AvrOpSTX1 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> stxDec: register [

	registerFrames checkReadRegister: 26.
	registerFrames checkReadRegister: 27.
	registerFrames checkWriteRegister: 26.
	registerFrames checkWriteRegister: 27.
	registerFrames checkReadRegister: register.
	self add: (AvrOpSTX3 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> stxInc: register [

	registerFrames checkReadRegister: 26.
	registerFrames checkReadRegister: 27.
	registerFrames checkWriteRegister: 26.
	registerFrames checkWriteRegister: 27.
	registerFrames checkReadRegister: register.
	self add: (AvrOpSTX2 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> sty: register [

	registerFrames checkReadRegister: 28.
	registerFrames checkReadRegister: 29.
	registerFrames checkReadRegister: register.
	self add: (AvrOpSTY1 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> styDec: register [

	registerFrames checkReadRegister: 28.
	registerFrames checkReadRegister: 29.
	registerFrames checkWriteRegister: 28.
	registerFrames checkWriteRegister: 29.
	registerFrames checkReadRegister: register.
	self add: (AvrOpSTY3 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> styInc: register [

	registerFrames checkReadRegister: 28.
	registerFrames checkReadRegister: 29.
	registerFrames checkWriteRegister: 28.
	registerFrames checkWriteRegister: 29.
	registerFrames checkReadRegister: register.
	self add: (AvrOpSTY2 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> stz: register [

	registerFrames checkReadRegister: 30.
	registerFrames checkReadRegister: 31.
	registerFrames checkReadRegister: register.
	self add: (AvrOpSTZ1 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> stzDec: register [

	registerFrames checkReadRegister: 30.
	registerFrames checkReadRegister: 31.
	registerFrames checkWriteRegister: 30.
	registerFrames checkWriteRegister: 31.
	registerFrames checkReadRegister: register.
	self add: (AvrOpSTZ3 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> stzInc: register [

	registerFrames checkReadRegister: 30.
	registerFrames checkReadRegister: 31.
	registerFrames checkWriteRegister: 30.
	registerFrames checkWriteRegister: 31.
	registerFrames checkReadRegister: register.
	self add: (AvrOpSTZ2 new register: register)
]

{ #category : 'two registers' }
AvrAssembler >> subDest: destRegister source: sourceRegister [

	destRegister = sourceRegister ifFalse: [
		registerFrames checkReadRegister: sourceRegister ].
	registerFrames checkWriteRegister: destRegister.
	self add: (AvrOpSUB new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrAssembler >> subiR: register data: immediate [

	registerFrames checkReadRegister: register.
	registerFrames checkWriteRegister: register.
	self add: (AvrOpSUBI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'api' }
AvrAssembler >> subroutineAddresses [

	^ (subroutines collect: [ :each |
		   Array with: each with: (self labelNameAt: each) ])
		  asSortedCollection: [ :a :b | a second < b second ]
]

{ #category : 'accessing' }
AvrAssembler >> subroutines [

	^ subroutines
]

{ #category : 'accessing' }
AvrAssembler >> subroutines: anObject [

	subroutines := anObject
]

{ #category : 'one register' }
AvrAssembler >> swap: register [

	registerFrames checkWriteRegister: register.
	self add: (AvrOpSWAP new register: register)
]

{ #category : 'api' }
AvrAssembler >> use: anInteger registersIn: aBlock [

	| registers |
	registers := registerFrames allocateRegistersCount: anInteger.
	aBlock value: registers.
	registerFrames freeRegisters: registers
]

{ #category : 'api' }
AvrAssembler >> useInputs: aCollection outputs: aCollection2 in: aBlock [

	| registers |
	registers := (aCollection ifNil: [ #(  ) ]) copy asOrderedCollection.
	registers addAll: ((aCollection2 ifNil: [ #(  ) ]) reject: [ :each |
			 registers includes: each ]).
	(registerFrames checkAnyRegistersAvailable: registers) ifTrue: [ self error ].
	registerFrames useInputs: aCollection outputs: aCollection2.
	aBlock numArgs = 0
		ifTrue: [ aBlock value ]
		ifFalse: [ aBlock valueWithArguments: registers ].
	registerFrames releaseFrame
]

{ #category : 'api' }
AvrAssembler >> useLiteral: anObject named: aSymbol [

	literals at: aSymbol put: anObject.
	^ AvrLiteral label: 'literal' address: aSymbol
]

{ #category : 'api' }
AvrAssembler >> useRegister: anInteger in: aBlock [

	registerFrames allocateRegisters: { anInteger }.
	aBlock cull: anInteger.
	registerFrames freeRegisters: { anInteger }
]

{ #category : 'api' }
AvrAssembler >> useRegisterIn: aBlock [

	| register |
	register := (registerFrames allocateRegistersCount: 1) first.
	aBlock value: register.
	registerFrames freeRegisters: { register }
]

{ #category : 'api' }
AvrAssembler >> useRegisters: aCollection in: aBlock [

	registerFrames allocateRegisters: aCollection.
	aBlock numArgs = 0
		ifTrue: [ aBlock value ]
		ifFalse: [ aBlock valueWithArguments: aCollection ].
	registerFrames freeRegisters: aCollection
]

{ #category : 'api' }
AvrAssembler >> useSubroutine: aSymbol [

	subroutines add: aSymbol
]

{ #category : 'immediate' }
AvrAssembler >> word: anInteger [

	self add: (AvrSemiWord new immediate: anInteger)
]
