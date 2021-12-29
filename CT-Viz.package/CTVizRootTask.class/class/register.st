tools registry
register

	| app |

	app := WAAdmin register: self asApplicationAt: 'CTViz'.
	app
		addLibrary: JQDevelopmentLibrary;
		addLibrary: PlotlyOnlineLibrary;
		addLibrary: DataTableOnlineLibrary.