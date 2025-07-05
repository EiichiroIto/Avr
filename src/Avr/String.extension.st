Extension { #name : 'String' }

{ #category : '*Avr' }
String >> addLiteralCodesFor: anAssembler [

	| byteArray |
	byteArray := self asByteArray , #[ 0 0 ].
	byteArray pairsDo: [ :low :high | anAssembler word: high << 8 + low ]
]
