rendering
renderFileSettingsDelimiterContentOn: html

	html div 
		with: [					
			html paragraph 
				with: [  
					html label
						with: [  
							html radioButton
								id: 'delimiter-comma';
								class: 'with-gap';
								attributeAt: 'name' put: 'delimiter';
								attributeAt: 'checked' put: ( ( ( self session delimiter ) = $, ) ifTrue: [ 'checked' ] );
								onClick: ( html jQuery ajax 
									script: [ :s | self session delimiter: $,.
										s << ( ( s jQuery id: 'delimter-semi-colon' ) removeAttribute: 'checked' ).
										s << ( ( s jQuery id: 'delimter-colon' ) removeAttribute: 'checked' ).
										s << ( ( s jQuery id: 'delimiter-comma' ) attributeAt: 'checked' put: 'checked' ).
									]
								).
								html span
									style: 'font-size: 1.5rem; font-weight: 500;'; 
									with: ', - comma'.
						].
				].
			html paragraph 
				with: [  
					html label
						with: [  
							html radioButton
								id: 'delimiter-semi-colon';
								class: 'with-gap';
								attributeAt: 'name' put: 'delimiter';
								attributeAt: 'checked' put: ( ( ( self session delimiter ) = $; ) ifTrue: [ 'checked' ] );
								onClick: ( html jQuery ajax 
									script: [ :s | self session delimiter: $;.
										s << ( ( s jQuery id: 'delimter-comma' ) removeAttribute: 'checked' ).
										s << ( ( s jQuery id: 'delimter-coon' ) removeAttribute: 'checked' ).
										s << ( ( s jQuery id: 'delimiter-semi-colon' ) attributeAt: 'checked' put: 'checked' ).
									]
								).
								html span
									style: 'font-size: 1.5rem; font-weight: 500;'; 
									with: '; - semi-colon'.
						].
				].
			html paragraph 
				with: [  
					html label
						with: [  
							html radioButton
								id: 'delimiter-colon';
								class: 'with-gap';
								attributeAt: 'name' put: 'delimiter';
								attributeAt: 'checked' put: ( ( ( self session delimiter ) = $: ) ifTrue: [ 'checked' ] );
								onClick: ( html jQuery ajax 
									script: [ :s | self session delimiter: $:.
										s << ( ( s jQuery id: 'delimter-semi-colon' ) removeAttribute: 'checked' ).
										s << ( ( s jQuery id: 'delimter-colon' ) removeAttribute: 'checked' ).
										s << ( ( s jQuery id: 'delimiter-colon' ) attributeAt: 'checked' put: 'checked' ).
									]
								).
								html span
									style: 'font-size: 1.5rem; font-weight: 500;'; 
									with: ': - colon'.
						].
				].
		 ].