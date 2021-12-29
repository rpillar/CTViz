rendering
scriptFormatFunction

	| jsn formatData st2 |
	"Provide a function to specify the format of the child rows. Because for differing applications the child rows will almost certainly be different this should just be taken
	 as an example. Returns a HTML template string."
	
	jsn := JSNamedFunction named: 'format'.
	jsn return: true.
	jsn arguments: #(d).
	
	formatData := WAHtmlCanvas builder render: [ :html | 
		html table 
			style: 'padding-left:100px;';
			attributeAt: 'cellpadding' put: '5';
			attributeAt: 'cellspacing' put: '0';
			attributeAt: 'border' put: '0';  
			with: [
				html tableRow
					style: 'background-color: #f5f5f5';
					with: [  
						html tableData 
							id: ( JSStream on: '${d.variable}Div' );
							style: 'height: 270px;border: 2px solid lightblue; padding: 0 0;'.
						html tableData 
							with:	( JSStream on: '${d.max}' ).
					].
				].
	].

	st2 := WriteStream on: String new. 
	st2 nextPut: $`; nextPutAll: formatData; nextPut: $`.
	
	jsn << ( JSStream on: st2 contents ).
	^ jsn asJavascript.