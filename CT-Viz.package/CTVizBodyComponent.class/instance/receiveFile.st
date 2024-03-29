file load
receiveFile

	| csv |
	
	"get the file and load the data into a dataframe"
	csv := CTCSV new.
	csv delimiter: self session delimiter.
	csv loadFromCSVFile: self fileName.
	self dataframe: ( self session dataframe loadData: csv data ).
	self dataframe selectAll.  

	^ 'File Loaded'.