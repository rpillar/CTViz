initialization
initialize 
	
	super initialize.

	self messageComponent:  CTVizMessageComponent new.
	self summaryComponent: CTVizBodySummaryComponent new.
	self analyticsComponent: CTVizBodyAnalyticsComponent new.