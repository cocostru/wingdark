


<hr>
           <section class="top">
  <div class="section-title">
               <h4><?php echo $heading_title; ?></h4>
               <p>Возможно эти товары вам будут интересны</p>
            </div>


<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="main-tov text-center col-lg-2 col-md-3 col-sm-6 col-xs-12">

      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"  /></a>
        <h2><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
        <?php if ($product['price']) { ?>
       <div class="price-main">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span ><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
        
        </div>
        <?php } ?>

    
  </div>
  <?php } ?>
</div>
   </section>


