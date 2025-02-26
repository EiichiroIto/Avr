Class {
	#name : 'AvrInstructionBuilder',
	#superclass : 'Object',
	#category : 'Avr-Parser',
	#package : 'Avr',
	#tag : 'Parser'
}

{ #category : 'accessing' }
AvrInstructionBuilder >> immediateOpNamed: aString [

	aString = 'brcc' ifTrue: [ ^ AvrOpBRCC new ].
	aString = 'brcs' ifTrue: [ ^ AvrOpBRCS new ].
	aString = 'breq' ifTrue: [ ^ AvrOpBREQ new ].
	aString = 'brge' ifTrue: [ ^ AvrOpBRGE new ].
	aString = 'brhc' ifTrue: [ ^ AvrOpBRHC new ].
	aString = 'brhs' ifTrue: [ ^ AvrOpBRHS new ].
	aString = 'brid' ifTrue: [ ^ AvrOpBRID new ].
	aString = 'brie' ifTrue: [ ^ AvrOpBRIE new ].
	aString = 'brlt' ifTrue: [ ^ AvrOpBRLT new ].
	aString = 'brmi' ifTrue: [ ^ AvrOpBRMI new ].
	aString = 'brne' ifTrue: [ ^ AvrOpBRNE new ].
	aString = 'brpl' ifTrue: [ ^ AvrOpBRPL new ].
	aString = 'brtc' ifTrue: [ ^ AvrOpBRTC new ].
	aString = 'brts' ifTrue: [ ^ AvrOpBRTS new ].
	aString = 'brvc' ifTrue: [ ^ AvrOpBRVC new ].
	aString = 'brvs' ifTrue: [ ^ AvrOpBRVS new ].
	aString = 'call' ifTrue: [ ^ AvrOpCALL new ].
	aString = 'jmp' ifTrue: [ ^ AvrOpJMP new ].
	aString = 'rcall' ifTrue: [ ^ AvrOpRCALL new ].
	aString = 'rjmp' ifTrue: [ ^ AvrOpRJMP new ].
	^ nil
]

{ #category : 'accessing' }
AvrInstructionBuilder >> ldIndirect: aString [

	aString = 'X' ifTrue: [ ^ AvrOpLDX1 new ].
	aString = 'X+' ifTrue: [ ^ AvrOpLDX2 new ].
	aString = '-X' ifTrue: [ ^ AvrOpLDX3 new ].
	aString = 'Y' ifTrue: [ ^ AvrOpLDY1 new ].
	aString = 'Y+' ifTrue: [ ^ AvrOpLDY2 new ].
	aString = '-Y' ifTrue: [ ^ AvrOpLDY3 new ].
	aString = 'Z' ifTrue: [ ^ AvrOpLDZ1 new ].
	aString = 'Z+' ifTrue: [ ^ AvrOpLDZ2 new ].
	aString = '-Z' ifTrue: [ ^ AvrOpLDZ3 new ].
	^ nil
]

{ #category : 'accessing' }
AvrInstructionBuilder >> lddIndex: aString [

	aString = 'Y+' ifTrue: [ ^ AvrOpLDDY new ].
	aString = 'Z+' ifTrue: [ ^ AvrOpLDDZ new ].
	^ nil
]

{ #category : 'accessing' }
AvrInstructionBuilder >> lpmIndirect: aString [

	aString ifNil: [ ^ AvrOpLPM1 new ].
	aString = 'Z' ifTrue: [ ^ AvrOpLPM2 new ].
	aString = 'Z+' ifTrue: [ ^ AvrOpLPM3 new ].
	^ nil
]

{ #category : 'accessing' }
AvrInstructionBuilder >> noOperandOpNamed: aString [

	aString = 'break' ifTrue: [ ^ AvrOpBREAK new ].
	aString = 'clc' ifTrue: [ ^ AvrOpCLC new ].
	aString = 'clh' ifTrue: [ ^ AvrOpCLH new ].
	aString = 'cli' ifTrue: [ ^ AvrOpCLI new ].
	aString = 'cln' ifTrue: [ ^ AvrOpCLN new ].
	aString = 'cls' ifTrue: [ ^ AvrOpCLS new ].
	aString = 'clt' ifTrue: [ ^ AvrOpCLT new ].
	aString = 'clv' ifTrue: [ ^ AvrOpCLV new ].
	aString = 'clz' ifTrue: [ ^ AvrOpCLZ new ].
	aString = 'eicall' ifTrue: [ ^ AvrOpEICALL new ].
	aString = 'eijmp' ifTrue: [ ^ AvrOpEIJMP new ].
	aString = 'elpm' ifTrue: [ ^ AvrOpELPM1 new ].
	aString = 'icall' ifTrue: [ ^ AvrOpICALL new ].
	aString = 'ijmp' ifTrue: [ ^ AvrOpIJMP new ].
	aString = 'lpm' ifTrue: [ ^ AvrOpLPM1 new ].
	aString = 'nop' ifTrue: [ ^ AvrOpNOP new ].
	aString = 'ret' ifTrue: [ ^ AvrOpRET new ].
	aString = 'reti' ifTrue: [ ^ AvrOpRETI new ].
	aString = 'sec' ifTrue: [ ^ AvrOpSEC new ].
	aString = 'seh' ifTrue: [ ^ AvrOpSEH new ].
	aString = 'sei' ifTrue: [ ^ AvrOpSEI new ].
	aString = 'sen' ifTrue: [ ^ AvrOpSEN new ].
	aString = 'ses' ifTrue: [ ^ AvrOpSES new ].
	aString = 'set' ifTrue: [ ^ AvrOpSET new ].
	aString = 'sev' ifTrue: [ ^ AvrOpSEV new ].
	aString = 'sez' ifTrue: [ ^ AvrOpSEZ new ].
	aString = 'sleep' ifTrue: [ ^ AvrOpSLEEP new ].
	aString = 'wdr' ifTrue: [ ^ AvrOpWDR new ].
	^ nil
]

{ #category : 'accessing' }
AvrInstructionBuilder >> oneRegisterOpNamed: aString [

	aString = 'bclr' ifTrue: [ ^ AvrOpBCLR new ].
	aString = 'bset' ifTrue: [ ^ AvrOpBSET new ].
	aString = 'com' ifTrue: [ ^ AvrOpCOM new ].
	aString = 'dec' ifTrue: [ ^ AvrOpDEC new ].
	aString = 'inc' ifTrue: [ ^ AvrOpINC new ].
	aString = 'asr' ifTrue: [ ^ AvrOpASR new ].
	aString = 'lsr' ifTrue: [ ^ AvrOpLSR new ].
	aString = 'neg' ifTrue: [ ^ AvrOpNEG new ].
	aString = 'pop' ifTrue: [ ^ AvrOpPOP new ].
	aString = 'push' ifTrue: [ ^ AvrOpPUSH new ].
	aString = 'ror' ifTrue: [ ^ AvrOpROR new ].
	aString = 'swap' ifTrue: [ ^ AvrOpSWAP new ].
	^ nil
]

{ #category : 'accessing' }
AvrInstructionBuilder >> registerAndImmediateOpNamed: aString [

	aString = 'adiw' ifTrue: [ ^ AvrOpADIW new ].
	aString = 'andi' ifTrue: [ ^ AvrOpANDI new ].
	aString = 'bld' ifTrue: [ ^ AvrOpBLD new ].
	aString = 'brbc' ifTrue: [ ^ AvrOpBRBC new ].
	aString = 'brbs' ifTrue: [ ^ AvrOpBRBS new ].
	aString = 'bst' ifTrue: [ ^ AvrOpBST new ].
	aString = 'cpi' ifTrue: [ ^ AvrOpCPI new ].
	aString = 'ldi' ifTrue: [ ^ AvrOpLDI new ].
	aString = 'lds' ifTrue: [ ^ AvrOpLDS new ].
	aString = 'in' ifTrue: [ ^ AvrOpIN new ].
	aString = 'ori' ifTrue: [ ^ AvrOpORI new ].
	aString = 'out' ifTrue: [ ^ AvrOpOUT new ].
	aString = 'sbci' ifTrue: [ ^ AvrOpSBCI new ].
	aString = 'sbic' ifTrue: [ ^ AvrOpSBIC new ].
	aString = 'sbis' ifTrue: [ ^ AvrOpSBIS new ].
	aString = 'sbiw' ifTrue: [ ^ AvrOpSBIW new ].
	aString = 'sbrc' ifTrue: [ ^ AvrOpSBRC new ].
	aString = 'sbrs' ifTrue: [ ^ AvrOpSBRS new ].
	aString = 'sts' ifTrue: [ ^ AvrOpSTS new ].
	aString = 'subi' ifTrue: [ ^ AvrOpSUBI new ].
	^ nil
]

{ #category : 'accessing' }
AvrInstructionBuilder >> stIndirect: aString [

	aString = 'X' ifTrue: [ ^ AvrOpSTX1 new ].
	aString = 'X+' ifTrue: [ ^ AvrOpSTX2 new ].
	aString = '-X' ifTrue: [ ^ AvrOpSTX3 new ].
	aString = 'Y' ifTrue: [ ^ AvrOpSTY1 new ].
	aString = 'Y+' ifTrue: [ ^ AvrOpSTY2 new ].
	aString = '-Y' ifTrue: [ ^ AvrOpSTY3 new ].
	aString = 'Z' ifTrue: [ ^ AvrOpSTZ1 new ].
	aString = 'Z+' ifTrue: [ ^ AvrOpSTZ2 new ].
	aString = '-Z' ifTrue: [ ^ AvrOpSTZ3 new ].
	^ nil
]

{ #category : 'accessing' }
AvrInstructionBuilder >> stdIndex: aString [

	aString = 'Y+' ifTrue: [ ^ AvrOpSTDY new ].
	aString = 'Z+' ifTrue: [ ^ AvrOpSTDZ new ].
	^ nil
]

{ #category : 'accessing' }
AvrInstructionBuilder >> twoRegistersOpNamed: aString [

	aString = 'adc' ifTrue: [ ^ AvrOpADC new ].
	aString = 'add' ifTrue: [ ^ AvrOpADD new ].
	aString = 'and' ifTrue: [ ^ AvrOpAND new ].
	aString = 'cp' ifTrue: [ ^ AvrOpCP new ].
	aString = 'cpc' ifTrue: [ ^ AvrOpCPC new ].
	aString = 'cpse' ifTrue: [ ^ AvrOpCPSE new ].
	aString = 'eor' ifTrue: [ ^ AvrOpEOR new ].
	aString = 'fmul' ifTrue: [ ^ AvrOpFMUL new ].
	aString = 'fmuls' ifTrue: [ ^ AvrOpFMULS new ].
	aString = 'fmulsu' ifTrue: [ ^ AvrOpFMULSU new ].
	aString = 'mov' ifTrue: [ ^ AvrOpMOV new ].
	aString = 'movw' ifTrue: [ ^ AvrOpMOVW new ].
	aString = 'mul' ifTrue: [ ^ AvrOpMUL new ].
	aString = 'muls' ifTrue: [ ^ AvrOpMULS new ].
	aString = 'mulsu' ifTrue: [ ^ AvrOpMULSU new ].
	aString = 'or' ifTrue: [ ^ AvrOpOR new ].
	aString = 'sbc' ifTrue: [ ^ AvrOpSBC new ].
	aString = 'sub' ifTrue: [ ^ AvrOpSUB new ].
	^ nil
]
