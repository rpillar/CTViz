rendering
renderLoadDatasetFormOn: html

	| fileSettingsComponent validateMessage |
	
	fileSettingsComponent := CTVizBodyFileSettingsComponent new.
	
	html div 
		class: 'col s12 messageComponent';
		with: [
			html render: self messageComponent.
		].
	html form 
		multipart;
		class: 'form form-horizontal';
		with: [
			html div 
				class: 'row col s12';
				with: [ 
					html div 
						class: 'col s8';
						style: 'margin-left:20px;';
						with: [
							html textInput
								class: 'dataset-file';
								style: 'border: 4px solid lightblue; padding: 5px 10px; font-size:1.8rem;text-decoration:none;';
								attributeAt: 'length' put: 65;
								attributeAt: 'placeholder' put: 'Dataset';
								callback: [ :value | self fileName: value ].
						].
					html anchor 
						class: 'settings tooltipped modal-trigger';
						style: 'text-decoration: none;cursor:pointer;margin-left:30px;';
						attributeAt: 'data-position' put: 'right';
						attributeAt: 'data-delay' put: '50';
						attributeAt: 'data-tooltip' put: 'Settings'; 
						url: '#settings-modal';
						script: (
    						( html jQuery this )
      						on: 'click'
      						do: ( (
								( ( html jQuery id: 'settings-modal' ) load html: [ :r | r render: fileSettingsComponent ] )				
      						) asFunction: #(event) )
  						);	
						with: [
							html italic 
								class: 'material-icons';
								style: 'font-size:4rem;color:gray;';
								with: 'settings'  
						]. 
				].
								
			html div 
				class: 'col s12';
				with: [  
					html div
						class: 'col s4';
						style: 'margin-left:20px;margin-top:25px;margin-bottom:20px;padding:5px 10px;';
						with: [ 
							html button 
								bePush;
								id: 'load-file';
								class: 'btn-large waves-effect waves-light hoverable'; 
								style: 'height: 60px;';
								onClick: ( ( html jQuery ajax )
									serializeForm;
									script: [ :s |
										validateMessage := self validateFile.
										( validateMessage = '' ) ifTrue: [  
											s << ( ( s jQuery id: 'load-file' ) attributeAt: 'disabled' put: 'disabled' ).
											s << ( ( s jQuery class: 'load-file-button' ) text: 'File Loading' ).
											s << ( ( s jQuery class: 'progress' ) show ).
											s << ( ( s jQuery id: 'ctviz-body' ) load html: [ :r | self renderPageComponentOn: r ] ).
											s << ( ( s jQuery class: 'active-navbar' ) show ).
										]
										ifFalse: [  
											self messageComponent errorMessage: validateMessage.
											s << ( ( s jQuery class: 'messageComponent' ) load html: [ :r | r render: self messageComponent ] ).
										].
									]
								);
								with: [ 
									html div 
										class: 'load-file-button';
										with: 'Load File'.
								].
							
							html div
								class: 'progress';
								style: 'display: none; width: 155px;';
								with: [  
									html div
										class: 'indeterminate'
								].
										
						].
				].
			
		]. 
	
	html document addLoadScript: ( ( JSStream on: '$(''#file-input'').on(''change'', function(e) { let fileName = e.target.files[0].name; $(''.dataset-file'').val(fileName); $(''#load-file'').removeAttr(''disabled''); } )' ) ).
	html document addLoadScript: ( ( JSStream on: '$(''.tooltipped'').tooltip()' ) ).