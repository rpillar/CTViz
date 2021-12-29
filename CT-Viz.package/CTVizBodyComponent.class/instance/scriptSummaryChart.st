rendering
scriptSummaryChart

	| chart config div jq jsn layout s1 t1 |

	jq := JQueryClass new.
	
	jsn := JSNamedFunction named: 'displayPlot'.
	jsn return: true.
	jsn arguments: #(data field).
	
	div := ( JSStream on: 'field + ''Div''' ).
	"div := 'plotDiv'."
	
	t1 := PlotlyTrace new.
	t1 x: ( JSStream on: '$.parseJSON(data)' ).
	t1 type: 'histogram'.
	t1 opacity: 0.5.
	t1 name: 'mpg'.
	t1 histnorm: 'density'.
	
	layout := PlotlyLayout new.
	layout title: ( JSStream on: 'field' ).
	layout bargap: 0.05.
		
	config := PlotlyConfig new.
	config displayModeBar: false.
	
	chart := PlotlyPlot new.
	chart newplot.
	chart complete: div data: { t1 } layout: layout config: config.

	s1 := WriteStream on: String new.
	s1 nextPutAll: chart asJavascript.
	jsn << ( JSStream on: s1 contents ).

	^ jsn.