Class {
	#name : 'AvrOpBST',
	#superclass : 'AvrRegisterWithImmediate',
	#traits : 'TAvrRegisterAndBitOp',
	#classTraits : 'TAvrRegisterAndBitOp classTrait',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
}

{ #category : 'accessing' }
AvrOpBST >> category [

	^ #arithmeticAndLogic
]

{ #category : 'accessing' }
AvrOpBST >> description [

	^ 'bit store from register to T'
]

{ #category : 'accessing' }
AvrOpBST >> mnemonic [

	^ #BST
]

{ #category : 'accessing' }
AvrOpBST >> opcode [

	^ 16rFA00
]
