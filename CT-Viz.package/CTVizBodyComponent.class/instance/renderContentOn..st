rendering
renderContentOn: html

	"home - initial file load page"	
	html div
		id: 'ctviz-body';
		with: [  
			html div 
				class: 'container file-load-page';
				style: 'margin-top: 70px';
				with: [  
					html paragraph 
						style: 'font-size: 2rem; font-weight:300;';
						with: 'Enter and load your dataset - the filepath must be a complete path (relative paths are not supported presently). The file (currently) must be a well formatted CSV file with headers and a <comma> as the column separator.'
				].
			html div 
				class: 'container';
				style: 'margin-top: 30px';
				with: [  
						self messageComponent messageString: 'Enter file path / name.'; messageType: 'info'.
						self renderLoadDatasetFormOn: html.
				].
		].
	
	"file settings modal"
	self renderFileSettingsModalOn: html.
	
	html document addLoadScript: ( ( JSStream on:	'$(''.modal'').modal({outDuration:300,opacity:.4})' ) ).
