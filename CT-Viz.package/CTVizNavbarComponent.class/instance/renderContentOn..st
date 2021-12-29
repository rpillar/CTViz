rendering
renderContentOn: html 

	html div 
		class: 'navbar-fixed';
		with: [ 
			html navigation
				style: 'background-color: #000';
				with: [
					html div
						class: 'nav-wrapper';
						with: [
							html div 
								class: 'container';
								with: [ 
									html anchor
										class: 'brand-logo';
										style: 'font-family: Lobster; font-size: 2.5rem;';
										url: '#';
										with: 'CTViz'.
								].
						].
				].
		].			
		
