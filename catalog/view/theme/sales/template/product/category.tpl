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
   <div class="row" style="display:flex; flex-wrap: wrap;">
      <?php echo $column_left; ?>

      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-lg-9 col-md-9 col-sm-9'; ?>
      <?php } else { ?>
      <?php $class = 'col-xs-12'; ?>
      <?php } ?>
      <div id="content" class="<?php echo $class; ?>">
         <?php echo $content_top; ?>
         <div class="cat-desc">
            <div class="row">
               <?php if ($thumb) { ?>
               <div class="col-lg-2 col-md-2 col-sm-3 hidden-xs hidden-sm">
                  <img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-responsive" />
               </div>
               <?php } ?>
               <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                  <h2><?php echo $heading_title; ?></h2>
                  <?php if ($description) { ?>
                  <p><?php echo $description; ?></p>
                  <?php } ?>
               </div>
            </div>
            <hr>
            <?php if ($categories) { ?>
            <h4>Дополнительные разделы</h4>
            <?php if (count($categories) <= 5) { ?>
            <div class="row">
               <?php foreach ($categories as $category) { ?>
               <div class="col-lg-3 col-ms-3 col-sm-6 sub-cat-links"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
               <?php } ?>
            </div>
            <?php } else { ?>
            <div class="row">
               <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
               <?php foreach ($categories as $category) { ?>
               <div class="col-lg-3 col-ms-3 col-sm-6 sub-cat-links"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
               <?php } ?>
               <?php } ?>
            </div>
            <?php } ?>
            <?php } ?>
         </div>
         <?php if ($products) { ?>
         <div class="row">
            <div class="col-md-5 col-sm-6 hidden-xs hidden-sm">
               <?php echo $results; ?>
            </div>
            <div class="col-md-4 col-xs-6">
               <div class="form-group input-group input-group-sm">
                  <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
                  <select id="input-sort" class="form-control" onchange="location = this.value;">
                     <?php foreach ($sorts as $sorts) { ?>
                     <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                     <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                     <?php } else { ?>
                     <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                     <?php } ?>
                     <?php } ?>
                  </select>
               </div>
            </div>

<!-- <div class="row">

      <div class="col-lg-12">
       тут код баннера
      </div>

  </div>
 -->


            <div class="col-md-3 col-xs-6">
               <div class="form-group input-group input-group-sm">
                  <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
                  <select id="input-limit" class="form-control" onchange="location = this.value;">
                     <?php foreach ($limits as $limits) { ?>
                     <?php if ($limits['value'] == $limit) { ?>
                     <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                     <?php } else { ?>
                     <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                     <?php } ?>
                     <?php } ?>
                  </select>
               </div>
            </div>
         </div>
         <div style="display:flex; flex-wrap: wrap;" class="row">
            <?php foreach ($products as $product) { ?>
            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
               <div class="tov">
               <div class="aval-product-quantity hidden"><?php echo $product['quantity'];?></div><div class="aval-product-id hidden"><?php echo $product['product_id'];?></div>
                  <div class="btn-group-vertical button-qik" role="group" aria-label="...">
                     <button data-toggle="tooltip" data-placement="bottom" title="Отложить товар" type="button" class="btn btn-trsp" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-paperclip" aria-hidden="true"></i></button>
                     <button data-toggle="tooltip" data-placement="bottom" title="<?php echo $button_compare; ?>" type="button" class="btn btn-trsp" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-cog" aria-hidden="true"></i></button>
                    <!--  <button data-toggle="tooltip" data-placement="bottom" title="Быстрый просмотр" type="button" class="btn btn-trsp"><i class="fa fa-search" aria-hidden="true"></i></button> -->
                  </div>
                  <?php if ($product['special']) { ?>
                   <div class="ribbon1"><span>Акция</span></div>
    <?php } ?>

                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>

                  
                  <h2><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
                  <?php if ($product['price']) { ?>
                  <div class="price-main">
                     <?php if (!$product['special']) { ?>
                     <?php echo $product['price']; ?>
                     <?php } else { ?>
                     <?php echo $product['special']; ?> <span class="price-old"><?php echo $product['price']; ?></span>
                     <?php } ?>
                  </div>
                  <?php } ?>
                  <!-- <div class="cart-btn">
                     <button class="btn btn-buy" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"> <?php echo $button_cart; ?></button>
                  </div> -->
               </div>
            </div>
            <?php } ?>
         </div>
         <div class="text-center">
            <?php echo $pagination; ?>
         </div>
         <?php } ?>
         <?php if (!$categories && !$products) { ?>
         <p><?php echo $text_empty; ?></p>
         <div class="buttons">
            <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
         </div>
         <?php } ?>


<!--   <div class="row">

      <div class="col-lg-6">
       тут код баннера
      </div>

      <div class="col-lg-6">
       тут код банера
      </div>

  </div> -->
         
         <?php echo $column_right; ?>


      </div>
   </div>
   <?php echo $content_bottom; ?>
</div>
   

<?php echo $footer; ?>
      <link href="catalog/view/theme/sales/css/fuelux.min.css" rel="stylesheet">
   <script src="catalog/view/theme/sales/js/fuelux.min.js"></script>
