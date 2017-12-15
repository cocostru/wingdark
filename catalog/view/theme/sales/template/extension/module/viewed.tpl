<hr>
           <section class="top">
  <div class="section-title">
               <img src="catalog/view/theme/sales/img/i22.png" alt="">
               <h4>Вы смотрели</h4>
               <p>Мы сохранили ваши просмотры для вашего удобства</p>
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


