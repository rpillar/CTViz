accessing
receiveFile

	| csv |
	
	csv := CTCSV new.
	csv loadFromCSVFile: self fileName.
	self session dataframe loadData: csv data.
	self session dataframe selectAll.

	^ 'File Loaded'.