<?php echo $header; ?>
<style type="text/css">
.body-wrap {
    /*max-width: 100%;*/
    display: none;
}
.body-wrap.body-top {
    display: block;
    /*max-width: 100%;*/
    padding: 21vh 45px 20vh;
}
.mail {
    padding: 4.25vh 0 2.75vh;
    /*margin-top: -25px;*/
    /*max-width: 100%;*/
}
.mail .form-control {
    padding: 20px 45px;
    height: 53px;
    color: #fff;
}
.promo {
    padding: 4vh 10px 3vh;
}
</style>
<div class="body-wrap">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>