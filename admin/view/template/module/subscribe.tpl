<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-subscribe" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <h2>You can say me Thenks by donate  
      <!-- Разместите этот код в том месте, где должен отображаться виджет -->
<div class="ewm-widget-donate" data-guid="5027b543-1091-4259-90f6-604211cb600f" data-type="compact"></div>

<script type="text/javascript">//<!--
(function(w, d, id) {
    w.ewmAsyncWidgets = function() { EWM.Widgets.init(); };
    if (!d.getElementById(id)) {
        var s = d.createElement('script'); s.id = id; s.async = true; s.src = '//events.webmoney.ru/js/ewm-api.js?11';
        (d.getElementsByTagName('head')[0] || d.documentElement).appendChild(s);
    }
})(window, document, 'ewm-js-api');
//--></script></h2>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-subscribe" class="form-horizontal">
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
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                    <?php if ($error_name) { ?>
                    <div class="text-danger"><?php echo $error_name; ?></div>
                    <?php } ?>
                </div>
            </div>


          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $email_text; ?></label>
            <div class="col-sm-10">
                <textarea name="latter_text" class="form-control summernote" id="latter_text_id" cols="70" rows="10"><?php if ($latter_text) {echo $latter_text;?><?php }  ?>
              </textarea>
            </div>
          </div>


          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $button_text; ?></label>
            <div class="col-sm-10">
                <textarea name="sub_button_text" id="sub_button_text" cols="70" rows="10"><?php if ($sub_button_text) {
echo $sub_button_text; ?><?php }  ?>
              </textarea>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $title_text; ?></label>
            <div class="col-sm-10">
                <textarea name="sub_title_text" class="form-control summernote" id="sub_title_text" cols="70" rows="10"><?php if ($sub_title_text) {
                  echo $sub_title_text;?>
                  <?php } ?>
              </textarea>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $sub_thankth_title_field_name; ?></label>
            <div class="col-sm-10">
                <textarea name="sub_thankth_title" id="sub_thankth_title" cols="70" class="form-control summernote" rows="10"><?php if ($sub_thankth_title) {
                  echo $sub_thankth_title;?>
                  <?php }?> 
              </textarea>
            </div>
          </div>

            <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $sub_thankth_field_name; ?></label>
            <div class="col-sm-10">
                <textarea name="sub_thankth_text" class="form-control summernote" id="sub_thankth_text" cols="70" rows="10"><?php if ($sub_thankth_text) {
                  echo $sub_thankth_text;?>
                  <?php } ?>
              </textarea>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $placeholder_title_field_name; ?></label>
            <div class="col-sm-10">
                <textarea name="sub_placeholder_text" class="form-control " id="sub_placeholder_text" cols="70" rows="10"><?php if ($sub_placeholder_text) {
                  echo $sub_placeholder_text;?>
                  <?php }?> 
              </textarea>
            </div>
          </div>


            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $css_title; ?></label>
                <div class="col-sm-10">
                <textarea name="styles" class="form-control " id="styles" cols="70" rows="10"><?php if ($styles) {echo $styles;?><?php }  ?>
              </textarea>
                </div>
            </div>

            //////////////////////////////////////

            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $subscribe_block_styles_field; ?></label>
                <div class="col-sm-10">
                <textarea name="subscribe_block_styles" class="form-control " id="subscribe_block_styles" cols="70" rows="10"><?php if($subscribe_block_styles){echo $subscribe_block_styles;?><?php }  ?>
              </textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $input_styles_field; ?></label>
                <div class="col-sm-10">
                <textarea name="input_styles" class="form-control " id="input_styles" cols="70" rows="10"><?php if($input_styles){echo $input_styles;?><?php }  ?>
              </textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $btn_styles_field; ?></label>
                <div class="col-sm-10">
                <textarea name="btn_styles" class="form-control " id="btn_styles" cols="70" rows="10"><?php if($btn_styles){echo $btn_styles;?><?php }  ?>
              </textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $header_styles_field; ?></label>
                <div class="col-sm-10">
                <textarea name="header_styles" class="form-control " id="header_styles" cols="70" rows="10"><?php if($header_styles){echo $header_styles;?><?php }  ?>
              </textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $subscribe_result_styles_field; ?></label>
                <div class="col-sm-10">
                <textarea name="subscribe_result_styles" class="form-control " id="header_styles" cols="70" rows="10"><?php if($subscribe_result_styles){echo $subscribe_result_styles;?><?php }  ?>
              </textarea>
                </div>
            </div>

        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
