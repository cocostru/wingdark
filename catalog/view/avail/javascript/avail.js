jQuery(document).ready(function(){

	$.ajax({
			url: 'index.php?route=extension/module/avail/getConfig', // получаем настройки 
			type: 'post',
			data: '',
			dataType: 'json',
			success:function(json){
			
				all_button_id = json.all_button_id; 	//кнопка купить на миниатюрах
				block_product = json.block_product;	// блок продукта на миниатюрах	
				button = json.button; // включен модуль
				avail_default = json.avail_default; // актывный шаблон базовый или нет
				text = json.text; // название кнопки
				button_avail_help = json.button_avail_help; // подсказка при наведении
				blok_in_productpage = json.avail_block_option_productpage; // блок данных по родукту страница товара
				button_cart_productpage	= json.avail_button_cart_productpage; // слас кнопки купить на странице товара
				avail_options_status = json.avail_options_status; // работать с опциями или без
				avail_button_other_productpage = json.avail_button_other_productpage; // дополнительная кнопка(например быстрый заказ)
				// если модуль включен
				if( button == '1' ) {
				
				// для всех кроме страницы товара
					if(avail_default == '1'){
					
						block_product = '.product-thumb';	// блок продукта на миниатюрах	
						
						$(block_product).each(function(){ // проходимо по всих товарах
							product_id = $(this).find('.aval-product-id').text();//получаем id товара
							quantity_avl =  $(this).find('.aval-product-quantity').text();//получаем количество товара
							
							$(this).find("button").first().after("<button  type='button'  title='"+ button_avail_help +"' target='#myModal' data-toggle='tooltip' data-product_id_avail='" + product_id + "' class='notify hidden'> <i class='fa fa-envelope'></i><span class='hidden-xs hidden-sm hidden-md'></i>"+text+"</span></button>");// добавляем кнопку уведомить
							$(this).find("button").first().addClass("cart-avail"+product_id); // добавляем класс для кнопки купить
										
							if(avail_button_other_productpage){
							
								$(this).find(avail_button_other_productpage).addClass("other-avail-prod"+product_id); // добавляем 
							}
							if(quantity_avl <= '0'){									
								$(".cart-avail"+product_id).addClass("hidden");//скрываем кнопку купить
								if(avail_button_other_productpage){
									$(".other-avail-prod"+product_id).addClass("hidden"); 
								}
								$(".notify[data-product_id_avail='" + product_id + "']").removeClass("hidden");	//отображаем кнопку уведомить
								
							}
						});
					} else {
					
						$(block_product).each(function(){ // проходимо по всих товарах	
							product_id = $(this).find('.aval-product-id').text();//получаем id товара
							quantity_avl =  $(this).find('.aval-product-quantity').text();//получаем количество товара
							
							$(this).find(all_button_id).before("<button  type='button'   title='"+ button_avail_help +"' target='#myModal' data-toggle='tooltip'  data-product_id_avail='" + product_id + "' class='notify hidden'> <i class='fa fa-envelope'></i>"+text+"</button>");// добавляем кнопку уведомить
							$(this).find(all_button_id).addClass("cart-avail"+product_id); // добавляем класс для кнопки купить
							
							if(avail_button_other_productpage){
								$(this).find(avail_button_other_productpage).addClass("other-avail-prod"+product_id); // добавляем 
							}	
							if(quantity_avl <= '0'){									
								$(".cart-avail"+product_id).addClass("hidden");//скрываем кнопку купить
								
								if(avail_button_other_productpage){
									$(".other-avail-prod"+product_id).addClass("hidden"); 
								}
								$(".notify[data-product_id_avail='" + product_id + "']").removeClass("hidden");	//отображаем кнопку уведомить
							}
						});	
					}
							
						//$("[data-hover='tooltip']").before().tooltip();	
						//$("[data-hover='tooltip']").hover(function(){
						// $('.tooltip').css('max-width','120px')
						
						//});
				}		
				
					// !!!!!!!!!!!!!!! 
					// product page
					$(button_cart_productpage).after("<button type='button' target='#myModal' data-toggle='modal' data-target='#edit-modal' class='notify_product btn btn-primary btn-lg hidden'>"+text+"</button>");
					
					// находим опции на товаре и создаем масив
										
					var mass = Array.prototype.slice.call($(blok_in_productpage + " input[type='radio'], " + blok_in_productpage + " input[type='checkbox']," + blok_in_productpage + " select"));
					
					// если есть опции и настройка работы по опциям включена и модуль включен
					if((mass.length !== 0) && (avail_options_status == '1') && (button == '1')) {
								
						var objoption = blok_in_productpage + ' input,'+blok_in_productpage + ' select,' + blok_in_productpage + ' img';
						
						
						$(objoption).on('change', function() {
							var options = $(blok_in_productpage + " input[type=\'hidden\'], " + blok_in_productpage + "  input[type=\'radio\']:checked, " + blok_in_productpage + " input[type=\'checkbox\']:checked, " + blok_in_productpage + " select," + blok_in_productpage + " img").serialize();
							console.log(options);
							$.ajax({
								url: 'index.php?route=extension/module/avail/getoptionsquantity',
								type: 'post',
								data: options
							})
							.success(function(response){	
							
								if (response == "false") {
									$(button_cart_productpage).addClass("hidden");
									if(avail_button_other_productpage){
										$(avail_button_other_productpage).addClass("hidden"); 
									}
									$(".notify_product").removeClass("hidden");
									
								} else {
									$(button_cart_productpage).removeClass("hidden");
									if(avail_button_other_productpage){
										$(avail_button_other_productpage).removeClass("hidden"); 
									}
									$(".notify_product").addClass("hidden");
									
								}
							})
							.error(function(response) {							
							});
						});
					} else if(button == '1'){
					 
						product_id = $('.aval-product-page-id').text();//получаем id товара
						quantity =  $('.aval-product-page-quantity').text();//получаем количество товара
						if(quantity <= 0){
							$(button_cart_productpage).addClass("hidden");
							if(avail_button_other_productpage){
								$(avail_button_other_productpage).addClass("hidden"); 
							}
							$(".notify_product").removeClass("hidden");	
						}
					}
				
			}
			
		
	});	
	
	
	//обработка опций и открытие мод. окна для товара
	$( document ).on( "click", ".notify_product", function(e) {
		$('.success, .warning, .attention, information, .error').remove();	
		//product_id = $('.aval-product-page-id').text();//получаем id товара	
		var data_avail = $(blok_in_productpage + " input[type=\'text\'], " +blok_in_productpage + " input[type=\'hidden\'], " +blok_in_productpage + "  input[type=\'radio\']:checked, " +blok_in_productpage + "  input[type=\'checkbox\']:checked, " +blok_in_productpage + "  select, " +blok_in_productpage + "  textarea, " +blok_in_productpage + "  img");
	    $.ajax({
			url: 'index.php?route=extension/module/avail/ValidOption',
			type: 'post',										
			data: data_avail,
			dataType: 'json',										
			success: function(json) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');

				if (json['error']) {
					$('#edit-modal').modal('hide');
					
					if (json['error']['option']) {												
						for (i in json['error']['option']) {
							var element = $('#input-option' + i.replace('_', '-'));
														
							if (element.parent().hasClass('input-group')) {
								element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
							} else {
								element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
							}
						}
					}
												
					if (json['error']['recurring']) {
						$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
					}
												
					// Highlight any found errors
					$('.text-danger').parent().addClass('has-error');
				}

				if (json['success']) {	
					var data_avail = $(blok_in_productpage + " input[type=\'hidden\'], " + blok_in_productpage + " input[type=\'radio\']:checked, " + blok_in_productpage + " input[type=\'checkbox\']:checked, " + blok_in_productpage + " select, " + blok_in_productpage + " img");
					$.ajax({
						cache: false,
						type: 'POST',
						url: 'index.php?route=extension/module/avail/openForm',
						data: data_avail,
						success: function(data){
							$('.modal-content').html(data);
						}
					});
					$('body').removeClass('modal-open');
					$("body").css({ 'padding-right' : ''});
				}											
			}
		});
	});
	
	
		//открытие модального окна для миниатюр
	$( document ).on( "click", ".notify", function(e) {
		$("#edit-modal").modal();		
		product_id_avail = $(this).data('product_id_avail'); 
		//language_id = $(this).data('language_id');
					
					 $.ajax({
							cache: false,
							type: 'POST',
							url: 'index.php?route=extension/module/avail/openForm',
							data: {product_id:product_id_avail},
							success: function(data){ 								 
								$('.modal-content').html(data);
							}
							});
							$('body').removeClass('modal-open');
							$("body").css({ 'padding-right' : ''});
	});
				
// Privat

 
 //обработка опций и открытие мод. окна для товара
	$( document ).on( "click", ".privat", function(e) {
		$('.success, .warning, .attention, information, .error').remove();	
		//product_id = $('.aval-product-page-id').text();//получаем id товара	
		var data_avail = $(blok_in_productpage + " input[type=\'text\'], " +blok_in_productpage + " input[type=\'hidden\'], " +blok_in_productpage + "  input[type=\'radio\']:checked, " +blok_in_productpage + "  input[type=\'checkbox\']:checked, " +blok_in_productpage + "  select, " +blok_in_productpage + "  textarea, " +blok_in_productpage + "  img");
	    $.ajax({
			url: 'index.php?route=extension/module/privat/ValidOption',
			type: 'post',										
			data: data_avail,
			dataType: 'json',										
			success: function(json) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');

				if (json['error']) {
					$('#edit-modal').modal('hide');
					
					if (json['error']['option']) {												
						for (i in json['error']['option']) {
							var element = $('#input-option' + i.replace('_', '-'));
														
							if (element.parent().hasClass('input-group')) {
								element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
							} else {
								element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
							}
						}
					}
												
					if (json['error']['recurring']) {
						$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
					}
												
					// Highlight any found errors
					$('.text-danger').parent().addClass('has-error');
				}

				if (json['success']) {	
					var data_avail = $(blok_in_productpage + " input[type=\'hidden\'], " + blok_in_productpage + " input[type=\'radio\']:checked, " + blok_in_productpage + " input[type=\'checkbox\']:checked, " + blok_in_productpage + " select, " + blok_in_productpage + " img");
					$.ajax({
						cache: false,
						type: 'POST',
						url: 'index.php?route=extension/module/privat/openForm',
						data: data_avail,
						success: function(data){
							$('.modal-content').html(data);
						}
					});
					$('body').removeClass('modal-open');
					$("body").css({ 'padding-right' : ''});
				}											
			}
		});
	});

 

});
