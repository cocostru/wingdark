<?php echo $header; ?><?php echo $column_left; ?>
<div id ="content">
<div class="page-header">
    <div class="container-fluid">
	<div class="pull-right">
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
        <h1><?php echo $heading_title; ?></h1>
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
    </div>	
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading"><h3 class="panel-title"><?php echo $text_list; ?></h3></div>
            <div class="panel-body">				
                <div class="content">				
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-active" data-toggle="tab"><?php echo $tab_active; ?></a></li>
                        <li><a href="#tab-closed" data-toggle="tab"><?php echo $tab_closed; ?></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-active">
							<div class="well">
							  <div class="row">
							  <div class="col-sm-12">
								<div class="col-sm-4">
								  <div class="form-group">
									<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
									<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
								  </div>
								</div>
								<div class="col-sm-4">
								  <div class="form-group">
									<label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
									<input type="text" name="filter_email" value="<?php echo $filter_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
								  </div>					  
								</div>	
								<div class="col-sm-4">
									<div class="form-group">
										<label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
										<select name="filter_status" id="input-status" class="form-control">
										  <option value="*"></option>
										  <?php if ($filter_status) { ?>
										  <option value="1" selected="selected"><?php echo $text_disabled; ?></option>
										  <?php } else { ?>
										  <option value="1"><?php echo $text_disabled; ?></option>
										  <?php } ?>
										  <?php if (!$filter_status && !is_null($filter_status)) { ?>
										  <option value="0" selected="selected"><?php echo $text_enabled; ?></option>
										  <?php } else { ?>
										  <option value="0"><?php echo $text_enabled; ?></option>
										  <?php } ?>
										</select>
									  </div>
									</div>  
								</div>
								<div class="col-sm-12">
								<div class="col-sm-4">
								  <div class="form-group">
									<label class="control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
									<div class="input-group date">
									  <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control" />
									  <span class="input-group-btn">
									  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									  </span></div>
								  </div>
								</div>
								<div class="col-sm-4">
								  <div class="form-group">
									<label class="control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
									<div class="input-group date">
									  <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control" />
									  <span class="input-group-btn">
									  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									  </span></div>
								  </div>
								  <div class="col-sm-4">
								  
								  </div>
								  <div class="col-sm-4">
								  </div>
								  </div>
								</div>  
								
							  </div>
							</div>
                            <form action="" method="post" enctype="multipart/form-data" id="form">
                                <div class="box">
                                    <div class="heading">
                                        <div class="buttons clearfix">   
										<div class="col-sm-4">
											
											<a class="btn btn-primary makeLink1"><?php echo $button_send; ?></a>
											<button id="update" class="btn btn-primary"><?php echo $reload; ?></button>
											<button type="button" id="button-filter" class="btn btn-primary"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
											
										</div>
                                        </div>
                                    </div>
                                </div>
                                <table class="table">
                                    <tr>                                       
									<!--	<td class="col-md-1"><?php echo $id; ?></td> -->
                                        <td class="col-md-1"><?php echo $text_time; ?></td>
                                        <td class="col-md-3"><?php echo $text_product; ?></td>
                                        <td class="col-md-1"><?php echo $text_price; ?></td>
                                        <td class="col-md-2"><?php echo $text_mail; ?></td>
                                        <td class="col-md-2"><?php echo $text_name; ?></td>
                                        <td class="col-md-1"><?php echo $text_comment; ?></td>
                                        <td class="col-md-1"><?php echo $text_statuse; ?></td>
                                        <td class="col-md-1"><?php echo $text_quantity; ?></td>
                                    </tr>
                                    <?php if (isset($availabilities)) {										
										foreach($availabilities as $availability){ ?>										
										<tr>
											<!--<td class="col-md-1"><?php echo $availability['id']; ?></td>-->
											<td class="col-md-1"><?php echo $availability['time']; ?></td>
											<td class="col-md-3">
											<p><a href='<?php echo $availability['edit'];?>'><b><?php echo $availability['product']; ?></b></a></p>
											<?php 
												foreach($availability['options'] as $index => $value ) {
													echo "<p>" . $value['option_type'] . " : " . $value['option_name'] . " ( " . $value['option_quantity'] . " )</p>";
													
												}
											?>
											</td>
											<td class="col-md-1"><?php echo $availability['price']; ?></td>
											<td class="col-md-2"><?php echo $availability['email']; ?></td>
											<td class="col-md-2"><?php echo $availability['name']; ?></td>
											<td class="col-md-1"><?php echo $availability['comment']; ?>
												<?php if (!empty($availability['full_comment'])) { ?>
													<span  class="all-hover" data-container="body" data-toggle="popover" data-placement="bottom" data-content="<?php echo $availability['full_comment'];?>">&nbsp;&nbsp; <span style="cursor:pointer;"> ...</span></span>
												<?php } ?>
											</td>
											<td class="col-md-1">
											<?php echo $availability['status']; ?>
												<select id="<?php echo $availability['id']; ?>" class="call_status <?php echo ($availability['status'] == '1')?'closed':'opened'; ?>">
													<?php foreach($statuses as $key => $status) { ?>

													<?php $selected=($key==$availability['status'])?'selected':''; ?>
													<option value='<?php echo $key; ?>' data-id="<?php echo $availability['id']; ?>" data-product-id="<?php echo $availability['product_id']; ?>"<?php echo $selected; ?> ><?php echo $status; ?> </option>
													<?php } ?>
												</select>
											</td>
											<td class="col-md-1"><?php echo $availability['quantity']; ?></td>
										</tr>
                                    <?php }
									}
									?>

                                </table>
                            </form>
                        </div>

                        <div class="tab-pane" id="tab-closed">
						<div class="well">
							<div class="row">
							  <div class="col-sm-12">
								<div class="col-sm-4">
								  <div class="form-group">
									<label class="control-label" for="input-name-close"><?php echo $entry_name; ?></label>
									<input type="text" name="filter_name_close" value="<?php echo $filter_name_close; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
								  </div>
								</div>
								<div class="col-sm-4">
								  <div class="form-group">
									<label class="control-label" for="input-email-close"><?php echo $entry_email; ?></label>
									<input type="text" name="filter_email_close" value="<?php echo $filter_email_close; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email-close" class="form-control" />
								  </div>					  
								</div>	
								
								</div>
								<div class="col-sm-12">
								<div class="col-sm-4">
								  <div class="form-group">
									<label class="control-label" for="input-date-start-close"><?php echo $entry_date_start; ?></label>
									<div class="input-group date">
									  <input type="text" name="filter_date_start_close" value="<?php echo $filter_date_start_close; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start-close" class="form-control" />
									  <span class="input-group-btn">
									  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									  </span></div>
								  </div>
								</div>
								<div class="col-sm-4">
								  <div class="form-group">
									<label class="control-label" for="input-date-end-close"><?php echo $entry_date_end; ?></label>
									<div class="input-group date">
									  <input type="text" name="filter_date_end_close" value="<?php echo $filter_date_end_close; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end-close" class="form-control" />
									  <span class="input-group-btn">
									  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									  </span></div>
								  </div>
								  <div class="col-sm-4">
								  </div>
								  <div class="col-sm-4">
								  </div>
								  </div>
								</div>  
								
							  </div>
							</div>
                            <form action="" method="post" enctype="multipart/form-data" id="form">
                                <div class="box">
                                    <div class="heading">
                                        <div class="buttons clearfix">    
											<a id="delete" class="btn btn-primary"><?php echo $button_delete; ?></a>
											<button id="update" class="btn btn-primary"><?php echo $reload; ?></button>
											<button type="button" id="button-filter-close" class="btn btn-primary"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>											
                                        </div>
                                    </div>
                                </div>
                                <table class="table">
                                    <tr>
										<td class="col-md-1"><input type="checkbox" id="checkall"></td>
										<td class="col-md-1"><?php echo $id; ?></td>
                                        <td class="col-md-1"><?php echo $text_time; ?></td>
                                        <td class="col-md-1"><?php echo $text_product; ?></td>
                                        <td class="col-md-1"><?php echo $text_price; ?></td>
                                        <td class="col-md-2"><?php echo $text_mail; ?></td>
                                        <td class="col-md-1"><?php echo $text_name; ?></td>
                                        <td class="col-md-2"><?php echo $text_comment; ?></td>
                                        <td class="col-md-1"><?php echo $text_statuse; ?></td>
                                        <td class="col-md-1"><?php echo $text_quantity; ?></td>
                                    </tr>
                                    <?php
								if (isset($processed)) {
									foreach ($processed as $mail ) { ?>
										<tr>
											<td class="col-md-1"><input type="checkbox" name="selected[]" data-id="<?php echo $mail['id'];?>"></td>
											<td class="col-md-1"><?php echo $mail['id']; ?></td>
											<td class="col-md-1"><?php echo $mail['time']; ?></td>
											<td class="col-md-1"><?php echo $mail['product']; ?>
											<?php 
												foreach($mail['options'] as $index => $value ) {
													echo "<p>" . $value['option_type'] . " - " . $value['option_name'] . " - " . $value['option_quantity'] . "</p>";										
												}
											?>
											</td>
											<td class="col-md-1"><?php echo $mail['price']; ?></td>
											<td class="col-md-2"><?php echo $mail['email']; ?></td>
											<td class="col-md-1"><?php echo $mail['name']; ?></td>
											<td class="col-md-2"><?php echo $mail['comment']; ?>
												<?php if (!empty($mail['full_comment'])) { ?>
													<span class="all-hover" data-container="body" data-toggle="popover" data-placement="bottom" data-content="<?php echo $mail['full_comment'];?>">&nbsp;&nbsp; <span class="all_hover"> ...</span></span>
												<?php } ?>
											</td>
											<td class="col-md-1">
												<select id="<?php echo $mail['id']; ?>" class="call_status">
													<?php foreach($statuses as $key => $status) { ?>
													<?php $selected=($key==$mail['status'])?'selected':''; ?>
													<option value='<?php echo $key; ?>' data-id="<?php echo $mail['id']; ?>" data-product-id="<?php echo $mail['product_id']; ?>"<?php echo $selected; ?> ><?php echo $status; ?> </option>
													<?php } ?>
												</select>
											</td>
											<td class="col-md-1"><?php echo $mail['quantity']; ?></td>
										</tr>

                                    <?php } 
									} ?>
								

                                </table>

                            </form>
                        </div>
                    </div>
                </div>				
            </div>
        </div>
    </div>
