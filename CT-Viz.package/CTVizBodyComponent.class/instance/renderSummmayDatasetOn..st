rendering
renderSummmayDatasetOn: html

	| fileMessage |
	
	fileMessage := self receiveFile.
	self messageComponent infoMessage: fileMessage, ' : ', self fileName.

	html div 
		style: 'background-color:lightblue;width:100%;height:90px;';
		with: [  
			html div 
				class: 'container';
				with: [ 
					html div						
						class: 'col s12 messageComponent';
						style: 'margin-top: 30px;';
						with: [
							html render: self messageComponent.
						].
				].
		].
	
	html div 
		id: 'summary-data-container';
		class: 'container';
		with: [
			html div 
				class: 'col s12';
				with: [  
					html heading level: 2; 
						style: 'font-weight:300';
						with: [ 
							html span
								style: 'border-bottom: 3px solid lightblue;';
								with: 'Summary data'
						]
				].
			html div 
				class: 'col s12';
				with: [  
					html heading level: 4;
						style: 'font-weight:300';
						with: [
							html span
								style: 'border-bottom: 2px solid lightblue;';
								with: 'Number of observations : ', ( self session dataframe resultset size ) asString
						]
				]. 
			html div 
				class: 'col s12';
				with: [  
					html table 
						id: 'summary-table';
						class: 'responsive hover row-border order-column';
						with: [  
							html tableHead 
								with: [  
									html tableRow 
										style: 'line-height:1.4';
										with: [  
											html tableHeading 
												style: 'width:10%';
												with: [
													html span
														style: 'border-bottom: solid 3px lightblue;font-size:1.3em';
														with: ''.
												].
											html tableHeading 
												style: 'width:30%';
												with: [
													html span
														style: 'border-bottom: solid 3px lightblue;font-size:1.3em';
														with: 'Variable'.
												].
											html tableHeading 
												style: 'width:15%';
												with: [
													html span
														style: 'border-bottom: solid 3px lightblue;font-size:1.3em';
														with: 'Type'.
												].
											html tableHeading 
												style: 'width:15%';
												with: [
													html span
														style: 'border-bottom: solid 3px lightblue;font-size:1.3em';
														with: 'Min'.
												].
											html tableHeading 
												style: 'width:15%';
												with: [
													html span
														style: 'border-bottom: solid 3px lightblue;font-size:1.4em';
														with: 'Max'.
												].
											html tableHeading 
												style: 'width:15%';
												with: [
													html span
														style: 'border-bottom: solid 3px lightblue;font-size:1.3em';
														with: 'Mean'.
												].				
										].
								].
						].
				].
		].
	
		self renderDataTablesScriptOn: html.