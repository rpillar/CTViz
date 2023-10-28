rendering
renderAnalyticsOn: html

	"home - Analytics page"	
	html div
		with: [  
			html div 
				class: 'container analytics-page';
				style: 'margin-top: 70px';
				with: [  
					html paragraph 
						style: 'font-size: 2rem; font-weight:300;';
						with: 'Analyse your dataset -.'
				].
		].
