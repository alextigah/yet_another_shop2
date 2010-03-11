$(function(){

	$(".variants-list li").each(function(idx, element)
	{
		$(element).click(function(e)
		{
			var ul = $(e.target).parent().parent();
			if (ul)
			{
				var text = $("#" + ul.attr('rel'));
				text.attr('value', text.attr('value') + ( text.attr('value').length > 0 ? ", " : "") + $(e.target).text());				
			}
			return false;
		});
	});

});

