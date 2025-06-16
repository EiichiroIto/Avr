Class {
	#name : 'AvrAssembler',
	#superclass : 'Object',
	#instVars : [
		'program'
	],
	#category : 'Avr-Assembly',
	#package : 'Avr',
	#tag : 'Assembly'
}

{ #category : 'two registers' }
AvrAssembler >> adcDest: destRegister source: sourceRegister [

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

	self add: (AvrOpADD new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrAssembler >> adiwR: register data: immediate [

	self add: (AvrOpADIW new
			 register: register;
			 immediate: immediate)
]

{ #category : 'two registers' }
AvrAssembler >> andDest: destRegister source: sourceRegister [

	self add: (AvrOpAND new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrAssembler >> andiR: register data: immediate [

	self add: (AvrOpANDI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'one register' }
AvrAssembler >> bclr: register [

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

	self add: (AvrOpBSET new register: register)
]

{ #category : 'immediate' }
AvrAssembler >> call: anInteger [

	self add: (AvrOpCALL new immediate: anInteger)
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

	self add: (AvrOpCOM new register: register)
]

{ #category : 'two registers' }
AvrAssembler >> cpDest: destRegister source: sourceRegister [

	self add: (AvrOpCP new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'two registers' }
AvrAssembler >> cpcDest: destRegister source: sourceRegister [

	self add: (AvrOpCPC new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrAssembler >> cpiR: register data: immediate [

	self add: (AvrOpCPI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'two registers' }
AvrAssembler >> cpseDest: destRegister source: sourceRegister [

	self add: (AvrOpCPSE new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'one register' }
AvrAssembler >> dec: register [

	self add: (AvrOpDEC new register: register)
]

{ #category : 'two registers' }
AvrAssembler >> eorDest: destRegister source: sourceRegister [

	self add: (AvrOpEOR new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrAssembler >> inR: register address: io [

	self add: (AvrOpIN new
			 immediate: io;
			 register: register)
]

{ #category : 'one register' }
AvrAssembler >> inc: register [

	self add: (AvrOpINC new register: register)
]

{ #category : 'immediate' }
AvrAssembler >> jmp: anInteger [

	self add: (AvrOpJMP new immediate: anInteger)
]

{ #category : 'accessing' }
AvrAssembler >> label: aString [

	program label: aString
]

{ #category : 'accessing' }
AvrAssembler >> labeler [

	^ program labeler
]

{ #category : 'register-immediate' }
AvrAssembler >> lddR: register y: immediate [

	self add: (AvrOpLDDY new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> lddR: register z: immediate [

	self add: (AvrOpLDDZ new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> ldiR: register data: immediate [

	self add: (AvrOpLDI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> ldsR: register address: immediate [

	self add: (AvrOpLDS new
			 register: register;
			 immediate: immediate)
]

{ #category : 'one register' }
AvrAssembler >> ldx: register [

	self add: (AvrOpLDX1 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> ldz: register [

	self add: (AvrOpLDZ1 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> ldzDec: register [

	self add: (AvrOpLDZ3 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> ldzInc: register [

	self add: (AvrOpLDZ2 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> lpmz: register [

	self add: (AvrOpLPM2 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> lpmzInc: register [

	self add: (AvrOpLPM3 new register: register)
]

{ #category : 'two registers' }
AvrAssembler >> movDest: destRegister source: sourceRegister [

	self add: (AvrOpMOV new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'two registers' }
AvrAssembler >> movwDest: destRegister source: sourceRegister [

	self add: (AvrOpMOVW new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'two registers' }
AvrAssembler >> mulsDest: destRegister source: sourceRegister [

	self add: (AvrOpMULS new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'two registers' }
AvrAssembler >> mulsuDest: destRegister source: sourceRegister [

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

	self add: (AvrOpOR new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrAssembler >> oriR: register data: immediate [

	self add: (AvrOpORI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> out: io r: register [

	self add: (AvrOpOUT new
			 immediate: io;
			 register: register)
]

{ #category : 'one register' }
AvrAssembler >> pop: register [

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

	self add: (AvrOpPUSH new register: register)
]

{ #category : 'immediate' }
AvrAssembler >> rcall: relative [

	self add: (AvrOpRCALL new immediate: relative)
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

{ #category : 'two registers' }
AvrAssembler >> sbcDest: destRegister source: sourceRegister [

	self add: (AvrOpSBC new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrAssembler >> sbciR: register data: immediate [

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

	self add: (AvrOpSBIW new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> sbrc: register bit: immediate [

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

{ #category : 'register-immediate' }
AvrAssembler >> stdY: immediate r: register [

	self add: (AvrOpSTDY new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> stdZ: immediate r: register [

	self add: (AvrOpSTDZ new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrAssembler >> stsAddress: immediate r: register [

	self add: (AvrOpSTS new
			 register: register;
			 immediate: immediate)
]

{ #category : 'one register' }
AvrAssembler >> stx: register [

	self add: (AvrOpSTX1 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> stxInc: register [

	self add: (AvrOpSTX2 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> sty: register [

	self add: (AvrOpSTY1 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> styInc: register [

	self add: (AvrOpSTY2 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> stz: register [

	self add: (AvrOpSTZ1 new register: register)
]

{ #category : 'one register' }
AvrAssembler >> stzInc: register [

	self add: (AvrOpSTZ2 new register: register)
]

{ #category : 'two registers' }
AvrAssembler >> subDest: destRegister source: sourceRegister [

	self add: (AvrOpSUB new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrAssembler >> subiR: register data: immediate [

	self add: (AvrOpSUBI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'one register' }
AvrAssembler >> swap: register [

	self add: (AvrOpSWAP new register: register)
]

{ #category : 'immediate' }
AvrAssembler >> word: anInteger [

	self add: (AvrSemiWord new immediate: anInteger)
]
