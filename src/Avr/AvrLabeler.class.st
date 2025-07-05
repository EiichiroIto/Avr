Class {
	#name : 'AvrLabeler',
	#superclass : 'Object',
	#instVars : [
		'labelNo',
		'labels'
	],
	#category : 'Avr-Assembly',
	#package : 'Avr',
	#tag : 'Assembly'
}

{ #category : 'accessing' }
AvrLabeler >> hasAddressOfName: aString [

	^ labels includesKey: aString
]

{ #category : 'initialization' }
AvrLabeler >> initialize [

	labelNo := 0.
	labels := Dictionary new
]

{ #category : 'accessing' }
AvrLabeler >> labelAddressAt: anInteger [

	^ labels keyAtValue: anInteger ifAbsent: nil
]

{ #category : 'accessing' }
AvrLabeler >> labelAddressPut: anInteger [

	| label1 |
	(self labelAddressAt: anInteger) ifNotNil: [ :label2 | ^ label2 ].
	label1 := self nextLabel.
	self labelNameAt: label1 put: anInteger.
	^ label1
]

{ #category : 'accessing' }
AvrLabeler >> labelNameAt: aString [

	^ labels at: aString ifAbsent: nil
]

{ #category : 'accessing' }
AvrLabeler >> labelNameAt: aString put: anInteger [

	(self hasAddressOfName: aString) ifTrue: [ self error ].
	labels at: aString put: anInteger
]

{ #category : 'accessing' }
AvrLabeler >> labelNo [

	^ labelNo
]

{ #category : 'accessing' }
AvrLabeler >> labelNo: anObject [

	labelNo := anObject
]

{ #category : 'accessing' }
AvrLabeler >> labels [

	^ labels
]

{ #category : 'accessing' }
AvrLabeler >> labels: anObject [

	labels := anObject
]

{ #category : 'accessing' }
AvrLabeler >> nextLabel [

	labelNo := labelNo + 1.
	^ 'label' , labelNo asString
]

{ #category : 'accessing' }
AvrLabeler >> peekLabel [

	^ 'label' , (labelNo + 1) asString
]
