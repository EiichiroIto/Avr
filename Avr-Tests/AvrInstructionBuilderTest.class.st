"
An AvrInstructionBuilderTest is a test class for testing the behavior of AvrInstructionBuilder
"
Class {
	#name : 'AvrInstructionBuilderTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Parser',
	#package : 'Avr-Tests',
	#tag : 'Parser'
}

{ #category : 'instance creation' }
AvrInstructionBuilderTest >> newBuilder [

	^ AvrInstructionBuilder new
]

{ #category : 'tests' }
AvrInstructionBuilderTest >> testImmediateOpNamed [

	| obj r |
	obj := self newBuilder.
	self assert: (obj immediateOpNamed: 'xyz') isNil.
	r := obj immediateOpNamed: 'brcc'.
	self assert: (r isKindOf: AvrOpBRCC).
	r := obj immediateOpNamed: 'brcs'.
	self assert: (r isKindOf: AvrOpBRCS).
	r := obj immediateOpNamed: 'breq'.
	self assert: (r isKindOf: AvrOpBREQ).
	r := obj immediateOpNamed: 'brge'.
	self assert: (r isKindOf: AvrOpBRGE).
	r := obj immediateOpNamed: 'brhc'.
	self assert: (r isKindOf: AvrOpBRHC).
	r := obj immediateOpNamed: 'brhs'.
	self assert: (r isKindOf: AvrOpBRHS).
	r := obj immediateOpNamed: 'brid'.
	self assert: (r isKindOf: AvrOpBRID).
	r := obj immediateOpNamed: 'brie'.
	self assert: (r isKindOf: AvrOpBRIE).
	r := obj immediateOpNamed: 'brlt'.
	self assert: (r isKindOf: AvrOpBRLT).
	r := obj immediateOpNamed: 'brmi'.
	self assert: (r isKindOf: AvrOpBRMI).
	r := obj immediateOpNamed: 'brne'.
	self assert: (r isKindOf: AvrOpBRNE).
	r := obj immediateOpNamed: 'brpl'.
	self assert: (r isKindOf: AvrOpBRPL).
	r := obj immediateOpNamed: 'brtc'.
	self assert: (r isKindOf: AvrOpBRTC).
	r := obj immediateOpNamed: 'brts'.
	self assert: (r isKindOf: AvrOpBRTS).
	r := obj immediateOpNamed: 'brvc'.
	self assert: (r isKindOf: AvrOpBRVC).
	r := obj immediateOpNamed: 'brvs'.
	self assert: (r isKindOf: AvrOpBRVS).
	r := obj immediateOpNamed: 'call'.
	self assert: (r isKindOf: AvrOpCALL).
	r := obj immediateOpNamed: 'jmp'.
	self assert: (r isKindOf: AvrOpJMP).
	r := obj immediateOpNamed: 'rcall'.
	self assert: (r isKindOf: AvrOpRCALL).
	r := obj immediateOpNamed: 'rjmp'.
	self assert: (r isKindOf: AvrOpRJMP)
]

{ #category : 'tests' }
AvrInstructionBuilderTest >> testLdIndirect [

	| obj r |
	obj := self newBuilder.
	self assert: (obj ldIndirect: 'xyz') isNil.
	r := obj ldIndirect: 'X'.
	self assert: (r isKindOf: AvrOpLDX1).
	r := obj ldIndirect: 'X+'.
	self assert: (r isKindOf: AvrOpLDX2).
	r := obj ldIndirect: '-X'.
	self assert: (r isKindOf: AvrOpLDX3).
	r := obj ldIndirect: 'Y'.
	self assert: (r isKindOf: AvrOpLDY1).
	r := obj ldIndirect: 'Y+'.
	self assert: (r isKindOf: AvrOpLDY2).
	r := obj ldIndirect: '-Y'.
	self assert: (r isKindOf: AvrOpLDY3).
	r := obj ldIndirect: 'Z'.
	self assert: (r isKindOf: AvrOpLDZ1).
	r := obj ldIndirect: 'Z+'.
	self assert: (r isKindOf: AvrOpLDZ2).
	r := obj ldIndirect: '-Z'.
	self assert: (r isKindOf: AvrOpLDZ3)
]

{ #category : 'tests' }
AvrInstructionBuilderTest >> testLddIndex [

	| obj r |
	obj := self newBuilder.
	self assert: (obj lddIndex: 'xyz') isNil.
	r := obj lddIndex: 'Y+'.
	self assert: (r isKindOf: AvrOpLDDY).
	r := obj lddIndex: 'Z+'.
	self assert: (r isKindOf: AvrOpLDDZ)
]

{ #category : 'tests' }
AvrInstructionBuilderTest >> testLpmIndirect [

	| obj r |
	obj := self newBuilder.
	self assert: (obj lpmIndirect: 'xyz') isNil.
	r := obj lpmIndirect: nil.
	self assert: (r isKindOf: AvrOpLPM1).
	r := obj lpmIndirect: 'Z'.
	self assert: (r isKindOf: AvrOpLPM2).
	r := obj lpmIndirect: 'Z+'.
	self assert: (r isKindOf: AvrOpLPM3)
]

{ #category : 'tests' }
AvrInstructionBuilderTest >> testNoOperandOpNamed [

	| obj r |
	obj := self newBuilder.
	self assert: (obj noOperandOpNamed: 'xyz') isNil.
	r := obj noOperandOpNamed: 'break'.
	self assert: (r isKindOf: AvrOpBREAK).
	r := obj noOperandOpNamed: 'clc'.
	self assert: (r isKindOf: AvrOpCLC).
	r := obj noOperandOpNamed: 'clh'.
	self assert: (r isKindOf: AvrOpCLH).
	r := obj noOperandOpNamed: 'cli'.
	self assert: (r isKindOf: AvrOpCLI).
	r := obj noOperandOpNamed: 'cln'.
	self assert: (r isKindOf: AvrOpCLN).
	r := obj noOperandOpNamed: 'cls'.
	self assert: (r isKindOf: AvrOpCLS).
	r := obj noOperandOpNamed: 'clt'.
	self assert: (r isKindOf: AvrOpCLT).
	r := obj noOperandOpNamed: 'clv'.
	self assert: (r isKindOf: AvrOpCLV).
	r := obj noOperandOpNamed: 'clz'.
	self assert: (r isKindOf: AvrOpCLZ).
	r := obj noOperandOpNamed: 'eicall'.
	self assert: (r isKindOf: AvrOpEICALL).
	r := obj noOperandOpNamed: 'eijmp'.
	self assert: (r isKindOf: AvrOpEIJMP).
	r := obj noOperandOpNamed: 'elpm'.
	self assert: (r isKindOf: AvrOpELPM1).
	r := obj noOperandOpNamed: 'icall'.
	self assert: (r isKindOf: AvrOpICALL).
	r := obj noOperandOpNamed: 'ijmp'.
	self assert: (r isKindOf: AvrOpIJMP).
	r := obj noOperandOpNamed: 'lpm'.
	self assert: (r isKindOf: AvrOpLPM1).
	r := obj noOperandOpNamed: 'nop'.
	self assert: (r isKindOf: AvrOpNOP).
	r := obj noOperandOpNamed: 'ret'.
	self assert: (r isKindOf: AvrOpRET).
	r := obj noOperandOpNamed: 'reti'.
	self assert: (r isKindOf: AvrOpRETI).
	r := obj noOperandOpNamed: 'sec'.
	self assert: (r isKindOf: AvrOpSEC).
	r := obj noOperandOpNamed: 'seh'.
	self assert: (r isKindOf: AvrOpSEH).
	r := obj noOperandOpNamed: 'sei'.
	self assert: (r isKindOf: AvrOpSEI).
	r := obj noOperandOpNamed: 'sen'.
	self assert: (r isKindOf: AvrOpSEN).
	r := obj noOperandOpNamed: 'ses'.
	self assert: (r isKindOf: AvrOpSES).
	r := obj noOperandOpNamed: 'set'.
	self assert: (r isKindOf: AvrOpSET).
	r := obj noOperandOpNamed: 'sev'.
	self assert: (r isKindOf: AvrOpSEV).
	r := obj noOperandOpNamed: 'sez'.
	self assert: (r isKindOf: AvrOpSEZ).
	r := obj noOperandOpNamed: 'sleep'.
	self assert: (r isKindOf: AvrOpSLEEP).
	r := obj noOperandOpNamed: 'wdr'.
	self assert: (r isKindOf: AvrOpWDR)
]

{ #category : 'tests' }
AvrInstructionBuilderTest >> testOneRegisterOpNamed [

	| obj r |
	obj := self newBuilder.
	self assert: (obj oneRegisterOpNamed: 'xyz') isNil.
	r := obj oneRegisterOpNamed: 'bclr'.
	self assert: (r isKindOf: AvrOpBCLR).
	r := obj oneRegisterOpNamed: 'bset'.
	self assert: (r isKindOf: AvrOpBSET).
	r := obj oneRegisterOpNamed: 'com'.
	self assert: (r isKindOf: AvrOpCOM).
	r := obj oneRegisterOpNamed: 'dec'.
	self assert: (r isKindOf: AvrOpDEC).
	r := obj oneRegisterOpNamed: 'inc'.
	self assert: (r isKindOf: AvrOpINC).
	r := obj oneRegisterOpNamed: 'asr'.
	self assert: (r isKindOf: AvrOpASR).
	r := obj oneRegisterOpNamed: 'lsr'.
	self assert: (r isKindOf: AvrOpLSR).
	r := obj oneRegisterOpNamed: 'neg'.
	self assert: (r isKindOf: AvrOpNEG).
	r := obj oneRegisterOpNamed: 'pop'.
	self assert: (r isKindOf: AvrOpPOP).
	r := obj oneRegisterOpNamed: 'push'.
	self assert: (r isKindOf: AvrOpPUSH).
	r := obj oneRegisterOpNamed: 'ror'.
	self assert: (r isKindOf: AvrOpROR).
	r := obj oneRegisterOpNamed: 'swap'.
	self assert: (r isKindOf: AvrOpSWAP)
]

{ #category : 'tests' }
AvrInstructionBuilderTest >> testRegisterAndImmediateOpNamed [

	| obj r |
	obj := self newBuilder.
	self assert: (obj registerAndImmediateOpNamed: 'xyz') isNil.
	r := obj registerAndImmediateOpNamed: 'adiw'.
	self assert: (r isKindOf: AvrOpADIW).
	r := obj registerAndImmediateOpNamed: 'andi'.
	self assert: (r isKindOf: AvrOpANDI).
	r := obj registerAndImmediateOpNamed: 'bld'.
	self assert: (r isKindOf: AvrOpBLD).
	r := obj registerAndImmediateOpNamed: 'brbc'.
	self assert: (r isKindOf: AvrOpBRBC).
	r := obj registerAndImmediateOpNamed: 'brbs'.
	self assert: (r isKindOf: AvrOpBRBS).
	r := obj registerAndImmediateOpNamed: 'bst'.
	self assert: (r isKindOf: AvrOpBST).
	r := obj registerAndImmediateOpNamed: 'cpi'.
	self assert: (r isKindOf: AvrOpCPI).
	r := obj registerAndImmediateOpNamed: 'ldi'.
	self assert: (r isKindOf: AvrOpLDI).
	r := obj registerAndImmediateOpNamed: 'lds'.
	self assert: (r isKindOf: AvrOpLDS).
	r := obj registerAndImmediateOpNamed: 'in'.
	self assert: (r isKindOf: AvrOpIN).
	r := obj registerAndImmediateOpNamed: 'ori'.
	self assert: (r isKindOf: AvrOpORI).
	r := obj registerAndImmediateOpNamed: 'out'.
	self assert: (r isKindOf: AvrOpOUT).
	r := obj registerAndImmediateOpNamed: 'sbci'.
	self assert: (r isKindOf: AvrOpSBCI).
	r := obj registerAndImmediateOpNamed: 'sbic'.
	self assert: (r isKindOf: AvrOpSBIC).
	r := obj registerAndImmediateOpNamed: 'sbis'.
	self assert: (r isKindOf: AvrOpSBIS).
	r := obj registerAndImmediateOpNamed: 'sbiw'.
	self assert: (r isKindOf: AvrOpSBIW).
	r := obj registerAndImmediateOpNamed: 'sbrc'.
	self assert: (r isKindOf: AvrOpSBRC).
	r := obj registerAndImmediateOpNamed: 'sbrs'.
	self assert: (r isKindOf: AvrOpSBRS).
	r := obj registerAndImmediateOpNamed: 'sts'.
	self assert: (r isKindOf: AvrOpSTS).
	r := obj registerAndImmediateOpNamed: 'subi'.
	self assert: (r isKindOf: AvrOpSUBI)
]

{ #category : 'tests' }
AvrInstructionBuilderTest >> testStIndirect [

	| obj r |
	obj := self newBuilder.
	self assert: (obj stIndirect: 'xyz') isNil.
	r := obj stIndirect: 'X'.
	self assert: (r isKindOf: AvrOpSTX1).
	r := obj stIndirect: 'X+'.
	self assert: (r isKindOf: AvrOpSTX2).
	r := obj stIndirect: '-X'.
	self assert: (r isKindOf: AvrOpSTX3).
	r := obj stIndirect: 'Y+'.
	self assert: (r isKindOf: AvrOpSTY2).
	r := obj stIndirect: '-Y'.
	self assert: (r isKindOf: AvrOpSTY3).
	r := obj stIndirect: 'Z+'.
	self assert: (r isKindOf: AvrOpSTZ2).
	r := obj stIndirect: '-Z'.
	self assert: (r isKindOf: AvrOpSTZ3)
]

{ #category : 'tests' }
AvrInstructionBuilderTest >> testStdIndex [

	| obj r |
	obj := self newBuilder.
	self assert: (obj stdIndex: 'xyz') isNil.
	r := obj stdIndex: 'Y+'.
	self assert: (r isKindOf: AvrOpSTDY).
	r := obj stdIndex: 'Z+'.
	self assert: (r isKindOf: AvrOpSTDZ)
]

{ #category : 'tests' }
AvrInstructionBuilderTest >> testTwoRegistersOpNamed [

	| obj r |
	obj := self newBuilder.
	self assert: (obj twoRegistersOpNamed: 'xyz') isNil.
	r := obj twoRegistersOpNamed: 'adc'.
	self assert: (r isKindOf: AvrOpADC).
	r := obj twoRegistersOpNamed: 'add'.
	self assert: (r isKindOf: AvrOpADD).
	r := obj twoRegistersOpNamed: 'and'.
	self assert: (r isKindOf: AvrOpAND).
	r := obj twoRegistersOpNamed: 'cp'.
	self assert: (r isKindOf: AvrOpCP).
	r := obj twoRegistersOpNamed: 'cpc'.
	self assert: (r isKindOf: AvrOpCPC).
	r := obj twoRegistersOpNamed: 'cpse'.
	self assert: (r isKindOf: AvrOpCPSE).
	r := obj twoRegistersOpNamed: 'eor'.
	self assert: (r isKindOf: AvrOpEOR).
	r := obj twoRegistersOpNamed: 'fmul'.
	self assert: (r isKindOf: AvrOpFMUL).
	r := obj twoRegistersOpNamed: 'fmuls'.
	self assert: (r isKindOf: AvrOpFMULS).
	r := obj twoRegistersOpNamed: 'fmulsu'.
	self assert: (r isKindOf: AvrOpFMULSU).
	r := obj twoRegistersOpNamed: 'mov'.
	self assert: (r isKindOf: AvrOpMOV).
	r := obj twoRegistersOpNamed: 'movw'.
	self assert: (r isKindOf: AvrOpMOVW).
	r := obj twoRegistersOpNamed: 'mul'.
	self assert: (r isKindOf: AvrOpMUL).
	r := obj twoRegistersOpNamed: 'muls'.
	self assert: (r isKindOf: AvrOpMULS).
	r := obj twoRegistersOpNamed: 'mulsu'.
	self assert: (r isKindOf: AvrOpMULSU).
	r := obj twoRegistersOpNamed: 'or'.
	self assert: (r isKindOf: AvrOpOR).
	r := obj twoRegistersOpNamed: 'sbc'.
	self assert: (r isKindOf: AvrOpSBC).
	r := obj twoRegistersOpNamed: 'sub'.
	self assert: (r isKindOf: AvrOpSUB)
]
