rendering
scriptFormatFunction

	| jsn formatDataNumber formatDataString st1 st2 |
	"Provide a function to specify the format of the child rows. Because for differing applications the child rows will almost certainly be different this should just be taken
	 as an example. Returns a HTML template string."
	
	jsn := JSNamedFunction named: 'format'.
	jsn arguments: #(d).
	
	formatDataNumber := WAHtmlCanvas builder render: [ :html | 
		html table 
			class: 'cell-border';
			style: 'padding-left:100px;';
			attributeAt: 'cellpadding' put: '5';
			attributeAt: 'cellspacing' put: '0';
			attributeAt: 'border' put: '0';  
			with: [
				html tableRow
					style: 'background-color: #e0f2f1';
					with: [  
						html tableData 
							id: ( JSStream on: '${d.variable}Div' );
							style: 'height: 270px; padding: 0 0;background-color: #e0f2f1;'.
						html tableData 
							with:	( JSStream on: '${d.min}' ).
					]
				].
	].

	formatDataString := WAHtmlCanvas builder render: [ :html | 
		html table 
			class: 'cell-border';
			style: 'padding-left:100px;';
			attributeAt: 'cellpadding' put: '5';
			attributeAt: 'cellspacing' put: '0';
			attributeAt: 'border' put: '0';  
			with: [
				html tableRow
					style: 'background-color: #e0f2f1;';
					with: [
						html tableData
							id: ( JSStream on: '${sdiv}Div' );
							style: 'background-color: #e0f2f1;';
							attributeAt: 'colspan' put: 3.
						html tableData 
							style: 'background-color: #e0f2f1;';
							attributeAt: 'colspan' put: 2.
					]
				].
	].

	st1 := WriteStream on: String new. 
	st1 nextPutAll: 'return '; 
		nextPut: $`; 
		nextPutAll: formatDataNumber; 
		nextPut: $`.
	
	st2 := WriteStream on: String new. 
	st2 nextPutAll: 'var sdiv = d.variable.split('' '').join('''');';
		nextPutAll: 'return ';
		nextPut: $`; 
		nextPutAll: formatDataString; 
		nextPut: $`.
		
	jsn << ( JSStream on: st1 contents ) condition: ( JSStream on: 'd.type == ''Number''' ) else: ( JSStream on: st2 contents ).
	^ jsn asJavascript.