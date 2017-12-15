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
    <?php $class = 'col-sm-9'; ?>
    <?php } ?>


    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
     












   


    
      <?php if ($articles) { ?>

        <?php foreach ($articles as $article) { ?>
  <div class="blog-posts">
<div class="blog-title">
<h2><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h2>
 <div class="blog-meta"> <?php echo $article['date']; ?></div>             
</div>
<div class="blog-content">
     <? if ($article['thumb']) { ?>
     <div class="blog-image">
    <a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" class="img-responsive" /></a>
    </div>
      <? } ?>
  <p><?php echo $article['preview']; ?></p>
</div>
 <a class="btn btn-orange" href="<?php echo $article['href']; ?>">подробнее</a>

      </div>








        <?php } ?>

      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$articles) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?>

      </div>






  <?php if ($categories) { ?>
      <?php if (count($categories) <= 5) { ?>
        <div class="col-sm-3">

        <div style="margin-left: 20px;" class="blog-cats">
                      <h3><?php echo $text_refine; ?></h3>

          <ul class="list-unstyled">
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
          </div>
        </div>
      <?php } else { ?>
      <div class="row">
                   <div class="col-sm-3">

              <div style="margin-left: 20px;" class="blog-cats">
                      <h3><?php echo $text_refine; ?></h3>
                      </div>
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>

        <div style="margin-left: 20px;" class="blog-cats">

          <ul class="list-unstyled">
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
          </div>
        
        <?php } ?>
        </div>
      </div>
      <?php } ?>

      <?php } ?>







    <?php echo $column_right; ?></div>
</div>

<?php echo $footer; ?>