</div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	var url = 'index.php?route=extension/module/avail/getAvailabilityList&token=<?php echo $token; ?>';

	var filter_name = $('input[name=\'filter_name\']').val();
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	
	var filter_email = $('input[name=\'filter_email\']').val();
	if (filter_email) {
		url += '&filter_email=' + encodeURIComponent(filter_email);
	}	
	
	var filter_date_start = $('input[name=\'filter_date_start\']').val();
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}
	
	var filter_date_end = $('input[name=\'filter_date_end\']').val();
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}
	
	var filter_status = $('select[name=\'filter_status\']').val();
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}

	location = url;
});
$('#button-filter-close').on('click', function() {
	var url = 'index.php?route=extension/module/avail/getAvailabilityList&token=<?php echo $token; ?>';

	var filter_name_close = $('input[name=\'filter_name_close\']').val();
	if (filter_name_close) {
		url += '&filter_name_close=' + encodeURIComponent(filter_name_close);
	}
	
	var filter_email_close = $('input[name=\'filter_email_close\']').val();
	if (filter_email_close) {
		url += '&filter_email_close=' + encodeURIComponent(filter_email_close);
	}	
	
	var filter_date_start_close = $('input[name=\'filter_date_start_close\']').val();
	if (filter_date_start_close) {
		url += '&filter_date_start_close=' + encodeURIComponent(filter_date_start_close);
	}
	
	var filter_date_end_close = $('input[name=\'filter_date_end_close\']').val();
	if (filter_date_end_close) {
		url += '&filter_date_end_close=' + encodeURIComponent(filter_date_end_close);
	}

	location = url;
});
//--></script>

