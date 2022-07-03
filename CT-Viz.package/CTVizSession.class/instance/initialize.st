initialization
initialize

	| dfData |

	super initialize.
	
	self dataframe: CTDataFrame new.
	self delimiter: $,.
	self factors: 'N'.
	
	Teapot stopAll.
	self teapot: ( Teapot configure: { #defaultOutput -> #json. #port -> 8088. #debugMode -> true } ).
	self teapot
		GET: '/jsondata' -> [ :req | #(1 2 3 4 5 6 7) ];
		GET: '/jsondata/<field>' -> [ :req | 
			dfData := ( self dataframe selectAllValuesForField: ( req at: #field ) ) resultset. 
			TeaResponse ok 
				headers: { 'Access-Control-Allow-Origin' -> 'http://localhost:8080' . 'Content-Type' -> 'application/json' }; 
				body: dfData asJson.
		];
		GET: '/factorsdata/<field>' -> [ :req | 
			( self dataframe dataset at: 1 ) at: ( req at: #field ) 
				ifPresent: [  
					dfData := ( ( self dataframe selectAll ) groupBy: ( req at: #field ) ).
					TeaResponse ok 		
						headers: { 'Access-Control-Allow-Origin' -> 'http://localhost:8080' . 'Content-Type' -> 'application/json' }; 
						body: ( ( dfData groupset keys asSet ) asJson, ',', #( 1 2 3 4 5 ) asJson ).
					]
				ifAbsent: [
					TeaResponse code: 400.
				].
		];
  		start.	