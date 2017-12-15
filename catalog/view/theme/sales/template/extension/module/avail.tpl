<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" type="text/css" href="catalog/view/avail/stylesheet/availability.css">
<script src="https://www.google.com/recaptcha/api.js" type="text/javascript"></script>
</head>
<body>

<form id="notify">
 
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Сообщить о наличии товара</h4>
                </div>
              
                   
               

  <div class="modal-body edit-content">

	
	<div class="row">
		<div class="col-lg-12">
			<div class="center <?php $hide_mobimg; echo ($avail_show_img == '1') ? "" : "hide-img" ?>">
				<img src="<?php echo $image_src; ?>" />
			</div>
		</div>
		<div class="col-lg-12">

			<div class="info-item price">
				<!--<label for="input-price" class="info-group"><?php echo $entry_price;?></label>-->
				<input class="info-group" type="text" name="price" id="input-price" value="<?php echo $price; ?>" >
				<p><?php echo $price; ?></p>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="info-item">
				
				<input class="info-group" type="text" name="product" id="input-product" value="<?php echo $product_name;?>" >
				<p><?php echo $product_name;?></p>
			</div>
			<div class="hidden">
				<label for="input-product-id"><?php echo $entry_product;?></label><br>
				<input type="text" name="product_id" id="input-product-id" value="<?php echo $product_id; ?>">
			</div>
			
			
			<?php
				if(isset($optionsNames)) {
					foreach ($optionsNames as $index => $value ) { ?>
						<div class="options">
							<label><?php echo $value['name'].' : '.$value['value_name']; ?>:</label>
							<input type="text" class="hidden" name="option_type[]" value="<?php echo $value['name']; ?>" ></input>
							<input type="text" class="hidden" name="option_name[]" value="<?php echo $value['value_name']; ?>" >
						</div>
				<?php	}
				}		
			?>
			
			<?php
				if(isset($optionsId)) {
					foreach ($optionsId as $index => $value ) { ?>
						<div class="hidden">
							<label><?php echo $value['option_id']; ?>:</label>
							<input type="text" name="option_id[]" value="<?php echo $value['option_value_id']; ?>">
							<input type="text" name="option_quantity[]" value="<?php echo $value['quantity']; ?>">
							<input type="text" name="product_option_value_id[]" value="<?php echo $value['product_option_value_id']; ?>">
						</div>
				<?php	}
				}		
			?>	
			<div class="hidden">
				<label for="input-admin-email"><?php echo $entry_admin_mail;?></label><br>
				<input type="text" name="admin_email" id="input-admin-email" value="<?php echo $admin_email;?>">
			</div>	
			
			
			
			
		
			
		</div>
		<div class="mail-block">
			<div class="left-mail-block">
				<div class="left">
					<label for="input-name">Ваше имя</label><br>
					<input type="text" name="name" id="input-name" value="<?php echo $first_name;?>">
				</div>
			</div>
			<div class="hidden">
				<input type="text" name="language_id" value="<?php echo $language_id; ?>">
			</div>
			<div class="left-mail-block hidden">								
					<input type="text" name="logged_id" id="input-id" value="<?php echo $logged_id;?>">				
			</div>
			<div class="right-mail-block">
				<div class="left">
					<label for="input-email">Ваш E-mail</label><br>
					<input type="text" name="email" id="input-email" value="<?php echo $mail;?>">
				</div>
			</div>
			<div class="comment-block <?php $hide_mobimg; echo ($avail_show_comment == '1') ? "" : "hidden" ?>">
				<div class="left">
					<label for="textarea-enquiry"><?php echo $entry_enquiry; ?></label><br>
					<textarea name="enquiry" rows="3" cols="50" id="textarea-enquiry"></textarea>
				</div>
			</div>
				<div class="left-block-bottom">	
					<?php if ($avail_config_google_captcha_status == '1') { ?>
					<div class="form-group hidden center">                        
                        <input type="text" name="captcha_status" class="form-control " value="<?php echo $avail_config_google_captcha_status; ?>">
                    </div>
                    <div id="capcha" class="form-group center">
                        <div class="g-recaptcha"  data-sitekey="<?php echo $avail_config_google_captcha_public; ?>"></div>
                    </div>
					<div class="form-group hidden center">                        
                        <input type="text" name="avail_config_google_captcha_public" class="form-control " value="<?php echo $avail_config_google_captcha_public; ?>">
                    </div>
					<div class="form-group hidden center">                        
                        <input type="text" name="avail_config_google_captcha_secret" class="form-control " value="<?php echo $avail_config_google_captcha_secret; ?>">
                    </div>					
                    <?php } ?>
				</div>
				
				
				
		</div>
	</div>
 </div>
                <div class="modal-footer">
				
                    <button type="submit" class="btn btn-block btn-full">Отправить</button>
                </div>
        
	
	
</form>
</body>
</html>
<script type="text/javascript">

	$("form").on("submit", function(e){
		e.preventDefault();		
		var form = $(this);
		var submitButton = form.find('input[type=submit]');
		submitButton.attr('disabled', 'disabled');
		var str = form.serialize();	
		
		$.ajax({
                    url : 'index.php?route=extension/module/avail/save',
                    type : 'POST',
					dataType: 'json',
                    data : str
		})
			.success(function(json) {
								
				if (json['success']) {
					$(".error").remove();
					submitButton.attr('disabled', 'disabled');
					var message = "<div class='mail-block success-block'>" + json['success'] + "</div>";	
					 $(".mail-block").replaceWith(message);
					 $(".modal-footer .btn-primary").addClass("hidden");
				//	$(".center").last().after(message);
				}				
				if (json['error_name']) {				
					$('input[name=name]').parent().find(".error").remove();
					submitButton.removeAttr('disabled');					
					$('input[name=name]').after("<div class='error'>" + json['error_name'] + "</div>");
				} else {
					$('input[name=name]').parent().find(".error").remove();
				}
				if (json['error_email']) {					
					$('input[name=email]').parent().find(".error").remove();
					submitButton.removeAttr('disabled');
					$('input[name=email]').after("<div class='error'>" + json['error_email'] + "</div>");
				} else {
					$('input[name=email]').parent().find(".error").remove();
				}
				if (json['error_product']) {					
					$('input[name=product]').parent().find(".error").remove();
					submitButton.removeAttr('disabled');
					$('input[name=product]').after("<div class='error'>" + json['error_product'] + "</div>");
				} else {
					$('input[name=product]').parent().find(".error").remove();
				}
				if (json['error_price']) {					
					$('input[name=price]').parent().find(".error").remove();
					submitButton.removeAttr('disabled');
					$('input[name=price]').after("<div class='error'>" + json['error_price'] + "</div>");
				} else {
					$('input[name=price]').parent().find(".error").remove();
				}
				if (json['error_captcha']) {					
					$('.g-recaptcha').parent().find(".error").remove();
					submitButton.removeAttr('disabled');
					$('.g-recaptcha').after("<div class='error'>" + json['error_captcha'] + "</div>");
				} else {
					$('.g-recaptcha').parent().find(".error").remove();
				}				
						
			})			
			.error(function(json){
					$(".error").remove();
					submitButton.attr('disabled', 'disabled');
					var message = "<div class='error'>" + json + "</div>";
					$(".center").last().after(message);
			});
	});
</script>