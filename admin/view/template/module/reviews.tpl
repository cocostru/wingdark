<?php
/*------------------------------------------------------------------------
# Customer Reviews
# ------------------------------------------------------------------------
# The Krotek
# Copyright (C) 2011-2016 The Krotek. All Rights Reserved.
# @license - http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
# Website: http://thekrotek.com
# Support: support@thekrotek.com
-------------------------------------------------------------------------*/
?>
<?php echo $header;?>
<?php $extension_id = str_replace('_', '-', $extension); ?>
<link rel="stylesheet" type="text/css" href="<?php echo (defined('JPATH_ADMINISTRATOR') ? 'admin/' : ''); ?>view/stylesheet/<?php echo $stylesheet; ?>.css" />

<?php echo $column_left; ?>

<div id="content" class="<?php echo $extension_id; ?>">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<a href="<?php echo $help; ?>" data-toggle="tooltip" title="<?php echo $button_help; ?>" class="btn btn-default" target="_blank"><i class="fa fa-question"></i></a>	
				<button type="submit" form="form-<?php echo $extension_id; ?>" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<button onclick="$('#apply').attr('value', '1'); $('#form-<?php echo $extension_id; ?>').submit();" form="form-<?php echo $extension_id; ?>" data-toggle="tooltip" title="<?php echo $button_apply; ?>" class="btn btn-success"><i class="fa fa-check"></i></button>
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
		<?php if ($errors) { ?>
			<?php foreach ($errors as $error) { ?>
				<div class="alert alert-danger">
    				<i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
      				<button type="button" class="close" data-dismiss="alert">&times;</button>
				</div>
			<?php } ?>
		<?php } elseif ($success) { ?>
			<div class="alert alert-success">
				<i class="fa fa-check-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
				<div class="pull-right"><?php echo $version; ?></div>
			</div>
			<div class="panel-body">
        		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-<?php echo $extension_id; ?>" class="form-horizontal">
        			<input type="hidden" name="apply" id="apply" value="0">
      			
					<?php foreach ($options as $key => $option) { ?>
						<?php $key_id = str_replace('_', '-', $key); ?>
						<?php if ($option == 'title') { ?>
							<h2><?php echo ${'entry_'.$key}; ?></h2>
							<?php if (!empty(${'help_'.$key}) && (${'help_'.$key} != 'help_'.$key)) { ?>
								<span class="note"><?php echo ${'help_'.$key}; ?></span>
							<?php } ?>								
						<?php } elseif ($option == 'hidden') { ?>
							<input type="hidden" name="<?php echo $extension.'_'.$key; ?>" value="<?php echo ${$extension.'_'.$key}; ?>" />
						<?php } else { ?>
							<div class="form-group <?php echo $extension_id.'-'.$key_id; ?>">
								<label class="col-sm-2 control-label" for="input-<?php echo $key_id; ?>">
									<?php if (${'help_'.$key} && (${'help_'.$key} != 'help_'.$key)) { ?>
										<span data-toggle="tooltip" title="<?php echo ${'help_'.$key}; ?>"><?php echo ${'entry_'.$key}; ?></span>
									<?php } else {?>
										<?php echo ${'entry_'.$key}; ?>
									<?php } ?>
								</label>
								<div class="col-sm-10">
									<?php if ($option == 'html') { ?>
										<?php echo ${$extension.'_'.$key}; ?>
									<?php } elseif ($option == 'text') { ?>
										<span id="input-<?php echo $key_id; ?>" class="input-text">
											<?php echo ${$extension.'_'.$key}; ?>
										</span>
									<?php } elseif ($option == 'date') { ?>
										<div class="input-group date">
											<input type="text" name="<?php echo $extension.'_'.$key; ?>" value="<?php echo ${$extension.'_'.$key}; ?>" placeholder="<?php echo ${'entry_'.$key}; ?>" id="input-<?php echo $key_id; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
											<span class="input-group-btn">
												<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
											</span>
										</div>
									<?php } elseif (($option == 'input') || ($option == 'multi-input')) { ?>
										<?php if ($option == 'multi-input') { ?>
											<?php foreach ($languages as $language) { ?>
												<div class="input-group">
													<span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
													<input type="text" name="<?php echo $extension.'_'.$key; ?>[<?php echo $language['code']; ?>]" value="<?php echo (isset(${$extension.'_'.$key}[$language['code']]) ? ${$extension.'_'.$key}[$language['code']] : ''); ?>" placeholder="<?php echo ${'entry_'.$key}; ?>" id="input-<?php echo $key_id; ?>" class="form-control" />
												</div>
											<?php } ?>
										<?php } else { ?>
											<input type="text" name="<?php echo $extension.'_'.$key; ?>" value="<?php echo ${$extension.'_'.$key}; ?>" placeholder="<?php echo ${'entry_'.$key}; ?>" id="input-<?php echo $key_id; ?>" class="form-control" />
										<?php } ?>
									<?php } elseif (($option == 'textarea') || ($option == 'multi-textarea')) { ?>
										<?php if ($option == 'multi-textarea') { ?>
        									<ul class="nav nav-tabs" id="<?php echo $extension; ?>-<?php echo $key; ?>-languages">
        										<?php foreach ($languages as $language) { ?>
        											<li><a href="#<?php echo $extension; ?>-<?php echo $key; ?>-<?php echo $language['code']; ?>" data-toggle="tab"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
        										<?php } ?>
      										</ul>
      										<div class="tab-content">
												<?php foreach ($languages as $language) { ?>
													<div class="tab-pane" id="<?php echo $extension; ?>-<?php echo $key; ?>-<?php echo $language['code']; ?>">
														<textarea name="<?php echo $extension; ?>_<?php echo $key; ?>[<?php echo $language['code']; ?>]" placeholder="<?php echo ${'entry_'.$key}; ?>" id="input-<?php echo $key_id; ?>" class="form-control"><?php echo (isset(${$extension.'_'.$key}[$language['code']]) ? ${$extension.'_'.$key}[$language['code']] : ''); ?></textarea>
													</div>
												<?php } ?>														
											</div>
										<?php } else { ?>	
											<textarea name="<?php echo $extension; ?>_<?php echo $key; ?>" placeholder="<?php echo ${'entry_'.$key}; ?>" id="input-<?php echo $key_id; ?>" class="form-control"><?php echo ${$extension.'_'.$key}; ?></textarea>
										<?php } ?>			
									<?php } elseif ($option == 'select') { ?>
										<select name="<?php echo $extension.'_'.$key; ?>" id="input-<?php echo $key_id; ?>" class="form-control">
											<?php foreach (${$key} as $item) { ?>
												<option value="<?php echo $item[0]; ?>"<?php echo ($item[0] == ${$extension.'_'.$key} ? ' selected="selected"' : ''); ?>><?php echo $item[1]; ?></option>
											<?php } ?>
										</select>
									<?php } elseif ($option == 'checkbox') { ?>
										<div class="well well-sm" style="height: 100px; overflow: auto;">
											<?php foreach (${$key} as $item) { ?>
												<div class="checkbox">
													<label>
														<input type="checkbox" name="<?php echo $extension.'_'.$key; ?>[]" value="<?php echo $item[0]; ?>"<?php echo (in_array($item[0], ${$extension.'_'.$key}) ? ' checked="checked"' : ''); ?> /> <?php echo $item[1]; ?>
													</label>
												</div>
											<?php } ?>
										</div>
										<div class="checkbox-select">
											<a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all;?></a>
										</div>
									<?php } elseif ($option == 'autocomplete') { ?>
										<input type="text" name="autocomplete_<?php echo $key; ?>" value="" placeholder="<?php echo ${'entry_'.$key}; ?>" id="input-<?php echo $key_id; ?>" class="form-control" />
										<div id="<?php echo $extension_id.'-'.$key_id; ?>" class="well well-sm autocomplete" style="height: 150px; overflow: auto;">
											<?php foreach (${$key} as $item) { ?>
												<div id="<?php echo $extension_id.'-'.$key_id.'-'.$item[0]; ?>">
													<i class="fa fa-minus-circle"></i> <?php echo $item[1]; ?>
													<input type="hidden" name="<?php echo $extension.'_'.$key; ?>[]" value="<?php echo $item[0]; ?>" />
												</div>
											<?php } ?>
										</div>
                						<div class="checkbox-select">
											<a onclick="$('#<?php echo $extension_id.'-'.$key_id; ?> div').remove();"><?php echo $text_remove_all; ?></a>
										</div>
									<?php } elseif ($option == 'radio') { ?>
										<label class="radio-inline">
											<input type="radio" name="<?php echo $extension.'_'.$key; ?>" value="1"<?php echo (${$extension.'_'.$key} ? ' checked="checked"' : ''); ?> /><?php echo $text_yes; ?>
										</label>
										<label class="radio-inline">
											<input type="radio" name="<?php echo $extension.'_'.$key; ?>" value=""<?php echo (!${$extension.'_'.$key} ? ' checked="checked"' : ''); ?> /><?php echo $text_no; ?>
										</label>
									<?php } ?>
								</div>
							</div>
						<?php } ?>
					<?php } ?>
					
            	</form>
				<div class="copyright">Get more OpenCart extensions from The Krotek for lower price on <a href="http://thekrotek.com" title="Visit The Krotek site">The Krotek site</a>!</div>            		
          	</div>
      	</div>
    </div>
</div>

<?php echo $footer; ?>