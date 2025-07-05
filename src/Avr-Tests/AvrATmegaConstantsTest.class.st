"
An AvrATmegaConstantsTest is a test class for testing the behavior of AvrATmegaConstants
"
Class {
	#name : 'AvrATmegaConstantsTest',
	#superclass : 'TestCase',
	#category : 'Avr-Tests-Arduino',
	#package : 'Avr-Tests',
	#tag : 'Arduino'
}

{ #category : 'instance creation' }
AvrATmegaConstantsTest >> newObj [

	^ AvrATmegaConstants new
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testAdcStartConversion [

	self assert: self newObj adcStartConversion equals: 16r40
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testAdmuxDefault [

	self assert: self newObj admuxDefault equals: 16r40
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testFosc [

	self assert: self newObj fosc equals: 16000000
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testRamSize [

	self assert: self newObj ramSize equals: 16r900
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testSerialData8 [

	self assert: self newObj serialData8 equals: 2r00000110
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testSerialDataRegisterEmpty [

	self assert: self newObj serialDataRegisterEmpty equals: 16r20
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testSerialReceiveComplete [

	self assert: self newObj serialReceiveComplete equals: 2r10000000
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testSerialTransmitComplete [

	self assert: self newObj serialTransmitComplete equals: 2r01000000
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testSerialTxRxEnable [

	self assert: self newObj serialTxRxEnable equals: 2r00011000
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testXRegisters [

	self assertCollection: self newObj xRegisters equals: #( 26 27 )
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testXh [

	self assert: self newObj xh equals: 16r1B
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testXl [

	self assert: self newObj xl equals: 16r1A
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testYRegisters [

	self assertCollection: self newObj yRegisters equals: #( 28 29 )
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testYh [

	self assert: self newObj yh equals: 16r1D
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testYl [

	self assert: self newObj yl equals: 16r1C
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testZRegisters [

	self assertCollection: self newObj zRegisters equals: #( 30 31 )
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testZh [

	self assert: self newObj zh equals: 16r1F
]

{ #category : 'tests' }
AvrATmegaConstantsTest >> testZl [

	self assert: self newObj zl equals: 16r1E
]
