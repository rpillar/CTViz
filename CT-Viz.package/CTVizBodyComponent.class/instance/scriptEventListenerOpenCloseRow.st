rendering
scriptEventListenerOpenCloseRow

	"Return a fundtion - Add event listener for opening and closing details. Use in conjunction with the format function."
	
	| jq js jsCond1 jsCond2 jsFunction jsTrue jsFalse jsField jsPlot url |
	js := JSStream new.
	jq := JQueryClass new.
	
	url := 'http://localhost:8088/jsondata/' surroundedBy: '"'.

	jsCond1 := ( JSStream on: 'row.child.isShown()' ).
	jsTrue := ( JSStream on: 'row.child.hide()' ),
		( ( JSStream on: 'tr' ) call: 'removeClass'  with: 'shown' ).
	jsFalse := 
		( ( JSStream on: 'row' ) 
			call: 'child'  
			with: ( ( JSStream on: 'format' ) apply: { ( JSStream on: 'row' ) call: 'data' } ); 
			call: 'show' ), 
		( ( JSStream on: 'tr' ) call: 'addClass'  with: 'shown' ),
		( ( ( jq this next: 'td' ) text ) assignLocalTo: 'field' ).
	jsField := ( ( jq this next: 'td' ) text ).
	jsPlot :=
		( JSStream on: 'console.log(''field is : '', field)' ),
		( JSStream on: 'console.log(', url, ' + field)' ),
		( ( jq ajax ) type: 'GET'; url: ( JSStream on: url, ' + field' ); 
			onSuccess: ( ( JSStream on: 'displayPlot(data, field)' ) asFunction: #(data status) ) ).
	jsCond2 := ( JSStream on: 'typeof(field) === ''string''').
		
	js nextPutAll: ( ( ( jq this closest: 'tr' ) assignLocalTo: 'tr' ) asJavascript );
		nextPut: $;;
		nextPutAll: 'var row = table.row(tr)';
		nextPut: $;;
		nextPutAll: ( ( jsTrue condition: jsCond1 else: ( jsFalse, ( jsPlot condition: jsCond2 ) ) ) asJavascript );
		nextPut: $;.
	
	jsFunction := ( js contents ) asFunction: #().
	
	^ ( ( jq expression: 'tbody' ) call: 'on' with: 'click' with: 'td.details-control' with: jsFunction ).