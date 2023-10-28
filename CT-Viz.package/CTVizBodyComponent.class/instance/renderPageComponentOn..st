rendering
renderPageComponentOn: html

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
		with: [	
			html render: self summaryComponent.
			html render: self analyticsComponent.
		].
	
		self renderDataTablesScriptOn: html.