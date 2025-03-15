Class {
	#name : 'AvrNoOperand',
	#superclass : 'AvrInstruction',
	#category : 'Avr-Instructions',
	#package : 'Avr',
	#tag : 'Instructions'
}

{ #category : 'accessing' }
AvrNoOperand >> arguments [

	^ Array new
]

{ #category : 'testing' }
AvrNoOperand >> isValid [

	^ true
]

{ #category : 'accessing' }
AvrNoOperand >> messageText [

	^ self selector
]

{ #category : 'accessing' }
AvrNoOperand >> opcodeMask [

	^ 16rFFFF
]

{ #category : 'accessing' }
AvrNoOperand >> operand [

	^ 0
]

{ #category : 'accessing' }
AvrNoOperand >> operandText [

	^ ''
]
