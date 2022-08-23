script
scriptSummaryRangeChart

	| chart config div jq jsn layout s1 t1 |

	jq := JQueryClass new.
	
	jsn := JSNamedFunction named: 'displayRangePlot'.
	jsn return: true.
	jsn arguments: #(data field).
	
	div := ( JSStream on: 'field + ''RangeDataGraph''' ).
	
	t1 := PlotlyTrace new.
	t1 x: ( JSStream on: '$.parseJSON(data)' ).
	t1 type: 'box'.
	t1 boxmean: true.
	t1 marker color: '#FF851B'.
	t1 opacity: 0.5.
	
	layout := PlotlyLayout new.
	layout margin l: 0; r: 0; b: 0; t:0.
	layout xaxis showline: false.
	layout paper_bgcolor: '#e0f2f1'.
	layout plot_bgcolor: '#e0f2f1'.
		
	config := PlotlyConfig new.
	config displayModeBar: false.
	
	chart := PlotlyPlot new.
	chart newplot.
	chart complete: div data: { t1 } layout: layout config: config.

	s1 := WriteStream on: String new.
	s1 nextPutAll: chart asJavascript.
	jsn << ( JSStream on: s1 contents ).

	^ jsn.