<script type="text/javascript">
$(document).ready(function() {
    $('.makeLink1').on('click', function() {
	
	    $(".buttons").addClass("hid");
		
		$.ajax({
			url:'index.php?route=extension/module/avail/notify&token=<?php echo $token; ?>',
			type:'post',
			dataType:'json'			
		})
			.success (function(message) {
				if (message['success']) {					
					$(".alert").remove();
					$(".breadcrumb").after("<div class='alert alert-success'>" + message['success'] + "</div>");
					$('html, body').animate({ scrollTop: 0 }, 'slow');
					$(".buttons").removeClass('hid');
					$(".buttons").addClass("good");
					setTimeout(function(){$this.removeClass('good');}, 2000);
					
					//setTimeout(function(){location.reload();}, 3000);
				} else {					
					$(".alert").remove();
					$(".breadcrumb").after("<div class='alert alert-danger'>" + message['error'] + "</div>");
					$('html, body').animate({ scrollTop: 0 }, 'slow');
					$(".buttons").removeClass('hid');
					$(".buttons").addClass("nogood");
					setTimeout(function(){$(".buttons").removeClass('nogood');}, 2000);
					$('.alert-danger').delay(3000).fadeOut('slow'); 
				}				
			})
			.error (function(message) {				
				$(".alert").remove();
				$(".breadcrumb").after("<div class='alert alert-danger'>" + message + "</div>");
				$('html, body').animate({ scrollTop: 0 }, 'slow');
				$(".buttons").removeClass('hid');
				$('.alert-danger').delay(3000).fadeOut('slow');
				$(".buttons").removeClass('hid');
				$(".buttons").addClass("nogood");
				setTimeout(function(){$(".buttons").removeClass('nogood');}, 2000);
				$('.alert-danger').delay(3000).fadeOut('slow');
			});
    });
	
	$('.call_status').change(function() {
            $this = $(this);			
            $.ajax({
                url: "index.php?route=extension/module/avail/changeMailStatus&token=<?php echo $token;?>",
                type: 'post',
                data: 'id=' + $(this).attr('id') + '&status=' + $(this).children('option:selected').val(),				
                success: function(r) {					
                    if (r == 'ok') {
                        $this.css('background-color', 'rgb(167, 245, 147)');
                    } else {
                        $this.css('background-color', 'rgb(245, 147, 147)');
                    }

                }
            });
        });
	$("#update").click(function(){		
       location.reload();
    });
	$("#checkall").click(function(){
		$("input[name*=selected]").prop("checked", this.checked);
	});
	$("#delete").click(function(e){
		e.preventDefault();
		var idArray = [];
		$("input[name*=selected]:checked").each(function(index, element){
			idArray.push($(element).data('id'));
		});			
		$.ajax({
			url: "index.php?route=extension/module/avail/deleteNotifications&token=<?php echo $token;?>",
			type: 'post',
			data: {idArray:idArray}		
		})
		.success(function(message){			
		//	location.reload();
		})
		.error(function(message){
			$(".alert").remove();
			$(".breadcrumb").after("<div class='alert alert-danger'>" + message + "</div>");
			$('html, body').animate({ scrollTop: 0 }, 'slow');
		});
	});
	$(".all-hover").popover()
});
</script>
 <script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
  <link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script>
<style>
.box {
	margin-bottom: 10px;
}
.makeLink1{
	background-color: #e4b11f!important;
	border-color: #b3902c;
}
#delete{
	background-color: #ea7360;!important;
	border-color: #ce471e;;
}
#delete:hover{
	background-color: #ff1901;!important;
	border-color: #ce471e;;
}
.makeLink1:hover{
	background-color: #e4b11f!important;
	border-color: rgb(232, 209, 41);
}
.closed {
	border: 1px solid #e4e4e4;
    color: #ababab;
}
.opened {
	border: 1px solid #6dd61e;
    color: #19c116;	
}
</style>
<?php echo $footer; ?>
