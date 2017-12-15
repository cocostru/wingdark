<?php echo $header;?><?php echo $column_left; ?>
	<div id="content">
		  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-affiliate" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
			
			 <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
			<form action="<?php $action; ?>" method="post" enctype="multipart/form-data" id="form_license">
				<table class="form">
					<tr>
						<td><?php echo $text_license; ?></td>
						<td><textarea type="text" name="license" placeholder="<?php echo $entry_license; ?>"></textarea></td>
					</tr>
					<tr>
						<td><input type="submit" class="button" value="<?php echo $button_submit; ?>"></td>
					</tr>
					
				</table>
			</form>
			</div></div>
		</div>
	</div>

<?php echo $footer; ?>
