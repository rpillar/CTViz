initialization
initialize

	| dfData |

	super initialize.
	
	self dataframe: CTDataFrame new.
	
	Teapot stopAll.
	self teapot: ( Teapot configure: { #defaultOutput -> #json. #port -> 8088. #debugMode -> true } ).
	self teapot
		GET: '/jsondata' -> [ :req | #(1 2 3 4 5 6 7) ];
		GET: '/jsondata/<field>' -> [ :req | 
			dfData := ''.
			( ( ( self dataframe metaData ) at: ( req at: #field asSymbol ) ) ) = 'Number' ifTrue: [  
				dfData := ( self dataframe selectAllValuesForField: ( req at: #field ) ) resultset asJson.
			].
			TeaResponse ok 
				headers: { 'Access-Control-Allow-Origin' -> 'http://localhost:8080' }; 
				body: dfData ];
    	start.	