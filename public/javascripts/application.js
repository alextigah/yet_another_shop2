$(function(){



});


function set_no_border_for_last_list_in_similar_items()
{
	
	var items = $("#similar-items li");
	$(items[items.length-1]).addClass("no-border");
	
}