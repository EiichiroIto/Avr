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

{ #category : 'initialization' }
AvrLabeler >> initialize [

	labelNo := 0.
	labels := Dictionary new
]

{ #category : 'accessing' }
AvrLabeler >> labelAddressAt: anInteger [

	^ labels at: anInteger ifAbsent: nil
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

	^ labels keyAtValue: aString ifAbsent: nil
]

{ #category : 'accessing' }
AvrLabeler >> labelNameAt: aString put: anInteger [

	labels at: anInteger put: aString
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
