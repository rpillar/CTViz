rendering
renderFileSettingsFactorsContentOn: html

	html div 
		with: [					
			html paragraph 
				with: [  
					html label
						with: [  
							html radioButton
								id: 'factors-no';
								class: 'with-gap';
								attributeAt: 'name' put: 'factors';
								attributeAt: 'checked' put: ( ( ( self session factors ) = 'N' ) ifTrue: [ 'checked' ] );
								onClick: ( html jQuery ajax 
									script: [ :s | self session factors: 'N'.
										s << ( ( s jQuery id: 'factors-yes' ) removeAttribute: 'checked' ).
										s << ( ( s jQuery id: 'factors-no' ) attributeAt: 'checked' put: 'checked' ).
									]
								).
								html span
									style: 'font-size: 1.5rem; font-weight: 500;'; 
									with: 'No'.
						].
				].
			html paragraph 
				with: [  
					html label
						with: [  
							html radioButton
								id: 'factors-yes';
								class: 'with-gap';
								attributeAt: 'name' put: 'factors';
								attributeAt: 'checked' put: ( ( ( self session factors ) = 'Y' ) ifTrue: [ 'checked' ] );
								onClick: ( html jQuery ajax 
									script: [ :s | self session factors: 'Y'.
										s << ( ( s jQuery id: 'factors-no' ) removeAttribute: 'checked' ).
										s << ( ( s jQuery id: 'factors-yes' ) attributeAt: 'checked' put: 'checked' ).
									]
								).
								html span
									style: 'font-size: 1.5rem; font-weight: 500;'; 
									with: 'Yes'.
						].
				].
		 ].