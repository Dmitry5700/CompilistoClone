(function($){

	var array_tags = [],
	control_panel = $('#control_panel'),
	drop_down_list_wrapper = control_panel.find('.drop_down_list_wrapper'),
	type = control_panel.find('#type'),
	title_task = control_panel.find('#title_task'),
	tags = control_panel.find('#tags'),
	tech_tags = control_panel.find('#tech_tags'),
	description = control_panel.find('#description'),
	range =  control_panel.find('.range'),
	range_val_block = range.next(),
	edit_button = control_panel.find('#edit_button'),
	
	alert = control_panel.siblings('#alert');
	
	$.ajaxSetup( {
		cache: false
	});
	
	$.fn.Request_Data = function(){
	
		$.getJSON('data.json', function(data){

			type.text(data.type);
			title_task.val(data.title);
			
			$.map(data.tags, function(val, key){
				array_tags.push('<span class="tag">' + val + '</span>');
			});

			tags.html(array_tags);
			array_tags = []
			
			$.map(data.tech, function(val, key){
				array_tags.push('<span class="tag">' + val + '</span>');
			});

			tech_tags.html(array_tags);
			array_tags = []

			description.val(data.description);
			range.val(data.experience);
			range_val_block.text(data.experience);
		});
	};
	
	range.on('change', function(){
		var value = this.value;
		range_val_block.text(value);
	});
	
	edit_button.on('click', function(){
		
		$.ajax({            
			url: 'file_writer.php',
			method: 'GET',
			data: {
				type : type.text(),
				title: title_task.val(),
				description: description.val(),
				experience: range.val(),
				request: 'update_json'
			},
			success: function() {
				$(this).Request_Data();
				
				
				alert.addClass('elastic animated ').text("Данные измененны");
				
				setTimeout(function(){
					alert.removeClass('elastic animated ').text("");
				},2000)
			}
		 })
	});
	
	$(this).Request_Data();
	
	drop_down_list_wrapper.on('click', function(){
	
		var selected = $(this).find('.selected'),
		list = $(this).find('.drop_down_list');
		
		$(this).Open_list(selected, list);
	});
	
	drop_down_list_wrapper.on('click', '.drop_down_list_link', function(){
	
		var value = $(this).text(),
		list = $(this).parents('.drop_down_list').siblings('.selected');
		
		list.text(value);
	});
	
	$.fn.Open_list = function(selected,  list){

		if(selected.hasClass('checked')){
			selected.removeClass('checked');
			list.hide();
		}
		else{
			selected.addClass('checked');
			list.show();
		}
	};
	
})(jQuery);

