script
scriptEventListenerOpenCloseRow

	"Return a function - Add event listener for opening and closing details. Use in conjunction with the format function."
	
	| jq js jsCondIsShown jsFunction jsCondIsShownTrue jsCondIsShownFalse jsField jsPlot urlf urlj |
	js := JSStream new.
	jq := JQueryClass new.
	
	urlj := 'http://localhost:8088/jsondata/' surroundedBy: '"'.
	urlf := 'http://localhost:8088/factorsdata/' surroundedBy: '"'.
	
	jsCondIsShown := ( JSStream on: 'row.child.isShown()' ).
	jsCondIsShownTrue := ( JSStream on: 'row.child.hide()' ),
		( ( JSStream on: 'tr' ) call: 'removeClass'  with: 'shown' ).
	jsCondIsShownFalse := 
		( ( JSStream on: 'row' ) 
			call: 'child'  
			with: ( ( JSStream on: 'format' ) apply: { ( JSStream on: 'row' ) call: 'data' } ); 
			call: 'show' ), 
		( ( JSStream on: 'tr' ) call: 'addClass'  with: 'shown' ),
		( ( ( jq this next: 'td' ) text ) assignLocalTo: 'field' ).
	jsField := ( ( jq this next: 'td' ) text ).

	jsPlot :=
		( ( jq ajax ) type: 'GET'; url: ( JSStream on: urlj, ' + field' ); 
			onSuccess: ( ( 
				( JSStream on: 'displayPlot(data, field); displayRangePlot(data, field)' )
					condition: ( JSStream on: 'typeof( $.parseJSON(data)[0] ) == ''number''' ) 
					else: ( 
						( JSStream on: 'displaySummary(data, field)' )
					)
				) asFunction: #(data status) ) ).
		
	js nextPutAll: ( ( ( jq this closest: 'tr' ) assignLocalTo: 'tr' ) asJavascript );
		nextPut: $;;
		nextPutAll: 'var row = table.row(tr)';
		nextPut: $;;
		nextPutAll: ( ( jsCondIsShownTrue condition: jsCondIsShown else: ( jsCondIsShownFalse, jsPlot ) ) asJavascript );
		nextPut: $;.
	
	jsFunction := ( js contents ) asFunction: #().
	
	^ ( ( jq expression: 'tbody' ) call: 'on' with: 'click' with: 'td.details-control' with: jsFunction ).