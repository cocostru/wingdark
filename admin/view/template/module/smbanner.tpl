<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-smbanner" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>          
          <div class="panel-heading" style="width: 100%;">
				<h4 class="panel-title"><i class="fa fa-pencil"></i><?php echo $text_contact_content;?></h4>
			  </div>
			  
				<table id="custom-field-value1" class="smBanner-table table table-striped table-bordered table-hover" style="width: 100%;">
					<thead>
					  <tr>
						<td class="text-left required"><?php echo $entry_image; ?></td>
						<td class="text-right"><?php echo $entry_width; ?></td>
						<td class="text-right link-title"><?php echo $entry_value; ?></td>
						<td class="text-right"><?php echo $entry_sort_order; ?></td>
						<td></td>
					  </tr>
					</thead>
					<tbody>
					  <?php $header_field_value_row = 0; ?>
					  
					  
					  
					 
					  
					  <?php foreach ($smbanner_info as $smbanner_info) { ?>
					  
					 
					  
						<tr id="SMheader-field-value-row<?php echo $header_field_value_row; ?>">
							<td class="text-left cell-with-bunner-content" style="width: 50%;">
								<div class="set-bunner-content-buttons">
									
											<input type="radio" name="smbanner_info[<?php echo $header_field_value_row; ?>][select_content]" value="image" <?php echo ($smbanner_info['select_content'] =='image')?'checked':'';?>><span>image</span>
											<input type="radio" name="smbanner_info[<?php echo $header_field_value_row; ?>][select_content]" value="textarea"<?php echo ($smbanner_info['select_content'] !=='image')?'checked':'';?>><span>text</span>
										
								</div>
							  <?php foreach ($languages as $language) { ?>
									<?php if (!empty($error_image[$header_field_value_row][$language['language_id']])) { ?>
								  <div class="text-danger"><?php echo $error_image[$header_field_value_row][$language['language_id']]['error_text']; ?></div>
								  <?php } ?>
								  <div class="input-group">
									<?php if ($smbanner_info['select_content'] !== 'textarea') {?>
									
									<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
									
									<a href="" id="thumb-image<?php echo $header_field_value_row;?>-<?php echo $language['language_id']; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo isset($smbanner_info['header_page_top_description'][$language['language_id']]['thumb']) ? $smbanner_info['header_page_top_description'][$language['language_id']]['thumb'] : $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
								 
									<input id="input-image<?php echo $header_field_value_row;?>-<?php echo $language['language_id']; ?>" type="hidden" name="smbanner_info[<?php echo $header_field_value_row; ?>][header_page_top_description][<?php echo $language['language_id']; ?>][image]" value="<?php echo isset($smbanner_info['header_page_top_description'][$language['language_id']]) ? $smbanner_info['header_page_top_description'][$language['language_id']]['image'] : $placeholder; ?>" placeholder="<?php echo $entry_image; ?>" class="form-control" />
									<?php } else {?>

									<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
									<textarea name="smbanner_info[<?php echo $header_field_value_row; ?>][header_page_top_description][<?php echo $language['language_id']; ?>][image]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $header_field_value_row.''.$language['language_id'];?>" class="form-control"><?php echo isset($smbanner_info['header_page_top_description'][$language['language_id']]) ? $smbanner_info['header_page_top_description'][$language['language_id']]['image'] : $placeholder; ?></textarea>
									<?php } ?>
								  </div>
								 
									
								  <?php if (isset($error_custom_field_value[$header_field_value_row][$language['language_id']])) { ?>
									<div class="text-danger"><?php echo $error_custom_field_value[$header_field_value_row][$language['language_id']]; ?></div>
								  <?php } ?>
							  <?php } ?>
							</td>
							
						<td class="text-right">
							<select name="smbanner_info[<?php echo $header_field_value_row; ?>][width]" id="input-status" class="form-control">
								<?php if ($smbanner_info['width']) { ?>
									<option value="<?php echo $smbanner_info['width']; ?>" selected="selected">--<?php echo !empty($smbanner_info['text_width_select'])?$smbanner_info['text_width_select']:$width_full; ?>--</option>
									<option value="col-lg-12"><?php echo $width_full; ?></option>
									<option value="col-lg-6"><?php echo $width_1_2; ?></option>
									<option value="col-lg-4"><?php echo $width_1_3; ?></option>
									<option value="col-lg-3"><?php echo $width_1_4; ?></option>
								<?php } else { ?>
									<!--<option value="<?php echo $smbanner_info['width']; ?>">--<?php echo $text_edit; ?>--</option>-->
									<option value="col-lg-12"><?php echo $width_full; ?></option>
									<option value="col-lg-6"><?php echo $width_1_2; ?></option>
									<option value="col-lg-4"><?php echo $width_1_3; ?></option>
									<option value="col-lg-3"><?php echo $width_1_4; ?></option>
								<?php } ?>
							</select>
							<?php if (isset($error_value[$header_field_value_row])) { ?>
								<div class="text-danger"><?php echo $error_value[$header_field_value_row]; ?></div>
							<?php } ?>
						</td>	
						<td class="text-right">
							<input type="text" name="smbanner_info[<?php echo $header_field_value_row; ?>][url]" value="<?php echo $smbanner_info['url']; ?>" placeholder="<?php echo $entry_value2; ?>" class="form-control" <?php echo ($smbanner_info['select_content'] !== 'textarea') ? '' : 'readonly=readonly'; ?> />
							
							<?php if (isset($error_value[$header_field_value_row])) { ?>
								<div class="text-danger"><?php echo $error_value[$header_field_value_row]; ?></div>
							<?php } ?>
						</td>
						
						<td class="text-right" style="width: 10%;">
							<input type="text" name="smbanner_info[<?php echo $header_field_value_row; ?>][sort_order]" value="<?php echo $smbanner_info['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" />
						</td>
						<td class="text-left" style="width: 10%;">
							<button onclick="$('#SMheader-field-value-row<?php echo $header_field_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
						</td>
					  </tr>
					  <?php $header_field_value_row++; ?>
					  <?php } ?>
					</tbody>
					<tfoot>
					  <tr>
						<td colspan="4"></td>
						<td class="text-left"><button type="button" onclick="addCustomFieldValue1();" data-toggle="tooltip" title="<?php echo $button_custom_field_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
					  </tr>
					</tfoot>
			  </table>	
			  
         
         <button id="preview">Preview <i class="fa fa-power-off"></i></button>
     
		 <div class='preview-container row'></div>
		 
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  
  
