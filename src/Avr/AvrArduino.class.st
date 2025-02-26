Class {
	#name : 'AvrArduino',
	#superclass : 'Object',
	#instVars : [
		'program'
	],
	#category : 'Avr-Arduino',
	#package : 'Avr',
	#tag : 'Arduino'
}

{ #category : 'two registers' }
AvrArduino >> adcDest: destRegister source: sourceRegister [

	self add: (AvrOpADC new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'private' }
AvrArduino >> add: aCode [

	program add: aCode
]

{ #category : 'two registers' }
AvrArduino >> addDest: destRegister source: sourceRegister [

	self add: (AvrOpADD new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrArduino >> adiwR: register data: immediate [

	self add: (AvrOpADIW new
			 register: register;
			 immediate: immediate)
]

{ #category : 'two registers' }
AvrArduino >> andDest: destRegister source: sourceRegister [

	self add: (AvrOpAND new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrArduino >> andiR: register data: immediate [

	self add: (AvrOpANDI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'immediate' }
AvrArduino >> brcc: anInteger [

	self add: (AvrOpBRCC new immediate: anInteger)
]

{ #category : 'immediate' }
AvrArduino >> brcs: anInteger [

	self add: (AvrOpBRCS new immediate: anInteger)
]

{ #category : 'immediate' }
AvrArduino >> breq: anInteger [

	self add: (AvrOpBREQ new immediate: anInteger)
]

{ #category : 'immediate' }
AvrArduino >> brge: anInteger [

	self add: (AvrOpBRGE new immediate: anInteger)
]

{ #category : 'immediate' }
AvrArduino >> brne: anInteger [

	self add: (AvrOpBRNE new immediate: anInteger)
]

{ #category : 'immediate' }
AvrArduino >> call: anInteger [

	self add: (AvrOpCALL new immediate: anInteger)
]

{ #category : 'no register' }
AvrArduino >> cli [

	self add: AvrOpCLI new
]

{ #category : 'one register' }
AvrArduino >> com: register [

	self add: (AvrOpCOM new register: register)
]

{ #category : 'two registers' }
AvrArduino >> cpDest: destRegister source: sourceRegister [

	self add: (AvrOpCP new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'two registers' }
AvrArduino >> cpcDest: destRegister source: sourceRegister [

	self add: (AvrOpCPC new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrArduino >> cpiR: register data: immediate [

	self add: (AvrOpCPI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'two registers' }
AvrArduino >> cpseDest: destRegister source: sourceRegister [

	self add: (AvrOpCPSE new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'one register' }
AvrArduino >> dec: register [

	self add: (AvrOpDEC new register: register)
]

{ #category : 'two registers' }
AvrArduino >> eorDest: destRegister source: sourceRegister [

	self add: (AvrOpEOR new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrArduino >> inR: register address: io [

	self add: (AvrOpIN new
			 immediate: io;
			 register: register)
]

{ #category : 'one register' }
AvrArduino >> inc: register [

	self add: (AvrOpINC new register: register)
]

{ #category : 'initialization' }
AvrArduino >> initialize [

	program := self newProgram
]

{ #category : 'immediate' }
AvrArduino >> jmp: anInteger [

	self add: (AvrOpJMP new immediate: anInteger)
]

{ #category : 'private' }
AvrArduino >> label: aString [

	program label: aString
]

{ #category : 'register-immediate' }
AvrArduino >> lddR: register y: immediate [

	self add: (AvrOpLDDY new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrArduino >> lddR: register z: immediate [

	self add: (AvrOpLDDZ new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrArduino >> ldiR: register data: immediate [

	self add: (AvrOpLDI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrArduino >> ldsR: register address: immediate [

	self add: (AvrOpLDS new
			 register: register;
			 immediate: immediate)
]

{ #category : 'one register' }
AvrArduino >> ldx: register [

	self add: (AvrOpLDX1 new register: register)
]

{ #category : 'one register' }
AvrArduino >> ldz: register [

	self add: (AvrOpLDZ1 new register: register)
]

{ #category : 'one register' }
AvrArduino >> lpmz: register [

	self add: (AvrOpLPM2 new register: register)
]

{ #category : 'one register' }
AvrArduino >> lpmzInc: register [

	self add: (AvrOpLPM3 new register: register)
]

{ #category : 'two registers' }
AvrArduino >> movDest: destRegister source: sourceRegister [

	self add: (AvrOpMOV new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'two registers' }
AvrArduino >> movwDest: destRegister source: sourceRegister [

	self add: (AvrOpMOVW new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'two registers' }
AvrArduino >> mulsDest: destRegister source: sourceRegister [

	self add: (AvrOpMULS new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'two registers' }
AvrArduino >> mulsuDest: destRegister source: sourceRegister [

	self add: (AvrOpMULSU new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'instance creation' }
AvrArduino >> newProgram [

	^ AvrProgram new
]

{ #category : 'no register' }
AvrArduino >> nop [

	self add: AvrOpNOP new
]

{ #category : 'two registers' }
AvrArduino >> orDest: destRegister source: sourceRegister [

	self add: (AvrOpOR new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrArduino >> oriR: register data: immediate [

	self add: (AvrOpORI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrArduino >> out: io r: register [

	self add: (AvrOpOUT new
			 immediate: io;
			 register: register)
]

{ #category : 'one register' }
AvrArduino >> pop: register [

	self add: (AvrOpPOP new register: register)
]

{ #category : 'accessing' }
AvrArduino >> program [

	^ program
]

{ #category : 'accessing' }
AvrArduino >> program: anObject [

	program := anObject
]

{ #category : 'one register' }
AvrArduino >> push: register [

	self add: (AvrOpPUSH new register: register)
]

{ #category : 'immediate' }
AvrArduino >> rcall: relative [

	self add: (AvrOpRCALL new immediate: relative)
]

{ #category : 'no register' }
AvrArduino >> ret [

	self add: AvrOpRET new
]

{ #category : 'no register' }
AvrArduino >> reti [

	self add: AvrOpRETI new
]

{ #category : 'immediate' }
AvrArduino >> rjmp: relative [

	self add: (AvrOpRJMP new immediate: relative)
]

{ #category : 'two registers' }
AvrArduino >> sbcDest: destRegister source: sourceRegister [

	self add: (AvrOpSBC new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrArduino >> sbciR: register data: immediate [

	self add: (AvrOpSBCI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrArduino >> sbisR: register data: immediate [

	self add: (AvrOpSBIS new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrArduino >> sbiwR: register data: immediate [

	self add: (AvrOpSBIW new
			 register: register;
			 immediate: immediate)
]

{ #category : 'no register' }
AvrArduino >> sei [

	self add: AvrOpSEI new
]

{ #category : 'register-immediate' }
AvrArduino >> stdY: immediate r: register [

	self add: (AvrOpSTDY new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrArduino >> stdZ: immediate r: register [

	self add: (AvrOpSTDZ new
			 register: register;
			 immediate: immediate)
]

{ #category : 'register-immediate' }
AvrArduino >> stsR: register data: immediate [

	self add: (AvrOpSTS new
			 register: register;
			 immediate: immediate)
]

{ #category : 'one register' }
AvrArduino >> stx: register [

	self add: (AvrOpSTX1 new register: register)
]

{ #category : 'one register' }
AvrArduino >> stxInc: register [

	self add: (AvrOpSTX2 new register: register)
]

{ #category : 'one register' }
AvrArduino >> sty: register [

	self add: (AvrOpSTY1 new register: register)
]

{ #category : 'one register' }
AvrArduino >> styInc: register [

	self add: (AvrOpSTY2 new register: register)
]

{ #category : 'one register' }
AvrArduino >> stz: register [

	self add: (AvrOpSTZ1 new register: register)
]

{ #category : 'one register' }
AvrArduino >> stzInc: register [

	self add: (AvrOpSTZ2 new register: register)
]

{ #category : 'two registers' }
AvrArduino >> subDest: destRegister source: sourceRegister [

	self add: (AvrOpSUB new
			 dest: destRegister;
			 source: sourceRegister)
]

{ #category : 'register-immediate' }
AvrArduino >> subiR: register data: immediate [

	self add: (AvrOpSUBI new
			 register: register;
			 immediate: immediate)
]

{ #category : 'immediate' }
AvrArduino >> word: anInteger [

	self add: (AvrSemiWord new immediate: anInteger)
]
