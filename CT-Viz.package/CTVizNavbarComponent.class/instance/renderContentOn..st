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
									html unorderedList
										id: 'nav-mobile';
										class: 'right active-navbar';
										style: 'display:none';
										with: [  
											html listItem
												with: [
													html anchor
														style: 'font-size: 1.5rem;';
														url: '/CTViz';
														with: 'Home'.
												].													
											html listItem
												with: [
													html anchor
														style: 'font-size: 1.5rem;';
														onClick: ( ( html jQuery ajax )
															script: [ :s |
																s << ( ( s jQuery id: 'summary-data-container' ) show ). 
															]
														);
														with: [ 
															html span
																style: 'border-bottom: 3px solid lightblue;';
																with: 'Summary'
														]
												].	
											html listItem
												with: [
													html anchor
														style: 'font-size: 1.5rem;';
														url: '';
														with: 'Analytics'
												].	
										].
								].
						].
				].
		].			