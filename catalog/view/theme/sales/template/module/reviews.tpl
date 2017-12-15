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
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $template; ?>/stylesheet/<?php echo $extension; ?>.css" />


<section class="testi top">
  <div class="section-title">
               <img src="catalog/view/theme/sales/img/i25.png" alt="">
               <h4>Отзывы о товарах</h4>
               <p>Сомневаетесь в выборе, ознакомьтесь с отзывами</p>
            </div>
<div class="row">
   <?php foreach ($products as $product) { ?>
   <div class="product-layout col-lg-4 col-md-6 col-sm-12 col-xs-12">
      <div class="row">
         <div class="col-lg-3 col-md-2 col-sm-3">
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
         </div>
         <div class="col-lg-9 col-md-10 col-sm-9">
            <div class="caption">
               <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
               <?php if ($product['price']) { ?>
               <p class="price-main">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <?php echo $product['special']; ?><span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
               </p>
               <?php } ?>
               <div class="review">
                  <div class="review-meta">
                     <?php if ($product['rating']) { ?>
                     <div class="rating">
                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                        <?php if ($product['rating'] < $i) { ?>
                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } else { ?>
                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                        <?php } ?>
                        <?php } ?>
                     </div>
                     <?php } ?>
                     <span class="review-author"><?php echo $product['review_author']; ?> /</span> <span class="review-date"><?php echo $product['review_date']; ?></span>
                  </div>
                  <div class="review-text"><?php echo $product['review_text']; ?></div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <?php } ?>
</div>
</section>