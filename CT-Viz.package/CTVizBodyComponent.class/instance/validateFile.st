file validation
validateFile

	| file |

	"validate"
	( self fileName = '' ) ifTrue: [ 
		^ 'File has not been entered - please correct' 
	].
	file := File new.
	file named: self fileName.
	( file exists ) ifFalse: [ 
		^ 'File does not exist - please correct' 
	].
	( file size = 0 ) ifTrue: [ 
		^ 'File is empty.' 
	]. 
 
	^ ''.

