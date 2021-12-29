updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet
		url: 'https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css'.
	anHtmlRoot stylesheet
		url: 'https://fonts.googleapis.com/icon?family=Material+Icons'.	
	anHtmlRoot stylesheet
		url: 'https://fonts.googleapis.com/css?family=Catamaran'.
	anHtmlRoot stylesheet			
		url: 'https://fonts.googleapis.com/css?family=Lobster'.	
	anHtmlRoot stylesheet			
		url: 'https://fonts.googleapis.com/css?family=Kranky'.							
	anHtmlRoot javascript
		url: 'https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js'.
	anHtmlRoot javascript 
		url: '	https://use.fontawesome.com/e42a505129.js'.