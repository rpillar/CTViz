rendering
scriptFactorsChart

	| chart config div jq jsn layout s1 t1 |

	jq := JQueryClass new.
	
	jsn := JSNamedFunction named: 'displayFactorsPlot'.
	jsn return: true.
	jsn arguments: #(d1 d2 field).
	
	div := ( JSStream on: 'field + ''FactorsDiv''' ).
	
	t1 := PlotlyTrace new.
	t1 x: ( JSStream on: '$.parseJSON(da1)' ).
	t1 type: 'bar'.
	t1 x: ( JSStream on: '$.parseJSON(d1)' ).
	t1 y: ( JSStream on: '$.parseJSON(d2)' ).
	
	layout := PlotlyLayout new.
	layout title text: ( JSStream on: 'field' ).
	layout title font size: 22.
	layout bargap: 0.05.
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