accessing
receiveFile

	| csv |
	
	csv := CTCSV new.
	csv delimiter: self session delimiter.
	csv loadFromCSVFile: self fileName.
	self dataframe: ( self session dataframe loadData: csv data ).
	self dataframe selectAll.  

	^ 'File Loaded'.