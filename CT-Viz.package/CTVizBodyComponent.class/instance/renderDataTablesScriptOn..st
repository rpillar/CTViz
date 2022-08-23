rendering
renderDataTablesScriptOn: html

	| c1 c2 colNames cols data dataStats dataSummary dt dto dts dtu evt f fmt g jq plt ptr sc x1 |
	
	"summary data from the dataframe"
	dataSummary := self dataframe summarize.
	
	"create the DataTables data array"
	data := OrderedCollection new.
	dataSummary keysDo: [ :k | 
		dataStats := ( dataSummary at: k ).
		dataStats at: #variable put: k.
		data add: dataStats.
	].
	
	c1 := DataTablesColumns new.
	c1 className: 'details-control'; orderable: false; data: nil; defaultContent: ''.
	
	colNames := #('variable' 'type' 'min' 'max' 'mean').
	cols := colNames collect: [ :cName | 
		c2 := DataTablesColumns new. 
		c2 data: cName.
	].

	"create our DataTablesObject - data (as JSON data) / columns etc ...."
	dto := DataTablesObject new.
	dto data: data; columns: ( { c1 }, cols ); autoWidth: false. 

	"the call to DataTables - set id / class of the table"
	dt := DataTable new.
	x1 := ( ( dt datatable: '#summary-table' with: dto ) assignLocalTo: 'table' ) asFunction: #().

	"setup Child Rows"
	dtu := DataTablesUtils new.
	fmt := self scriptFormatFunction.
	evt := self scriptEventListenerOpenCloseRow.
	plt := self scriptSummaryChart.
	ptr := self scriptSummaryRangeChart.
	dts := self scriptSummaryString.
	"fcts := self scriptFactorsChart."
	
	"document.ready ...."
	f := ( x1, evt, plt, ptr, dts ).

	jq := JQueryClass new.
	g := ( jq document call: 'ready' with: f ) asJavascript.

	sc := html script: (fmt, g).
	
	^ sc.