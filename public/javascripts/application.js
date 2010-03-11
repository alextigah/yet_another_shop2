$(function(){



});




var FilterMaker = {
	params: {},

	parseQuery: function(qs) 
	{
	    qs = qs.split("+").join(" ");
	    var params = {};
	    var tokens;

	    while (tokens = /[?&]?([^=]+)=([^&]*)/g.exec(qs)) {
	        params[decodeURIComponent(tokens[1])]
	            = decodeURIComponent(tokens[2]);
	    }

	    return params;
	}	
	
	
};

