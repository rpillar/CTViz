rendering
renderContentOn: html

	html div
		class: 'message';
		class: self messageType, 'Message';
		style: 'margin-bottom: 15px;text-align:left;';
		with: [
			html span
				class: 'messageSpan';  
				style: '	font-size: 2rem;font-weight:300;';
				with: self messageString.
		].	