           <section class="top">
  <div class="section-title">
               <img src="catalog/view/theme/sales/img/i24.png" alt="">
               <h4>Новые товары</h4>
               <p>Новые товары в нашем каталоге, не пропустите</p>
            </div>


<div class="row">
  <?php foreach ($products as $product) { ?>

  <div class="main-tov text-center col-lg-2 col-md-4 col-sm-4 col-xs-12">
<div class="aval-product-quantity hidden"><?php echo $product['quantity'];?></div><div class="aval-product-id hidden"><?php echo $product['product_id'];?></div>
      <a href="<?php echo $product['href']; ?>"><img class="img-responsive" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"  /></a>
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


<!-- <div class="row">

      <div class="col-lg-6">
       тут код баннера
      </div>

      <div class="col-lg-6">
       тут код банера
      </div>

  </div> -->

