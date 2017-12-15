<?php echo $header; ?>
<div class="body-wrap">
        <ul class="breadcrumb" >
    <?php
    $breadcount =count($breadcrumbs)-1;
    foreach ($breadcrumbs as $iterator => $breadcrumb) {
    if ($iterator != $breadcount) {
    echo '<li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="'.$breadcrumb['href'].'" itemprop="url"><span itemprop="title">'.$breadcrumb['text'].'</span></a></li>';
    } else {
    echo '<li itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="end"><a href="'.$breadcrumb['href'].'" itemprop="url"></a><span itemprop="title">'.$breadcrumb['text'].'</span></li>';
    }
    } ?>
      </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <p><?php echo $text_error; ?></p>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
