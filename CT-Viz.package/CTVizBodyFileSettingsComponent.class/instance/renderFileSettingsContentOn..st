rendering
renderFileSettingsContentOn: html

	html div 
		class: 'modal-content';
		with: [  
			html heading 
				level: 2; 
				style: 'margin-left:40px;';
				with: 'Load Dataset Settings'.
			html horizontalRule.
			html form
				with: [
					html div 
						class: 'col s3';
						with: [ 
							html paragraph
								style: 'border-bottom: 3px solid lightblue; font-size: 2rem;';
								with: 'File Delimiter'.
							self renderFileSettingsDelimiterContentOn: html.
						].
					html div 
						class: 'col s4';
						with: [ 
							html paragraph
								style: 'border-bottom: 3px solid lightblue; font-size: 2rem;';
								with: 'Strings as Factors (Disabled)'.
							self renderFileSettingsFactorsContentOn: html.
						].
				].
		]. 