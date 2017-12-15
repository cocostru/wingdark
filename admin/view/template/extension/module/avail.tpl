<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-availability" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
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
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3> / <?php echo $text_varsion;?>
                </div>
            <div class="panel-body">
                <div class="content">
                    <div class="form-group">
                        <a href="<?php echo $getAvailabilityList; ?>" class="btn btn-info"><?php echo $text_get_availabilitylist; ?></a>
                    </div>
					<div>
					<ul class="nav nav-tabs">
						<li class="active"><a  href="#tab-general" data-toggle="tab" aria-expanded="true"><?php echo $text_general;?></a></li>
						<li><a  href="#tab-mail" data-toggle="tab" aria-expanded="true"><?php echo $text_settings_mail;?></a></li>
						<li><a  href="#tab-appearance" data-toggle="tab" aria-expanded="true"><?php echo $text_settings_appearance;?></a></li>
						
					</ul>
					</div>
					
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-availability" class="form-horizontal">
					<div class="tab-content">
					<div class="tab-pane active" id="tab-general">
					<div class="well">					
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-email"><?php echo $text_mail_on;?>
								<a href="#" data-toggle="tooltip" data-placement="top" title="<?php echo $text_mail_help;?>"><i class="fa fa-question-circle" aria-hidden="true"></i></a>
							</label>
                            <div class="col-sm-10">
								<?php if ($error_email) { ?>
									<div class="text-danger"><?php echo $error_email; ?></div>
								<?php }?>
                                    <input class="form-control" rows="3" name="avail_email" id="input-email" value="<?php echo $avail_email?$avail_email:$text_mail_defoult;?>" placeholder="<?php echo $text_mail; ?>">
                            </div>
                        </div>
					</div>	
					<div class="well">
					<h4><?php echo $text_product_page;?></h4>
						<div class="form-group">
                            <label class="col-sm-2 control-label" for="input-button_cart_productpage"><?php echo $text_button_cart_productpage;?>							
								<a  class="test" href="#" onclick="event.preventDefault()" data-toggle="popover" data-placement="b" title="<?php echo $text_button_product_help;?>" data-html="true" data-content="<img src='view/image/avail/help-1.jpg' width='760' />"> <i class="fa fa-question-circle" aria-hidden="true"></i></a>
							</label>
                            <div class="col-sm-10">
								<?php if ($error_button_cart_productpage) { ?>
									<div class="text-danger"><?php echo $button_cart_productpage; ?></div>
								<?php }?>
                                    <input class="form-control" rows="3" name="avail_button_cart_productpage" id="input-button_cart_productpage" value="<?php echo $button_cart_productpage?$button_cart_productpage:'#button-cart';?>" placeholder="<?php echo $text_button_cart_productpage; ?>">
                            </div>
                        </div>
						<div class="form-group">
                            <label class="col-sm-2 control-label" for="input-button_other_productpage"><?php echo $text_button_other_productpage;?>							
								<a  class="test" href="#" onclick="event.preventDefault()" data-toggle="popover" data-placement="b" title="<?php echo $text_button_other_product_help;?>" data-html="true" data-content="<img src='view/image/avail/help-1.jpg' width='760' />"> <i class="fa fa-question-circle" aria-hidden="true"></i></a>
							</label>
                            <div class="col-sm-10">
								<?php if ($error_button_other_productpage) { ?>
									<div class="text-danger"><?php echo $button_other_productpage; ?></div>
								<?php }?>
                                    <input class="form-control" rows="3" name="avail_button_other_productpage" id="input-button_other_productpage" value="<?php echo $button_other_productpage?$button_other_productpage:'';?>" placeholder="<?php echo $text_button_other_productpage; ?>">
                            </div>
                        </div>
						<div class="form-group">
                            <label class="col-sm-2 control-label" for="input_block_option_productpage"><?php echo $text_block_option_productpage;?>
								<a  class="test" href="#" onclick="event.preventDefault()" data-toggle="popover" data-placement="b" title="<?php echo $text_block_option_productpage_help;?>" data-html="true" data-content="<img src='view/image/avail/help-2.jpg' width='760' />"> <i class="fa fa-question-circle" aria-hidden="true"></i></a>
							</label>
                            <div class="col-sm-10">
								<?php if ($error_block_option_productpage) { ?>
									<div class="text-danger"><?php echo $block_option_productpage; ?></div>
								<?php }?>
                                    <input class="form-control" rows="3" name="avail_block_option_productpage" id="input_block_option_productpage" value="<?php echo $block_option_productpage?$block_option_productpage:'#product';?>" placeholder="<?php echo $text_block_option_productpage; ?>">
                            </div>
                        </div>
					</div>	
					<div class="well">
					<h4><?php echo $text_ather_page;?></h4>
						<div class="form-group">
                            <label class="col-sm-2 control-label" for="input-button_them"><?php echo $text_button_them;?></label>
                            <div class="col-sm-10">
								
								<?php if ($avail_default == null) { ?>									
									<label class="radio-inline">
										<input class="in" type="radio" name="avail_default" value="1" checked="checked" />
										<?php echo $text_yes; ?>
									</label>	
									<label class="radio-inline">	
										<input class="off" type="radio" name="avail_default" value="0" />
										<?php echo $text_no; ?>
									</label>	
								<?php } else {?>
									<?php if ($avail_default == '1') { ?>
									
										<label class="radio-inline">
										<input class="in" type="radio" name="avail_default" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										</label>	
										<label class="radio-inline">
										<input class="off" type="radio" name="avail_default" value="0" />
										<?php echo $text_no; ?>
										</label>
									<?php } else {?>
										<label class="radio-inline">
										<input class="in" type="radio" name="avail_default" value="1"  />
										<?php echo $text_yes; ?>
										</label>
										<label class="radio-inline">
										<input class="off" type="radio" name="avail_default" value="0" checked="checked"/>
										<?php echo $text_no; ?>
										</label>
									<?php }?>
								<?php } ?>
							</div>
                        </div> 
						<div id="demo" class="form-group collapse" >
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-button_cart_other"><?php echo $text_button_cart_other;?>
									<a  class="test" href="#" onclick="event.preventDefault()" data-toggle="popover" data-placement="b" title="<?php echo $text_button_other_help;?>" data-html="true" data-content="<img src='view/image/avail/help-3.jpg' width='760' />"> <i class="fa fa-question-circle" aria-hidden="true"></i></a>
								</label>
								<div class="col-sm-10">
									<?php if ($error_button_cart_other) { ?>
										<div class="text-danger"><?php echo $button_cart_other; ?></div>
									<?php }?>
										<input class="form-control" rows="3" name="avail_button_cart_other" id="input-button_cart_other" value="<?php echo $button_cart_other?$button_cart_other:'.avail-button-cart';?>" placeholder="<?php echo $text_button_cart_other; ?>">
								</div>
							</div>
							<div class="form-group ">
								<label class="col-sm-2 control-label" for="input-block_product"><?php echo $text_block_product;?>
									<a  class="test" href="#" onclick="event.preventDefault()" data-toggle="popover" data-placement="b" title="<?php echo $text_block_product_help;?>" data-html="true" data-content="<img src='view/image/avail/help-3_1.jpg' width='760' />"> <i class="fa fa-question-circle" aria-hidden="true"></i></a>
								</label>
								<div class="col-sm-10">
									<?php if ($error_block_product) { ?>
										<div class="text-danger"><?php echo $avail_block_product; ?></div>
									<?php }?>
										<input class="form-control" rows="3" name="avail_block_product" id="input-block_product" value="<?php echo $avail_block_product?$avail_block_product:'.product-thumb';?>" placeholder="<?php echo $text_block_product; ?>">
								</div>
							</div>
						</div>
					</div>
					<div class="well2">
					<h4><?php echo $text_google_captcha;?></h4>
							<div class="form-group">
							  <label class="col-sm-2 control-label" for="input-google-captcha-status"><?php echo $entry_capcha_status; ?>
								<a  class="test" href="#" onclick="event.preventDefault()" data-toggle="popover" data-placement="b" title="<?php echo $entry_capcha_status; ?>" data-html="true" data-content="<img src='view/image/avail/help-4.jpg' width='760' />"> <i class="fa fa-question-circle" aria-hidden="true"></i></a>
							  
							  </label>
							  <div class="col-sm-10">
								<select name="avail_config_google_captcha_status" id="input-google-captcha-status" class="form-control">
								  <?php if ($avail_config_google_captcha_status) { ?>
								  <option class="in_google" value="1" selected="selected"><?php echo $text_enabled; ?></option>
								  <option class="off_google" value="0"><?php echo $text_disabled; ?></option>
								  <?php } else { ?>
								  <option class="in_google" value="1"><?php echo $text_enabled; ?></option>
								  <option class="off_google" value="0" selected="selected"><?php echo $text_disabled; ?></option>
								  <?php } ?>
								</select>
							  </div>
							</div>
							<div id="google-hight" class="collapse ">
								<div   class="alert alert-info "><?php echo $help_google_captcha; ?></div>
								<div  class="form-group ">
								  <label class="col-sm-2 control-label" for="input-google-captcha-public"><?php echo $entry_google_captcha_public; ?></label>
								  <div class="col-sm-10">
								  <?php if ($error_avail_google_captcha_public) { ?>
									 <div class="text-danger"><?php echo $error_avail_google_captcha_public; ?></div>
								  <?php } ?>
									<input type="text" name="avail_config_google_captcha_public" value="<?php echo $avail_config_google_captcha_public; ?>" placeholder="<?php echo $entry_google_captcha_public; ?>" id="input-google-captcha-public" class="form-control" />
								  </div>
								</div>
								
								<div  class="form-group ">
								  <label class="col-sm-2 control-label" for="input-google-captcha-secret"><?php echo $entry_google_captcha_secret; ?></label>
								  <div class="col-sm-10">
								  <?php if ($error_avail_google_captcha_secret) { ?>
									 <div class="text-danger"><?php echo $error_avail_google_captcha_secret; ?></div>
								  <?php } ?>
									<input type="text" name="avail_config_google_captcha_secret" value="<?php echo $avail_config_google_captcha_secret; ?>" placeholder="<?php echo $entry_google_captcha_secret; ?>" id="input-google-captcha-secret" class="form-control" />
								  </div>
								</div>
							</div>
						</div>	
						<div class="well">
							<h4><?php echo $text_global_settings;?></h4>
							<div class="form-group">
							  <label class="col-sm-2 control-label" for="input_config_product_edit"><?php echo $entry_config_product_edit; ?>
							  <a  class="test" href="#" onclick="event.preventDefault()" data-toggle="popover" data-placement="b" title="<?php echo $entry_config_product_edit_help; ?>" data-html="true" data-content="<img src='view/image/avail/help-5.jpg' width='760' />"> <i class="fa fa-question-circle" aria-hidden="true"></i></a>
							  </label>
							  <div class="col-sm-10">
								<select name="avail_config_product_edit" id="input_config_product_edit" class="form-control">
								  <?php if ($avail_config_product_edit) { ?>
								  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								  <option value="0"><?php echo $text_disabled; ?></option>
								  <?php } else { ?>
								  <option value="1"><?php echo $text_enabled; ?></option>
								  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								  <?php } ?>
								</select>
							  </div>
							</div>
							<div class="form-group">
							  <label class="col-sm-2 control-label" for="input_avail_options_status"><?php echo $text_options_status; ?></label>
							  <div class="col-sm-10">
								<select name="avail_options_status" id="input_avail_options_status" class="form-control">
								  <?php if ($avail_options_status) { ?>
								  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								  <option value="0"><?php echo $text_disabled; ?></option>
								  <?php } else { ?>
								  <option value="1"><?php echo $text_enabled; ?></option>
								  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								  <?php } ?>
								</select>
							  </div>
							</div>
                        <div class="form-group ">
                            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                            <div class="col-sm-10">
                                <select name="avail_status" id="input-status" class="form-control">
                                    <?php if ($avail_status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-cron"><?php echo $text_cron; ?></label>
							<div class="col-sm-10">
								<input class="form-control" value="<?php echo $cron_link; ?>" disabled>
							</div>
						</div>
						</div>
					</div>	
					<div class="tab-pane" id="tab-appearance">
						<div class="tab-pane">
							<div class="tab-content">	
								<h4><?php //echo $text_ather_page;?></h4>
								<div class="form-group">
									<label class="col-sm-4 control-label" for="input-button_them"><?php echo $text_show_img;?></label>
									<div class="col-sm-8">
										<?php if ($avail_show_img == '1') { ?>
											<label class="radio-inline">
											<input class="in" type="radio" name="avail_show_img" value="1" checked="checked" />
											<?php echo $text_yes; ?>
											</label>	
											<label class="radio-inline">
											<input class="off" type="radio" name="avail_show_img" value="0" />
											<?php echo $text_no; ?>
											</label>
										<?php } else {?>
											<label class="radio-inline">
											<input class="in" type="radio" name="avail_show_img" value="1"  />
											<?php echo $text_yes; ?>
											</label>
											<label class="radio-inline">
											<input class="off" type="radio" name="avail_show_img" value="0" checked="checked"/>
											<?php echo $text_no; ?>
											</label>
										<?php }?>										
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label" for="input-button_them"><?php echo $text_show_comment;?></label>
									<div class="col-sm-8">
										<?php if ($avail_show_comment == '1') { ?>
											<label class="radio-inline">
											<input class="in" type="radio" name="avail_show_comment" value="1" checked="checked" />
											<?php echo $text_yes; ?>
											</label>	
											<label class="radio-inline">
											<input class="off" type="radio" name="avail_show_comment" value="0" />
											<?php echo $text_no; ?>
											</label>
										<?php } else {?>
											<label class="radio-inline">
											<input class="in" type="radio" name="avail_show_comment" value="1"  />
											<?php echo $text_yes; ?>
											</label>
											<label class="radio-inline">
											<input class="off" type="radio" name="avail_show_comment" value="0" checked="checked"/>
											<?php echo $text_no; ?>
											</label>
										<?php }?>										
									</div>
								</div>								
							</div>
						</div>
					</div> 
                    <div class="tab-pane" id="tab-mail">
						<div class="tab-pane">
							<ul class="nav nav-tabs" id="language">
							  <?php foreach ($languages as $language) { ?>
							  <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>	  
							  </li>
							  <?php } ?>
							</ul>
							<div class="tab-content">						
							  <?php foreach ($languages as $language) { ?>
							  <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
								<div class="col-sx-12 well">  
									<div class="col-sx-12"> <h4><?php echo $text_config_booton; ?></h4></div>
									 <div class="form-group">
											<label class="col-sm-2 control-label" for="button_avail"><?php echo $entry_avail_text_button_avail; ?>
											  <a  class="test" href="#" onclick="event.preventDefault()" data-toggle="popover" data-placement="b" title="<?php echo $entry_avail_text_button_avail_help; ?>" data-html="true" data-content="<img src='view/image/avail/help-6.jpg' width='760' />"> <i class="fa fa-question-circle" aria-hidden="true"></i></a>
											</label>
											<div class="col-sm-10">							  
											 <input type="text" name="avail_text[<?php echo $language['language_id']; ?>][button_avail]" value="<?php echo isset($avail_text[$language['language_id']]['button_avail'])?$avail_text[$language['language_id']]['button_avail']:''; ?>" placeholder="<?php echo $entry_avail_text_button_avail; ?>" id="button_avail[<?php echo $language['language_id']; ?>]" class="form-control" />
											</div>
									</div> 
								  
								   <div class="form-group">
											<label class="col-sm-2 control-label" for="button_avail_help"><?php echo $entry_avail_text_button_avail_help; ?></label>
											<div class="col-sm-10">							  
											 <input type="text" name="avail_text[<?php echo $language['language_id']; ?>][button_avail_help]" value="<?php echo isset($avail_text[$language['language_id']]['button_avail_help'])?$avail_text[$language['language_id']]['button_avail_help']:''; ?>" placeholder="<?php echo $entry_avail_text_button_avail_help; ?>" id="button_avail_help[<?php echo $language['language_id']; ?>]" class="form-control" />
											</div>
									</div> 
								</div>	
								<div class="col-sx-12 well2"> 
								<div class="col-sx-12"> <h4><?php echo $text_config_mail; ?></h4></div>
									<div class="form-group well">
										<label class="col-sm-2 control-label"><?php echo $entry_avail_sender; ?></label>
										<div class="col-sm-10">
											<input name="avail[<?php echo $language['language_id']; ?>][sender]" placeholder="<?php echo $entry_notification_sender; ?>" id="sender<?php echo $language['language_id']; ?>" class="form-control" value="<?php echo isset($message[$language['language_id']]['sender']) ? $message[$language['language_id']]['sender'] : $mail_notification_sender; ?>"/>
										</div>
									</div>
											
									<div class="form-group well">				 
									  <label class="col-sm-2 control-label" for="notification_title<?php echo $language['language_id']; ?>"><?php echo $entry_notification_title; ?>
									  
									  </label>									   
									   <div class="col-sm-10">									   
										<input name="avail[<?php echo $language['language_id']; ?>][notification_title]" placeholder="<?php echo $entry_notification_title; ?>" id="notification_title<?php echo $language['language_id']; ?>" class="form-control" value="<?php echo isset($message[$language['language_id']]['notification_title']) ? $message[$language['language_id']]['notification_title'] : $mail_notification_title; ?>"/>
									  </div>
									</div>
									 <div class="form-group ">
									 <?php if ($error_mail_send) { ?>
											<div class="text-danger"><?php echo $error_mail_send; ?></div>
									 <?php }?>
									  <label class="col-sm-2 control-label" for="notification_message<?php echo $language['language_id']; ?>"><?php echo $entry_notification_message; ?>
									   <div class="form-group">	
											<div class="col-sm-12">
											  <p id="myshortcodes"  for="shortcodes<?php echo $language['language_id']; ?>">(<?php echo $shortcodes; ?>)</p>
											  
											</div>
										</div> 
									  </label>
									   <div class="col-sm-10">
										<textarea name="avail[<?php echo $language['language_id']; ?>][notification_message]" placeholder="<?php echo $entry_notification_message; ?>" id="notification_message<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($message[$language['language_id']]['notification_message']) ? $message[$language['language_id']]['notification_message'] : ''; ?></textarea>
									  </div>
									</div>  
									<div class="form-group well">				 
									  <label class="col-sm-2 control-label" for="client_title<?php echo $language['language_id']; ?>"><?php echo $entry_client_title; ?>								
									  </label>
									   <div class="col-sm-10">
										<input name="avail[<?php echo $language['language_id']; ?>][client_title]" placeholder="<?php echo $entry_client_title; ?>" id="client_title<?php echo $language['language_id']; ?>" class="form-control" value="<?php echo isset($message[$language['language_id']]['client_title']) ? $message[$language['language_id']]['client_title'] : $mail_client_title; ?>"/>
									  </div>
									</div>
									<div class="form-group">
									 <?php if ($error_mail_send) { ?>
											<div class="text-danger"><?php echo $error_mail_send; ?></div>
									 <?php }?>
									  <label class="col-sm-2 control-label" for="client_message<?php echo $language['language_id']; ?>"><?php echo $entry_client_message; ?>
										<div class="form-group">	
											<div class="col-sm-12">
											  <p id="myshortcodes2"  for="shortcodes<?php echo $language['language_id']; ?>">(<?php echo $shortcodes; ?>)</p>
											  
											</div>
										</div>
									  </label>
									  
									<div class="col-sm-10">
										<textarea name="avail[<?php echo $language['language_id']; ?>][client_message]" placeholder="<?php echo $entry_client_message; ?>" id="client_message<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($message[$language['language_id']]['client_message']) ? $message[$language['language_id']]['client_message'] : ''; ?></textarea>
									  </div>
									</div>  
									<div class="form-group well">				 
									  <label class="col-sm-2 control-label" for="client_title<?php echo $language['language_id']; ?>"><?php echo $entry_admin_title; ?></label>
									   <div class="col-sm-10">
										<input name="avail[<?php echo $language['language_id']; ?>][admin_title]" placeholder="<?php echo $entry_admin_title; ?>" id="admin_title<?php echo $language['language_id']; ?>" class="form-control" value="<?php echo isset($message[$language['language_id']]['admin_title']) ? $message[$language['language_id']]['admin_title'] : $mail_admin_title; ?>"/>
									  </div>
									</div>				
									<div class="form-group ">
									 <?php if ($error_mail_send) { ?>
											<div class="text-danger"><?php echo $error_mail_send; ?></div>
									 <?php }?>
									  <label class="col-sm-2 control-label" for="admin_message<?php echo $language['language_id']; ?>"><?php echo $entry_admin_message; ?>
									  <div class="form-group">	
											<div class="col-sm-12">
											  <p id="myshortcodes3"  for="shortcodes<?php echo $language['language_id']; ?>">(<?php echo $shortcodes; ?>)</p>
											  
											</div>
										</div>
										</label>
									   <div class="col-sm-10">
										<textarea name="avail[<?php echo $language['language_id']; ?>][admin_message]" placeholder="<?php echo $entry_admin_message; ?>" id="admin_message<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($message[$language['language_id']]['admin_message']) ? $message[$language['language_id']]['admin_message'] : ''; ?></textarea>
									  </div>
									</div> 
								  </div>
								</div>
								<?php } ?>
							</div>
						</div>
					</div> 					
				</div> 
			</form> 
       
		</div>
        </div>
    </div>
</div>
</div>
<div class="modal fade" id="myModalshortcodes" role="dialog">
    <div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal">&times;</button>
				  <h4 class="modal-title"><?php echo $shortcodes; ?></h4>
			</div>
			<div class="modal-body">
				
					<p><?php echo $text_shortcode_name; ?></p>
					<p><?php echo $text_shortcode_product_name; ?></p>
					<p><?php echo $text_shortcode_price; ?></p>
					<p><?php echo $text_shortcode_link; ?></p>
					<p><?php echo $text_shortcode_option_name; ?></p>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
      
    </div>
</div>  


<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
 <script type="text/javascript"><!--
 
 $( document ).ready(function(){
 
    $(".off").click(function() {
		$("#demo").addClass("in");
	});
	$(".in").click(function() {
		$("#demo").removeClass("in");
	});
	
	
	var input = $("input[name=\'avail_default\']:checked").val();
	
	if (input == '0'){
		$("#demo").addClass("in");
	}
	
	
	
	
	$('select#input-google-captcha-status').on('change', function() {
	console.log(this.value);
		if( this.value == 0) {
			$("#google-hight").removeClass("in");
		} 
		
		if( this.value == 1) {
			 $("#google-hight").addClass("in");
		} 
	})
	
	var input = $("#input-google-captcha-status option:selected").val();
	if (input == 1){
    $("#google-hight").addClass("in");
	}
	
	
	
});

//--></script> 
  <script type="text/javascript"><!--
$('#language a:first').tab('show');

$(document).ready(function(){
		$('.test').click().popover();
		$('.footer_sm').click().popover();
		$('.help-ico').click().popover();
	});
//--></script>
<script>
$(document).ready(function(){
    $("#myshortcodes, #myshortcodes2, #myshortcodes3").click(function(){
        $("#myModalshortcodes").modal();
    });
});
</script>
<style>

.popover {
    width: 800px;
    max-width: 800px;
}
#demo {
    margin-left: 0px;
    margin-right: 0px;
}
.well2 {
    min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    border: 1px solid #e3e3e3;
    border-radius: 3px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .05);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .05);
}
.shortcodes {
    font-size: 10px;
}
#myshortcodes, #myshortcodes2, #myshortcodes3 {
	 font-size: 10px;
	 cursor: pointer;
	color: #14628c;
}
</style>

<?php echo $footer; ?>