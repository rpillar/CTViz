rendering
renderContentOn: html 

	html div 
		id: 'nav-bar';
		with: self navbarComponent.
		
	"home - initial index page"	
	html div 
		with: [ 			
			html div 
				id: 'main';
				class: 'row';
				with: [ 
					html render: self bodyComponent.  
				].
		].