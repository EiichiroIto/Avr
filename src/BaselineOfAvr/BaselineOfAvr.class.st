Class {
	#name : 'BaselineOfAvr',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfAvr',
	#package : 'BaselineOfAvr'
}

{ #category : 'baselines' }
BaselineOfAvr >> baseline: spec [

	<baseline>
	spec
		baseline: 'PetitParser'
		with: [
		spec repository: 'github://moosetechnology/PetitParser:v3.x.x/src' ].
	spec for: #common do: [
		spec
			package: 'Avr';
			package: 'Avr-Tests' with: [ spec requires: #( 'Avr' ) ] ].
	spec group: 'Deploy' with: #( 'Avr' )
]