<script>
	$(document).ready(function(){
		
		var valuesMass, imagesSrc, imagesQuantity, previewContainer = $(".preview-container"), contentHTML, siteAddress = document.location.origin;
		
		function previewBanner(){
			valuesMass = Array.prototype.slice.call($("select.form-control:not([name='status'])")).map(function(elem){return $(elem).val()});
			imagesSrc = Array.prototype.slice.call($(".img-thumbnail + input")).map(function(img){return siteAddress + "/image/" + $(img).val()});
			imagesQuantity = imagesSrc.length;
			
			for(let i = 0; i < imagesQuantity; i += 1){
				contentHTML += "<div class='preview-item "+valuesMass[i]+"'><img style='margin:0 auto' class='img-responsive' src="+imagesSrc[i]+"></div>";
			};
			
			previewContainer.html(contentHTML);
			contentHTML = "";
		};
		
		previewBanner();
		
		$("button#preview").click(function(){
			
			event.preventDefault();
			
			previewContainer.slideToggle("slow");
			
			if(previewContainer.height()< 100 ){
				previewBanner();
			}
			
		});
		
	});
</script>
  
  
  <script type="text/javascript">
  
  /*****************************************************************************************************************/
  
  
  
  	function setBunnerContent(){
			var setContentButtons = $(".set-bunner-content-buttons input[type='radio']");
			var rowsArray = Array.prototype.slice.call($(".smBanner-table > tbody > tr"));
			var imagesArray = rowsArray.map(function(elem){ // массив с адресами картинок
				var row = [];
				row.push(Array.prototype.slice.call($(elem).find(".img-thumbnail img")).map(function(img){
					return $(img).attr("src");
				}));
				return row;
			});
			
			var imagesValArray = rowsArray.map(function(elem){ //массив со значениями скрытых инпутов
				var row = [];
				row.push(Array.prototype.slice.call($(elem).find("input[type='hidden']")).map(function(val){
					return $(val).attr("value");
				}));
				return row;
			});
			
			var videosArray = rowsArray.map(function(elem){ // массив с iframe
				var row = [];
				row.push(Array.prototype.slice.call($(elem).find("div.note-editor .note-editable")).map(function(elem){
					return $(elem).html();
				}));
				return row;
			});
			
			setContentButtons.change(function(){
				var self = $(this);
				var rowsArray =  Array.prototype.slice.call($(".smBanner-table > tbody > tr"));
				var rowsIdArray =  Array.prototype.slice.call($(".smBanner-table > tbody > tr")).map(function(elem){return $(elem).attr("id").match(/\d+/)[0]});
				
				if(self.val() === "textarea" && $(this).prop("checked")){
					imagesArray = rowsArray.map(function(elem){ // массив с адресами картинок
					var row = [];
					
						setTimeout(()=>{row.push(Array.prototype.slice.call($(elem).find(".img-thumbnail img")).map(function(img){
							return $(img).attr("src");
						}))},10);
					
					return row;
					});
				};
				
				if(self.val() === "image" && $(this).prop("checked")){
					videosArray = rowsArray.map(function(elem){ // массив с iframe
						var row = [];
						setTimeout(()=>{row.push(Array.prototype.slice.call($(elem).find("div.note-editor .note-editable")).map(function(elem){
							return $(elem).html();
						}))},10);
						return row;
					});
				};

				var rowId = self.closest("tr").attr("id").match(/\d+/)[0];	// id ряда в котором выполняется изменение				
				
				if(self.val() === "image" && $(this).prop("checked")){ // замена текстового поля картинкой
				
				setTimeout(()=>{
					self.closest("td").width("20%");
					self.closest("td").closest("tr").find("td input[placeholder='Link']").removeAttr("readonly");
							
					if(imagesArray[rowsIdArray.indexOf(rowId)][0]){
							
							self.closest(".cell-with-bunner-content").find("textarea.form-control").each(function(i, elem){
									$(elem).replaceWith('<a href="" id="thumb-image'+rowsIdArray.indexOf(rowId)+'-'+(i+1)+'" data-toggle="image" class="img-thumbnail"><img src="'+imagesArray[rowsIdArray.indexOf(rowId)][0][i]+'" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input id="input-image'+rowsIdArray.indexOf(rowId)+'-'+(i+1)+'" type="hidden" name="smbanner_info['+rowsIdArray.indexOf(rowId)+'][header_page_top_description]['+(i+1)+'][image]" value="'+imagesValArray[rowsIdArray.indexOf(rowId)][0][i]+'" placeholder="'+imagesValArray[rowsIdArray.indexOf(rowId)][0][i]+'" class="form-control" />');
								});
							}else{
								
								self.closest(".cell-with-bunner-content").find("textarea.form-control").each(function(i, elem){
									$(elem).replaceWith('<a href="" id="thumb-image'+rowsIdArray.indexOf(rowId)+'-'+(i+1)+'" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input id="input-image'+rowsIdArray.indexOf(rowId)+'-'+(i+1)+'" type="hidden" name="smbanner_info['+rowsIdArray.indexOf(rowId)+'][header_page_top_description]['+(i+1)+'][image]" value="'+imagesValArray[rowsIdArray.indexOf(rowId)][0][i]+'" placeholder="<?php echo $entry_image; ?>" class="form-control" />');
								});
							};
					
							self.closest(".cell-with-bunner-content").find(".note-editor").remove();
					}, 100);
				}if(self.val() === "textarea" && $(this).prop("checked")){ // замена картинки текстовым полем
					
				setTimeout(()=>{	
					self.closest("td").width("30%");
					self.closest("td").closest("tr").find("td input[placeholder='Link']").attr("readonly","true");
					
						self.closest(".cell-with-bunner-content").find(".img-thumbnail").each(function(i, elem){
							$(elem).replaceWith('<textarea name="smbanner_info['+rowsIdArray.indexOf(rowId)+'][header_page_top_description]['+ (i+1) +'][image]" placeholder="<?php echo $entry_description; ?>" id="input-description'+rowsIdArray.indexOf(rowId)+''+(i+1)+'" class="form-control"></textarea>');
						$('#input-description'+rowsIdArray.indexOf(rowId)+''+(i+1)+'').summernote({height: 150});
						});
						self.closest(".cell-with-bunner-content").find("div.note-editor .note-editable").each(function(i, elem){
							$(elem).html(videosArray[rowsIdArray.indexOf(rowId)][0][i]);
						});
						
						self.closest(".cell-with-bunner-content").find("input.form-control").remove();
					},100);
				};
			});
		};
		
		setBunnerContent();
		
  /*****************************************************************************************************************/
  
  <!--
