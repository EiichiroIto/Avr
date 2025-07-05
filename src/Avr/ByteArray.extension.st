Extension { #name : 'ByteArray' }

{ #category : '*Avr' }
ByteArray >> addLiteralCodesFor: anAssembler [

	| byteArray |
	byteArray := self , #[ 0 ].
	byteArray pairsDo: [ :low :high | anAssembler word: high << 8 + low ]
]
