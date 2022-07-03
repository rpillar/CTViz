rendering
scriptSummaryString

	| formatDataString jq jsn st1 |

	jq := JQueryClass new.
	
	jsn := JSNamedFunction named: 'displaySummary'.
	jsn arguments: #(data field).
	
	formatDataString := WAHtmlCanvas builder render: [ :html | 
		html table 
			style: 'padding-left:100px;background-color: #e0f2f1;';
			class: 'cell-border';
			attributeAt: 'cellpadding' put: '3';
			attributeAt: 'cellspacing' put: '0';
			attributeAt: 'border' put: '0'; 
			with: [
				html tableRow 
					style: 'background-color: #e0f2f1;';
					with: [
						html tableData 
							style: 'background-color: #e0f2f1;';
							with: 'Number of Unique Values :'.
						html tableData 
							style: 'background-color: #e0f2f1;';
							with: ( JSStream on: '${l}' ).
					].
				html tableRow
					style: 'background-color: #e0f2f1;';
					with: [  
						html tableData 
							style: 'background-color: #e0f2f1;';
							with: 'Values :'.
						html tableData 
							style: 'background-color: #e0f2f1;';
							with: ( JSStream on: '${stringValues}' ).
					].
				( self session factors = 'Y' ) ifTrue: [  
					html tableRow
						style: 'background-color: #e0f2f1;';
						with: [  
							html tableData 
								id: ( JSStream on: '${d.variable}FactorsDiv' );
								style: 'background-color: #e0f2f1;'.
						].
				].
			]
		].
	
	st1 := WriteStream on: String new. 
	st1 nextPutAll: 'let a = $.parseJSON(data); let s = new Set( a ); let l = s.size; let fd = field.split('' '').join('''');';
		nextPutAll: 'let array = Array.from(s); array.sort(); let first = array[0]; let last = array[array.length-1]; let stringValues = first + ''  ...  '' + last;';
		nextPutAll: '$(''#'' + fd + ''Div'').append('; 
		nextPut: $`; 
		nextPutAll: formatDataString; 
		nextPut: $`;
		nextPut: $);
		nextPut: $;.
		
	jsn << ( JSStream on: st1 contents ).
	^ jsn.