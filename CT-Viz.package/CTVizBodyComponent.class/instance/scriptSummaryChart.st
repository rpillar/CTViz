script
scriptSummaryChart

	| chart config div jq jsn layout s1 t1 |

	jq := JQueryClass new.
	
	jsn := JSNamedFunction named: 'displayPlot'.
	jsn return: true.
	jsn arguments: #(data field).
	
	div := ( JSStream on: 'field + ''Div''' ).
	
	t1 := PlotlyTrace new.
	t1 x: ( JSStream on: '$.parseJSON(data)' ).
	t1 type: 'histogram'.
	t1 histfunc: 'count'.
	t1 marker color: 'rgba(127, 96, 0, 0.5)'.
	t1 opacity: 0.5.
	
	layout := PlotlyLayout new.
	layout title text: ( JSStream on: 'field' ).
	layout title font size: 22.
	layout bargap: 0.05.
	layout paper_bgcolor: '#e0f2f1'.
	layout plot_bgcolor: '#e0f2f1'.
	layout yaxis showline: false; showticklabels: false; ticks: ''.
		
	config := PlotlyConfig new.
	config displayModeBar: false.
	
	chart := PlotlyPlot new.
	chart newplot.
	chart complete: div data: { t1 } layout: layout config: config.

	s1 := WriteStream on: String new.
	s1 nextPutAll: chart asJavascript.
	jsn << ( JSStream on: s1 contents ).

	^ jsn.