$('input[name=\'product\']').autocomplete({
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	select: function(item) {
		$('input[name=\'product\']').val('');
		
		$('#featured-product' + item['value']).remove();
		
		$('#featured-product').append('<div id="featured-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product[]" value="' + item['value'] + '" /></div>');	
	}
});
	
$('#featured-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//-->
var header_field_value_row = <?php echo $header_field_value_row; ?>;

function addCustomFieldValue1() {
	html  = '<tr id="SMheader-field-value-row' + header_field_value_row + '">';	
    html += '  <td class="text-left cell-with-bunner-content" style="width: 20%;">';
		html += '    <div class="set-bunner-content-buttons"><input type="radio" name="smbanner_info['+ header_field_value_row +'][select_content]" value="image" checked /><input type="radio" name="smbanner_info['+ header_field_value_row +'][select_content]" value="textarea" /></div>';
	<?php foreach ($languages as $language) { ?>
		

	html += '    <div class="input-group">';
	html += '      <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><a href="" id="thumb-image'+header_field_value_row+'-<?php echo $language['language_id']; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="smbanner_info[' + header_field_value_row + '][header_page_top_description][<?php echo $language['language_id']; ?>][image]" value="" placeholder="<?php echo $entry_value; ?>" class="form-control" id="input-image'+header_field_value_row+'-<?php echo $language['language_id']; ?>"/>';
    html += '    </div>';
	<?php } ?>
	html += '  </td>';
	html += '  <td class="text-right"><select name="smbanner_info[' + header_field_value_row + '][width]" id="input-status" class="form-control"><option value="<?php echo !empty($smbanner_info['width'])?$smbanner_info['width']:'col-lg-12'; ?>"><?php echo $text_edit?$text_edit:$width_full; ?></option><option value="col-lg-12"><?php echo $width_full; ?></option><option value="col-lg-6"><?php echo $width_1_2; ?></option><option value="col-lg-4"><?php echo $width_1_3; ?></option><option value="col-lg-3"><?php echo $width_1_4; ?></option></select>';
	html += '  </td>';
	html += '  <td class="text-right"><input type="text" name="smbanner_info[' + header_field_value_row + '][url]" value="" placeholder="<?php echo $entry_value; ?>" class="form-control" /></td>';
	html += '  <td class="text-right" style="width: 10%;"><input type="text" name="smbanner_info[' + header_field_value_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#SMheader-field-value-row' + header_field_value_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';	
	
	$('#custom-field-value1 > tbody').append(html);
	
	header_field_value_row++;
	
	setBunnerContent(); // функция смены содержимого контента баннера
	
}</script>
 <script type="text/javascript"><!--
 
 <?php $i=0; foreach ($smbanner_info as $smbanner_info) { ?>
<?php foreach ($languages as $language) { ?>
<?php if ($ckeditor) { ?>
ckeditorInit('input-description<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
<?php } else { ?>
$('#input-description<?php echo $i.''.$language['language_id']; ?>').summernote({height: 300});
<?php } ?>
<?php } ?>
<?php $i++; } ?>

//--></script>
</div>
<?php echo $footer; ?>