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
    <div class="alert alert-info"><i class="fa fa-exclamation-circle"></i> <?php echo $text_about; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-botid"><?php echo $entry_botid; ?></label>
            <div class="col-sm-10">
              <input type="text" name="telegram_notification_botid" value="<?php echo $telegram_notification_botid; ?>" placeholder="<?php echo $entry_botid; ?>" id="input-botid" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-orders-chat-ids"><?php echo $entry_orders_chat_ids; ?></label>
            <div class="col-sm-10">
              <input type="text" name="telegram_notification_orders_chat_ids" value="<?php echo $telegram_notification_orders_chat_ids; ?>" placeholder="<?php echo $entry_orders_chat_ids; ?>" id="input-orders-chat-ids" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-orders-message-header-format"><?php echo $entry_orders_message_header_format; ?></label>
            <div class="col-sm-10">
              <input type="text" name="telegram_notification_orders_message_header_format" value="<?php echo $telegram_notification_orders_message_header_format; ?>" placeholder="<?php echo $entry_orders_message_header_format; ?>" id="input-orders-message-header-format" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-orders-message-item-format"><?php echo $entry_orders_message_item_format; ?></label>
            <div class="col-sm-10">
              <input type="text" name="telegram_notification_orders_message_item_format" value="<?php echo $telegram_notification_orders_message_item_format; ?>" placeholder="<?php echo $entry_orders_message_item_format; ?>" id="input-orders-message-item-format" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-orders-message-options-format"><?php echo $entry_orders_message_options_format; ?></label>
            <div class="col-sm-10">
              <input type="text" name="telegram_notification_orders_message_options_format" value="<?php echo $telegram_notification_orders_message_options_format; ?>" placeholder="<?php echo $entry_orders_message_options_format; ?>" id="input-orders-message-options-format" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-reviews-chat-ids"><?php echo $entry_reviews_chat_ids; ?></label>
            <div class="col-sm-10">
              <input type="text" name="telegram_notification_reviews_chat_ids" value="<?php echo $telegram_notification_reviews_chat_ids; ?>" placeholder="<?php echo $entry_reviews_chat_ids; ?>" id="input-reviews-chat-ids" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-reviews-message-format"><?php echo $entry_reviews_message_format; ?></label>
            <div class="col-sm-10">
              <input type="text" name="telegram_notification_reviews_message_format" value="<?php echo $telegram_notification_reviews_message_format; ?>" placeholder="<?php echo $entry_reviews_message_format; ?>" id="input-reviews-message-format" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-contact-chat-ids"><?php echo $entry_contact_chat_ids; ?></label>
            <div class="col-sm-10">
              <input type="text" name="telegram_notification_contact_chat_ids" value="<?php echo $telegram_notification_contact_chat_ids; ?>" placeholder="<?php echo $entry_contact_chat_ids; ?>" id="input-contact-chat-ids" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-contact-message-format"><?php echo $entry_contact_message_format; ?></label>
            <div class="col-sm-10">
              <input type="text" name="telegram_notification_contact_message_format" value="<?php echo $telegram_notification_contact_message_format; ?>" placeholder="<?php echo $entry_contact_message_format; ?>" id="input-contact-message-format" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="telegram_notification_status" id="input-status" class="form-control">
                <?php if ($telegram_notification_status) { ?>
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
</div>
<?php echo $footer; ?>