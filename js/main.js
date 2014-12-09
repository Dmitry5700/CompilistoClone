(function($){

	var array_tags = [],
	control_panel = $('#control_panel'),
	type = control_panel.find('#type'),
	title_task = control_panel.find('#title_task'),
	tags = control_panel.find('#tags'),
	description = control_panel.find('#description'),
	edit_button = control_panel.find('#edit_button');
	
	$.ajaxSetup( {
		cache: false
	});
	
	$.fn.Request_Data = function(){
	
		$.getJSON('data.json', function(data){

		type.val(data.type);
			title_task.val(data.title);
			
			$.map(data.tech, function(val, key){
				array_tags.push('<span class="tag">' + val + '</span>');
			});

			tags.html(array_tags);
			array_tags = []
			description.val(data.description);
		});
	};
	
	edit_button.on('click', function(){
		
		$.ajax({            
			url: 'file_writer.php',
			method: 'GET',
			data: {
				type : type.val(),
				title: title_task.val(),
				description: description.val(),
				request: 'update_json',
			},
			success: function() {
				$(this).Request_Data();	
			}
		 })
	});
	
	$(this).Request_Data();
	
})(jQuery);

