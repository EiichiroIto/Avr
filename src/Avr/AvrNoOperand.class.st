Class {
	#name : 'AvrNoOperand',
	#superclass : 'AvrInstruction',
	#category : 'Avr-Core',
	#package : 'Avr',
	#tag : 'Core'
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
AvrNoOperand >> operand [

	^ 0
]

{ #category : 'accessing' }
AvrNoOperand >> operandText [

	^ ''
]
